using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using _1.Domain.Entities;
using _1.Domain.Interfaces;
using _2.Application.DTOs;
using _2.Application.Services;
using _2.Application.Common.Models;
using Moq;
using Xunit;

namespace _5.Tests.Application;
public class ProductsServiceTests
{
    private readonly Mock<IProductsRepository> _mockRepository;
    private readonly ProductsService _service;

    public ProductsServiceTests()
    {
        _mockRepository = new Mock<IProductsRepository>();
        _service = new ProductsService(_mockRepository.Object);
    }

    [Fact]
    public async Task GetAllAsync_ShouldReturnListOfProducts()
    {
        // Arrange
        var products = new List<Products>
        {
            new Products { Id = Guid.NewGuid(), Name = "P1", Description = "D1", Price = 10 },
            new Products { Id = Guid.NewGuid(), Name = "P2", Description = "D2", Price = 20 }
        };
        _mockRepository.Setup(r => r.GetAllAsync()).ReturnsAsync(products);

        // Act
        var result = await _service.GetAllAsync();

        // Assert
        Assert.True(result.Success);
        Assert.NotNull(result.Data);
        Assert.Equal(2, result.Data.Count());
        Assert.Equal("Product retrieved successfully", result.Message);
    }

    [Fact]
    public async Task GetByIdAsync_ProductExists_ShouldReturnProduct()
    {
        // Arrange
        var product = new Products { Id = Guid.NewGuid(), Name = "P1", Description = "D1", Price = 10 };
        _mockRepository.Setup(r => r.GetByIdAsync(product.Id)).ReturnsAsync(product);

        // Act
        var result = await _service.GetByIdAsync(product.Id);

        // Assert
        Assert.True(result.Success);
        Assert.NotNull(result.Data);
        Assert.Equal(product.Id, result.Data.Id);
        Assert.Equal("Product retrieved successfully", result.Message);
    }

    [Fact]
    public async Task GetByIdAsync_ProductNotFound_ShouldReturnFail()
    {
        // Arrange
        _mockRepository.Setup(r => r.GetByIdAsync(It.IsAny<Guid>())).ReturnsAsync((Products?)null);

        // Act
        var result = await _service.GetByIdAsync(Guid.NewGuid());

        // Assert
        Assert.False(result.Success);
        Assert.Null(result.Data);
        Assert.Equal("Product not found", result.Message);
    }

    [Fact]
    public async Task AddAsync_ShouldCreateProductAndReturnDto()
    {
        // Arrange
        var addDto = new AddProductsDto { Name = "New Product", Description = "Desc", Price = 50 };
        var createdProduct = new Products { Id = Guid.NewGuid(), Name = addDto.Name, Description = addDto.Description, Price = addDto.Price };
        _mockRepository.Setup(r => r.AddAsync(It.IsAny<Products>())).ReturnsAsync(createdProduct);

        // Act
        var result = await _service.AddAsync(addDto);

        // Assert
        Assert.True(result.Success);
        Assert.NotNull(result.Data);
        Assert.Equal(addDto.Name, result.Data.Name);
        Assert.Equal("Created successfully", result.Message);
    }

    [Fact]
    public async Task UpdateAsync_ProductExists_ShouldUpdateAndReturnDto()
    {
        // Arrange
        var existingProduct = new Products { Id = Guid.NewGuid(), Name = "Old", Description = "Old Desc", Price = 30 };
        var updateDto = new AddProductsDto { Name = "Updated", Description = "Updated Desc", Price = 40 };
        var updatedProduct = new Products { Id = existingProduct.Id, Name = updateDto.Name, Description = updateDto.Description, Price = updateDto.Price };

        _mockRepository.Setup(r => r.GetByIdAsync(existingProduct.Id)).ReturnsAsync(existingProduct);
        _mockRepository.Setup(r => r.UpdateAsync(existingProduct.Id, It.IsAny<Products>())).ReturnsAsync(updatedProduct);

        // Act
        var result = await _service.UpdateAsync(existingProduct.Id, updateDto);

        // Assert
        Assert.True(result.Success);
        Assert.NotNull(result.Data);
        Assert.Equal(updateDto.Name, result.Data.Name);
        Assert.Equal("Updated successfully", result.Message);
    }

    [Fact]
    public async Task UpdateAsync_ProductNotFound_ShouldReturnFail()
    {
        // Arrange
        _mockRepository.Setup(r => r.GetByIdAsync(It.IsAny<Guid>())).ReturnsAsync((Products?)null);

        // Act
        var result = await _service.UpdateAsync(Guid.NewGuid(), new AddProductsDto());

        // Assert
        Assert.False(result.Success);
        Assert.Null(result.Data);
        Assert.Equal("Product not found", result.Message);
    }

    [Fact]
    public async Task DeleteAsync_ProductExists_ShouldDeleteAndReturnDto()
    {
        // Arrange
        var existingProduct = new Products { Id = Guid.NewGuid(), Name = "ToDelete", Description = "Desc", Price = 15 };
        _mockRepository.Setup(r => r.GetByIdAsync(existingProduct.Id)).ReturnsAsync(existingProduct);
        _mockRepository.Setup(r => r.DeleteAsync(existingProduct.Id)).ReturnsAsync(existingProduct);

        // Act
        var result = await _service.DeleteAsync(existingProduct.Id);

        // Assert
        Assert.True(result.Success);
        Assert.NotNull(result.Data);
        Assert.Equal(existingProduct.Name, result.Data.Name);
        Assert.Equal("Deleted successfully", result.Message);
    }

    [Fact]
    public async Task DeleteAsync_ProductNotFound_ShouldReturnFail()
    {
        // Arrange
        _mockRepository.Setup(r => r.GetByIdAsync(It.IsAny<Guid>())).ReturnsAsync((Products?)null);

        // Act
        var result = await _service.DeleteAsync(Guid.NewGuid());

        // Assert
        Assert.False(result.Success);
        Assert.Null(result.Data);
        Assert.Equal("Product not found", result.Message);
    }
}
