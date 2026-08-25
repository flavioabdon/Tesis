#!/bin/zsh
# =============================================================
# compile_and_export.sh
# Compila Thesis.tex y exporta el PDF con fecha/hora al directorio Exports/
# Uso: ./compile_and_export.sh
# =============================================================

# Directorio del proyecto (donde está este script)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Directorio de exportación
EXPORT_DIR="$SCRIPT_DIR/Exports"
mkdir -p "$EXPORT_DIR"

# Nombre del archivo fuente
SOURCE="Thesis"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Compilando $SOURCE.tex ..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Primera pasada (genera .toc, .lof, .lot, .aux)
pdflatex -interaction=nonstopmode "$SOURCE.tex"
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
  echo ""
  echo "❌ Error en la primera pasada de pdflatex (código: $EXIT_CODE)."
  echo "   Revisa el archivo $SOURCE.log para más detalles."
  exit 1
fi

# Segunda pasada (actualiza referencias cruzadas, TOC, etc.)
pdflatex -interaction=nonstopmode "$SOURCE.tex"
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
  echo ""
  echo "❌ Error en la segunda pasada de pdflatex (código: $EXIT_CODE)."
  echo "   Revisa el archivo $SOURCE.log para más detalles."
  exit 1
fi

# Verificar que el PDF fue generado
if [ ! -f "$SOURCE.pdf" ]; then
  echo ""
  echo "❌ No se encontró el archivo $SOURCE.pdf después de la compilación."
  exit 1
fi

# Generar nombre de exportación con fecha y hora: Thesis_DD_MM_AA_HH_MM_SS
TIMESTAMP=$(date +"%d_%m_%y_%H_%M_%S")
EXPORT_NAME="Thesis_${TIMESTAMP}.pdf"
EXPORT_PATH="$EXPORT_DIR/$EXPORT_NAME"

# Copiar el PDF al directorio de exportación
cp "$SOURCE.pdf" "$EXPORT_PATH"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   Compilación exitosa."
echo "   Exportado como:"
echo "     $EXPORT_PATH"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
