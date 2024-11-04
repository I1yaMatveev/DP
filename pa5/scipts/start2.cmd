cd ..\RankCalculator\
SET DB_RUS=localhost:6000
SET DB_EU=localhost:6001
SET DB_OTHER=localhost:6002
start dotnet run

cd ..\nats-server\
start nats-server.exe

cd ..\EventsLogger\
start dotnet run
start dotnet run

cd ..\Valuator\
SET DB_RUS=localhost:6000
SET DB_EU=localhost:6001
SET DB_OTHER=localhost:6002
start dotnet run --urls "http://localhost:5001"
start dotnet run --urls "http://localhost:5002"

SET PATH_TO_NGINX=C:\nginx-1.27.2\
start /d %PATH_TO_NGINX% nginx.exe -c "%~dp0..\nginx\conf\nginx.conf"