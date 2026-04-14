@echo off
echo ===============================
echo Iniciando Atlas Wealth...
echo ===============================

cd /d %~dp0

SET PYTHON=.venv\Scripts\python.exe

REM Se não existir venv, cria
IF NOT EXIST %PYTHON% (
    echo Criando ambiente virtual...
    py -3 -m venv .venv
)

echo Ativando ambiente...

echo Atualizando pip...
%PYTHON% -m pip install --upgrade pip

echo Instalando dependencias...
%PYTHON% -m pip install -r requirements.txt

echo ===============================
echo Subindo servidor...
echo ===============================

start http://127.0.0.1:8000

%PYTHON% -m uvicorn app.main:app --host 127.0.0.1 --port 8000

pause