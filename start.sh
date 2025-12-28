#!/usr/bin/env bash
set -euo pipefail

echo "🧹 Nettoyage des anciens containers/images (optionnel)..."
docker compose down --rmi local --volumes --remove-orphans || true

echo "🔨 Build images (api seulement utile si dev local) ..."
docker compose build --no-cache api nginx

echo "🚀 Démarrage de la stack..."
docker compose up -d

echo "✅ Done. Logs (api):"
docker compose logs --tail=200 -f api
