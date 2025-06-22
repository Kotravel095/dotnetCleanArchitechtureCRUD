#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["_4.WebApi/_4.WebApi.csproj", "_4.WebApi/"]
COPY ["_3.Infrastructure/_3.Infrastructure.csproj", "_3.Infrastructure/"]
COPY ["_2.Application/_2.Application.csproj", "_2.Application/"]
COPY ["_1.Domain/_1.Domain.csproj", "_1.Domain/"]
RUN dotnet restore "_4.WebApi/_4.WebApi.csproj"
COPY . .
WORKDIR "/src/_4.WebApi"
RUN dotnet build "_4.WebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "_4.WebApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "_4.WebApi.dll"]