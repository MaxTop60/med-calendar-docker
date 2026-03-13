#!/bin/bash
# deploy.sh

echo "🚀 Начинаем деплой..."

# Загружаем переменные окружения
set -a
source .env
set +a

# Обновляем код
git pull --recurse-submodules

# Пересобираем и запускаем контейнеры
docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d --build

# Проверяем статус
docker-compose -f docker-compose.prod.yml ps

echo "✅ Деплой завершен!"