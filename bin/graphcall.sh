#!/usr/bin/env bash
set -euo pipefail

VENV_DIR="${PYAN_VENV:-/home/zak/.pyenv/versions/pyan3}"


output_gv="$(mktemp /tmp/pyan.XXXXXX.gv)"
output2_gv="$(mktemp /tmp/pyan.XXXXXX.fixed.gv)"
output_png="$(mktemp /tmp/pyan.XXXXXX.png)"
safe_list0="$(mktemp /tmp/pyan.XXXXXX.safe.files0)"
wrapper="$(mktemp /tmp/pyan.XXXXXX.wrapper.sh)"

cleanup() { rm -f "$output_gv" "$output2_gv" "$safe_list0" "$wrapper"; }
trap cleanup EXIT INT TERM

command -v dot >/dev/null 2>&1 || {
    echo "ERRO: 'dot' (graphviz) não encontrado" >&2; exit 1;
}

# Define comando base dentro do env
if [ -x "$VENV_DIR/bin/pyan3" ]; then
    PYAN_INVOKE=( "$VENV_DIR/bin/pyan3" )
elif [ -x "$VENV_DIR/bin/python" ]; then
    PYAN_INVOKE=( "$VENV_DIR/bin/python" -m pyan3 )
else
    echo "ERRO: env inválido: $VENV_DIR (não achei bin/pyan3 nem bin/python)" >&2
    exit 1
fi

# Wrapper executável para o xargs (não depende de função)
cat > "$wrapper" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
# PYAN_INVOKE_STR vem do script pai
eval "$PYAN_INVOKE_STR" \
    --colored \
    --dot-rankdir LR \
    --no-defines \
    --grouped \
    --nested-groups \
    --dot \
    "$@"
EOF
chmod +x "$wrapper"

# Serializa o comando base para o wrapper (seguro o bastante aqui)
PYAN_INVOKE_STR=""
for part in "${PYAN_INVOKE[@]}"; do
    PYAN_INVOKE_STR+=$(printf '%q ' "$part")
done
export PYAN_INVOKE_STR

# Remove --dot dos args do usuário (o script já controla)
USER_ARGS=()
for a in "$@"; do
    [ "$a" = "--dot" ] || USER_ARGS+=("$a")
done

echo '------------------------------------------------------------------------'
if [ ${#USER_ARGS[@]} -eq 0 ]; then
    echo "Fonte: find . -type f -name '*.py'"
else
    echo "Fonte: args: ${USER_ARGS[*]}"
fi
echo '------------------------------------------------------------------------'

if [ ${#USER_ARGS[@]} -eq 0 ]; then
    mapfile -d '' FILES < <(
        find . -type f -name '*.py' \
            -not -path '*/.venv/*' \
            -not -path '*/venv/*' \
            -not -path '*/__pycache__/*' \
            -not -path '*/.mypy_cache/*' \
            -not -path '*/.pytest_cache/*' \
            -print0
    )

    skipped=0
    for f in "${FILES[@]}"; do
        if "$wrapper" "$f" >/dev/null 2>&1; then
            printf '%s\0' "$f" >> "$safe_list0"
        else
            printf "SKIP (pyan3 falhou): %s\n" "$f" >&2
            skipped=$((skipped+1))
        fi
    done

    [ -s "$safe_list0" ] || {
        echo "ERRO: nada para gerar (todos falharam)." >&2; exit 1;
    }

    xargs -0 "$wrapper" < "$safe_list0" > "$output_gv"

    [ $skipped -eq 0 ] || echo "Aviso: $skipped arquivo(s) ignorados." >&2
else
    "$wrapper" "${USER_ARGS[@]}" > "$output_gv"
fi

sed -r 's/([a-zA-Z0-9])-+([a-zA-Z0-9])/\1_\2/g' "$output_gv" > "$output2_gv"
dot -Tpng "$output2_gv" -o "$output_png"

if command -v sxiv >/dev/null 2>&1; then
  sxiv "$output_png" &
elif command -v imv >/dev/null 2>&1; then
  imv "$output_png" &
elif command -v xdg-open >/dev/null 2>&1; then
  xdg-open "$output_png" >/dev/null 2>&1 &
else
  echo "PNG gerado em: $output_png"
fi
