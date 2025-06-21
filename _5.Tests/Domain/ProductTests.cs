using System;
using _1.Domain.Entities;
using Xunit;

namespace _5.Tests.Domain;
public class ProductsTests
{
    [Fact]
    public void CreateProduct_ShouldInitializePropertiesCorrectly()
    {
        // Arrange
        string name = "Product A";
        string description = "Description A";
        decimal price = 99.99m;

        // Act
        var product = new Products
        {
            Name = name,
            Description = description,
            Price = price
        };

        // Assert
        Assert.Equal(name, product.Name);
        Assert.Equal(description, product.Description);
        Assert.Equal(price, product.Price);

        // BaseEntity properties
        Assert.NotEqual(Guid.Empty, product.Id);
        Assert.True(product.CreatedAt <= DateTime.UtcNow);
        Assert.True(product.UpdatedAt <= DateTime.UtcNow);
        Assert.True(product.IsActive);
    }

    [Fact]
    public void Id_ShouldBeUniqueForEachInstance()
    {
        // Arrange & Act
        var product1 = new Products();
        var product2 = new Products();

        // Assert
        Assert.NotEqual(product1.Id, product2.Id);
        Assert.NotEqual(Guid.Empty, product1.Id);
        Assert.NotEqual(Guid.Empty, product2.Id);
    }

    [Fact]
    public void CreatedAtAndUpdatedAt_ShouldBeCloseToNow()
    {
        // Arrange & Act
        var before = DateTime.UtcNow;
        var product = new Products();
        var after = DateTime.UtcNow;

        // Assert
        Assert.InRange(product.CreatedAt, before, after);
        Assert.InRange(product.UpdatedAt, before, after);
    }

    [Fact]
    public void IsActive_DefaultsToTrue()
    {
        // Arrange & Act
        var product = new Products();

        // Assert
        Assert.True(product.IsActive);
    }

    // ถ้าต้องการเพิ่ม validation logic (เช่น ห้ามตั้งชื่อเป็น null หรือ empty)
    // สามารถเขียน unit test เพิ่มเติมได้เมื่อมีการ implement validation
}
