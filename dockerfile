FROM microsoft/aspnetcore-build AS publisher
WORKDIR /app

COPY mycoolsite.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish --no-restore

FROM microsoft/aspnetcore
WORKDIR /app

COPY --from=publisher /app/bin/Debug/netcoreapp2.0/publish .

CMD dotnet bin/Debug/netcoreapp2.0/publish/mycoolsite.dll