@chcp 65001 >nul
@echo off
setlocal enabledelayedexpansion

echo ============================================
echo Iniciando separação de arquivos...
echo ============================================
echo.

:: Caminho base: pasta onde está o .bat
set "BASE_DIR=%~dp0"
set "PASTA_ORIGEM=%BASE_DIR%Origem"
set "PASTA_DESTINO=%BASE_DIR%Destino"
set "ARQUIVOS_POR_PASTA=2000"

:: Verifica e cria pastas se necessário
set "CRIOU_PASTA=0"

if not exist "%PASTA_ORIGEM%" (
    mkdir "%PASTA_ORIGEM%"
    echo [INFO] Pasta de origem criada: %PASTA_ORIGEM%
    set "CRIOU_PASTA=1"
)

if not exist "%PASTA_DESTINO%" (
    mkdir "%PASTA_DESTINO%"
    echo [INFO] Pasta de destino criada: %PASTA_DESTINO%
    set "CRIOU_PASTA=1"
)

:: Se foi necessário criar alguma pasta, avisa o usuário e encerra
if "%CRIOU_PASTA%"=="1" (
    echo.
    echo ============================================
    echo As pastas necessárias foram criadas.
    echo Coloque os arquivos que deseja separar em:
    echo    %PASTA_ORIGEM%
    echo Depois, execute este script novamente.
    echo ============================================
    echo.
    pause
    exit /b
)


echo ============================================
echo Pasta base: %BASE_DIR%
echo Pasta de origem: %PASTA_ORIGEM%
echo Pasta de destino: %PASTA_DESTINO%
echo Arquivos por pasta: %ARQUIVOS_POR_PASTA%
echo ============================================


:: Conta total de arquivos
set /a TOTAL_ARQUIVOS=0
for %%F in ("%PASTA_ORIGEM%\*") do (
    set /a TOTAL_ARQUIVOS+=1
)

echo Total de arquivos encontrados: !TOTAL_ARQUIVOS!
if !TOTAL_ARQUIVOS! EQU 0 (
    echo Nenhum arquivo encontrado na pasta de origem.
    echo Coloque arquivos em "%PASTA_ORIGEM%" e execute o script novamente.
    pause
    exit /b
)

:: Inicializa contadores
set /a COUNT=0
set /a PASTA_INDEX=1
set /a ARQUIVOS_NA_PASTA_ATUAL=0

:: Cria primeira pasta de destino
set "PASTA_ATUAL=%PASTA_DESTINO%\saida_!PASTA_INDEX!"
mkdir "!PASTA_ATUAL!" >nul 2>&1
echo Criando pasta: !PASTA_ATUAL!

:: Itera sobre arquivos
for %%F in ("%PASTA_ORIGEM%\*") do (
    set /a COUNT+=1
    set /a ARQUIVOS_NA_PASTA_ATUAL+=1

    if !ARQUIVOS_NA_PASTA_ATUAL! GTR %ARQUIVOS_POR_PASTA% (
        echo Pasta !PASTA_INDEX! finalizada com %ARQUIVOS_POR_PASTA% arquivos.
        set /a PASTA_INDEX+=1
        set /a ARQUIVOS_NA_PASTA_ATUAL=1
        set "PASTA_ATUAL=%PASTA_DESTINO%\saida_!PASTA_INDEX!"
        mkdir "!PASTA_ATUAL!" >nul 2>&1
        echo Criando nova pasta: !PASTA_ATUAL!
    )

    move "%%F" "!PASTA_ATUAL!\" >nul
    echo Movido: %%~nxF → !PASTA_ATUAL!
)

:: Última pasta
if !ARQUIVOS_NA_PASTA_ATUAL! LEQ %ARQUIVOS_POR_PASTA% (
    echo Pasta !PASTA_INDEX! finalizada com !ARQUIVOS_NA_PASTA_ATUAL! arquivos.
)

:: Fim
echo.
echo ============================================
echo PROCESSO CONCLUÍDO!
echo Total de arquivos movidos: !TOTAL_ARQUIVOS!
echo Total de pastas criadas: !PASTA_INDEX!
echo ============================================
pause
