using _1.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace _3.Infrastructure.Persistence.MSSQL.Configuration;

public class ProductsConfiguration : IEntityTypeConfiguration<Products>
{
    public void Configure(EntityTypeBuilder<Products> builder)
    {
        builder
            .HasKey(a => a.Id);
            
        builder
            .Property(m => m.Name)
            .IsRequired()
            .HasMaxLength(50);

        builder
            .Property(m => m.Description)
            .HasMaxLength(255);

        builder
            .ToTable("Products");
    }
}