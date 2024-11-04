SET PATH_TO_APP=%~dp0..\Valuator\
SET PATH_TO_NGINX=C:\nginx-1.27.2\
SET PATH_TO_RANK_CALCULATOR=%~dp0..\RankCalculator\
SET PATH_TO_NATS_SERVER=%~dp0..\nats-server\

start /d %PATH_TO_APP% dotnet run --no-build --urls "http://localhost:5001"
start /d %PATH_TO_APP% dotnet run --no-build --urls "http://localhost:5002"

start /d %PATH_TO_RANK_CALCULATOR% dotnet run

start /d %PATH_TO_NATS_SERVER% nats-server.exe

start /d %PATH_TO_NGINX% nginx.exe -c "%~dp0..\nginx\conf\nginx.conf"