#!/bin/bash

# Directorio donde se guardarán los posts
POSTS_DIR="./posts"

# Nombre del post (lo pasas como argumento)
if [ -z "$1" ]; then
  echo "Por favor, escribe un título para el post:"
  read -r TITLE
else
  TITLE="$1"
fi

# Genera una versión slug del título (todo minúsculas y sin espacios)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]' | sed 's/[[:space:]]/-/g')

# Fecha actual en formato Hugo
DATE=$(date +"%Y-%m-%d")

# Ruta completa del archivo
FILENAME="$POSTS_DIR/$DATE-$SLUG.md"

# Crear el archivo con front matter básico
cat <<EOT > "$FILENAME"
---
title: "$TITLE"
date: $(date +"%Y-%m-%d %H:%M:%S")
draft: true
---

Escribe tu contenido aquí...

EOT

# Abrir el archivo con nano (puedes cambiarlo por vim o code)
nano "$FILENAME"

# Confirmación
echo "✅ Post creado en: $FILENAME"
