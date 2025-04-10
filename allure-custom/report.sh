#!/bin/bash
# Gera o relatório Allure e aplica as cores da Neurotech

BASE_DIR=$(dirname "$0")/..

# Gera o relatório
allure generate "$BASE_DIR/allure-results" -o "$BASE_DIR/allure-report" --clean

# Copia o CSS customizado separado
cp "$BASE_DIR/allure-custom/styles.css" "$BASE_DIR/allure-report/custom.css"

# Injeta a tag no HTML para carregar o CSS personalizado
# (Antes do fechamento do </head>)
sed -i '' '/<\/head>/i\
<link rel="stylesheet" type="text/css" href="custom.css">
' "$BASE_DIR/allure-report/index.html"