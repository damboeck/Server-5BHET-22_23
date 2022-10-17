@echo off

call mvn install -DinteractiveMode=false -DskipTests
IF %ERRORLEVEL% EQU 0 (echo Service packaged)  ELSE goto BUILDFAIL

set image=server5b22

docker rmi %image% --force
docker build -t %image% .
IF %ERRORLEVEL% EQU 0 (echo docker service built)  ELSE goto BUILDFAIL

cd server5b22
docker compose down
IF %ERRORLEVEL% EQU 0 (echo docker setupservice built)  ELSE goto BUILDFAIL
docker compose up -d
IF %ERRORLEVEL% EQU 0 (echo docker setupservice built)  ELSE goto BUILDFAIL

echo sleep
powershell -Executionpolicy Bypass -Command "sleep 3"

echo BUILD fertig!
goto FIN
rem ------------------------------
:BUILDFAIL
echo BUILD fehlerhaft - Abbruch!
exit 1
goto FIN
rem ------------------------------
:FIN
