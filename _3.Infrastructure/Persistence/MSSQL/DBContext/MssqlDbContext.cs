using _1.Domain.Entities;
using _3.Infrastructure.Persistence.MSSQL.Configuration;
using Microsoft.EntityFrameworkCore;

namespace _3.Infrastructure.Persistence.MSSQL.DBContext;

public class MssqlDbContext : DbContext
{
    public MssqlDbContext(DbContextOptions<MssqlDbContext> options) : base(options) {}

    #region DbSet List

    public DbSet<Products> Products { get; set; }

    #endregion

    protected override void OnModelCreating(ModelBuilder builder)
    {
        builder.ApplyConfiguration(new ProductsConfiguration());
    }
}