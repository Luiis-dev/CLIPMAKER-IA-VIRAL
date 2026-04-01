@echo off
cd /d "%~dp0"
echo Pasta: %CD%
echo.

echo [1] Movendo .github...
if exist "NLW-OPERATOR-INICIANTE\.github" (
    xcopy "NLW-OPERATOR-INICIANTE\.github" ".github\" /E /I /Y
) else (
    echo AVISO: .github nao encontrado
)

echo.
echo [2] Movendo aulas...
if exist "NLW-OPERATOR-INICIANTE\index_das_aulas" (
    xcopy "NLW-OPERATOR-INICIANTE\index_das_aulas" "aulas\" /E /I /Y
) else (
    echo AVISO: index_das_aulas nao encontrado
)

echo.
echo [3] Copiando arquivos para a raiz...
if exist "NLW-OPERATOR-INICIANTE\index.html" copy "NLW-OPERATOR-INICIANTE\index.html" "index.html"
if exist "NLW-OPERATOR-INICIANTE\README.md" copy "NLW-OPERATOR-INICIANTE\README.md" "README.md"
if exist "NLW-OPERATOR-INICIANTE\LICENSE" copy "NLW-OPERATOR-INICIANTE\LICENSE" "LICENSE"
if exist "NLW-OPERATOR-INICIANTE\.gitattributes" copy "NLW-OPERATOR-INICIANTE\.gitattributes" ".gitattributes"

echo.
echo [4] Removendo NLW-OPERATOR-INICIANTE...
if exist "NLW-OPERATOR-INICIANTE" rd /s /q "NLW-OPERATOR-INICIANTE"

echo.
echo [5] Renomeando EXPLICACAO...
for /d %%D in ("EXPLICA*") do (
    if exist "%%D\index.html" (
        xcopy "%%D" "explicacao\" /E /I /Y
        rd /s /q "%%D"
    )
)

echo.
echo [6] Commit no GitHub...
git add .
git commit -m "refactor: reorganiza estrutura do projeto"
git push

echo.
echo PRONTO!
pause
