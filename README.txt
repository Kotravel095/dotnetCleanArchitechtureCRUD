#SET ENVIRONMENT
export ASPNETCORE_ENVIRONMENT=Development

##CREATE MIGRATION
    dotnet ef migrations add CreateTableProducts --project _3.Infrastructure --startup-project _4.WebApi

##APPLY MIGRATION
    dotnet ef database update --project _3.Infrastructure --startup-project _4.WebApi