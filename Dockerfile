FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as Build-env
WORKDIR /app

COPY Tailspin.SpaceGame.Web/*.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=Build-env /app/out .
ENTRYPOINT [ "dotnet", "Tailspin.SpaceGame.Web.dll" ]

