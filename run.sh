#!/usr/bin/env bash
# Запуск сервиса на Linux / macOS
set -e

cd "$(dirname "$0")"

# 1. Создать виртуальное окружение (один раз)
if [ ! -d "venv" ]; then
  echo "[1/3] Создаю виртуальное окружение..."
  python3 -m venv venv
fi

# 2. Активировать и установить зависимости
source venv/bin/activate
echo "[2/3] Устанавливаю зависимости (может занять несколько минут при первом запуске)..."
pip install --quiet --upgrade pip
pip install --quiet -r requirements.txt

# 3. Запустить сервер
echo "[3/3] Запускаю сервер на http://localhost:8000"
echo "Откройте этот адрес в браузере. Остановить: Ctrl+C"
cd backend
uvicorn main:app --host 0.0.0.0 --port 8000
