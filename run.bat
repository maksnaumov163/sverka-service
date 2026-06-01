@echo off
REM Запуск сервиса на Windows
cd /d "%~dp0"

REM 1. Создать виртуальное окружение (один раз)
if not exist "venv" (
  echo [1/3] Создаю виртуальное окружение...
  python -m venv venv
)

REM 2. Активировать и установить зависимости
call venv\Scripts\activate.bat
echo [2/3] Устанавливаю зависимости (может занять несколько минут при первом запуске)...
python -m pip install --quiet --upgrade pip
pip install --quiet -r requirements.txt

REM 3. Запустить сервер
echo [3/3] Запускаю сервер на http://localhost:8000
echo Откройте этот адрес в браузере. Остановить: Ctrl+C
cd backend
uvicorn main:app --host 0.0.0.0 --port 8000
