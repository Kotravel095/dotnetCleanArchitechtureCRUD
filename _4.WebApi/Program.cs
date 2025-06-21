using _1.Domain.Interfaces;
using _2.Application.Interfaces;
using _2.Application.Services;
using _3.Infrastructure.Persistence.MSSQL.DBContext;
using _3.Infrastructure.Persistence.MSSQL.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddControllers();

var MssqlConnectionString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<MssqlDbContext>(options => 
    options.UseSqlServer(MssqlConnectionString)
        .EnableSensitiveDataLogging()
        .LogTo(Console.WriteLine, LogLevel.Information));

#region Register Service
    
    builder.Services.AddScoped<IProductsService, ProductsService>();
    builder.Services.AddScoped<IProductsRepository, ProductsRepository>();

#endregion

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapControllers();

await SeedDatabase();

app.Run();

async Task SeedDatabase()
{
    using var scope = app.Services.CreateScope();
    var dataContext = scope.ServiceProvider.GetRequiredService<MssqlDbContext>();
    await dataContext.Database.MigrateAsync();
}