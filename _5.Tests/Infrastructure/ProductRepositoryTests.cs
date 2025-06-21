using System;
using System.Linq;
using System.Threading.Tasks;
using _1.Domain.Entities;
using _3.Infrastructure.Persistence.MSSQL.DBContext;
using _3.Infrastructure.Persistence.MSSQL.Repositories;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace _5.Tests.Infrastructure;
public class ProductsRepositoryTests : IDisposable
{
    private readonly MssqlDbContext _context;
    private readonly ProductsRepository _repository;

    public ProductsRepositoryTests()
    {
        var options = new DbContextOptionsBuilder<MssqlDbContext>()
            .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString()) // สร้าง DB ใหม่ทุกครั้ง
            .Options;

        _context = new MssqlDbContext(options);
        _repository = new ProductsRepository(_context);
    }

    public void Dispose()
    {
        _context.Dispose();
    }

    [Fact]
    public async Task AddAsync_ShouldAddProduct()
    {
        var product = new Products
        {
            Name = "Test Product",
            Description = "Test Description",
            Price = 100
        };

        var result = await _repository.AddAsync(product);

        Assert.NotNull(result);
        Assert.Equal(product.Name, result.Name);
        Assert.Equal(1, await _context.Products.CountAsync());
    }

    [Fact]
    public async Task GetAllAsync_ShouldReturnAllProducts()
    {
        // Arrange
        _context.Products.Add(new Products { Name = "P1", Description = "D1", Price = 10 });
        _context.Products.Add(new Products { Name = "P2", Description = "D2", Price = 20 });
        await _context.SaveChangesAsync();

        // Act
        var result = await _repository.GetAllAsync();

        // Assert
        Assert.NotNull(result);
        Assert.Equal(2, result.Count());
    }

    [Fact]
    public async Task GetByIdAsync_ShouldReturnProduct_WhenExists()
    {
        var product = new Products
        {
            Name = "P1",
            Description = "D1",
            Price = 10
        };
        _context.Products.Add(product);
        await _context.SaveChangesAsync();

        var result = await _repository.GetByIdAsync(product.Id);

        Assert.NotNull(result);
        Assert.Equal(product.Name, result.Name);
    }

    [Fact]
    public async Task GetByIdAsync_ShouldReturnNull_WhenNotExists()
    {
        var result = await _repository.GetByIdAsync(Guid.NewGuid());

        Assert.Null(result);
    }

    [Fact]
    public async Task UpdateAsync_ShouldUpdateProduct_WhenExists()
    {
        var product = new Products
        {
            Name = "P1",
            Description = "D1",
            Price = 10
        };
        _context.Products.Add(product);
        await _context.SaveChangesAsync();

        var updatedProduct = new Products
        {
            Name = "Updated P1",
            Description = "Updated D1",
            Price = 15
        };

        var result = await _repository.UpdateAsync(product.Id, updatedProduct);

        Assert.NotNull(result);
        Assert.Equal("Updated P1", result.Name);
        Assert.Equal("Updated D1", result.Description);
        Assert.Equal(15, result.Price);
    }

    [Fact]
    public async Task UpdateAsync_ShouldReturnNull_WhenNotExists()
    {
        var updatedProduct = new Products
        {
            Name = "Updated P1",
            Description = "Updated D1",
            Price = 15
        };

        var result = await _repository.UpdateAsync(Guid.NewGuid(), updatedProduct);

        Assert.Null(result);
    }

    [Fact]
    public async Task DeleteAsync_ShouldDeleteProduct_WhenExists()
    {
        var product = new Products
        {
            Name = "P1",
            Description = "D1",
            Price = 10
        };
        _context.Products.Add(product);
        await _context.SaveChangesAsync();

        var result = await _repository.DeleteAsync(product.Id);

        Assert.NotNull(result);
        Assert.Equal(product.Id, result.Id);
        Assert.Empty(_context.Products); // ต้องลบแล้ว
    }

    [Fact]
    public async Task DeleteAsync_ShouldReturnNull_WhenNotExists()
    {
        var result = await _repository.DeleteAsync(Guid.NewGuid());

        Assert.Null(result);
    }
}
