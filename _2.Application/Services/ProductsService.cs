using _2.Application.Interfaces;
using _2.Application.DTOs;
using _1.Domain.Interfaces;
using _2.Application.Common.Models;
using _1.Domain.Entities;

namespace _2.Application.Services;

public class ProductsService : IProductsService
{
    private readonly IProductsRepository _repository;

    public ProductsService(IProductsRepository repository)
    {
        _repository = repository;
    }

    public async Task<Result<IEnumerable<ProductsDto>>> GetAllAsync()
    {
        var products = await _repository.GetAllAsync();
        var dtos = products.Select(p => new ProductsDto
        {
            Id = p.Id,
            Name = p.Name,
            Description = p.Description,
            Price = p.Price
        });

        return Result<IEnumerable<ProductsDto>>.Ok(dtos.ToList(), "Product retrieved successfully");
    }

    public async Task<Result<ProductsDto>> GetByIdAsync(Guid Id)
    {
        var product = await _repository.GetByIdAsync(Id);
        if (product == null) return Result<ProductsDto>.Fail("Product not found");

        var dto = new ProductsDto
        {
            Id = product.Id,
            Name = product.Name,
            Description = product.Description,
            Price = product.Price
        };

        return Result<ProductsDto>.Ok(dto, "Product retrieved successfully");
    }

    public async Task<Result<ProductsDto>> AddAsync(AddProductsDto dto)
    {
        var product = new Products
        {
            Name = dto.Name,
            Description = dto.Description,
            Price = dto.Price
        };

        var result = await _repository.AddAsync(product);

        var productDto = new ProductsDto
        {
            Id = result.Id,
            Name = result.Name,
            Description = result.Description,
            Price = result.Price
        };

        return Result<ProductsDto>.Ok(productDto, "Created successfully");
    }

    public async Task<Result<ProductsDto>> UpdateAsync(Guid Id, AddProductsDto dto)
    {
        var existing = await _repository.GetByIdAsync(Id);
        if (existing == null) return Result<ProductsDto>.Fail("Product not found");

        existing.Name = dto.Name;
        existing.Description = dto.Description;
        existing.Price = dto.Price;

        var updated = await _repository.UpdateAsync(Id, existing);

        var productDto = new ProductsDto
        {
            Id = updated.Id,
            Name = updated.Name,
            Description = updated.Description,
            Price = updated.Price
        };

        return Result<ProductsDto>.Ok(productDto, "Updated successfully");
    }

    public async Task<Result<ProductsDto>> DeleteAsync(Guid Id)
    {
        var existing = await _repository.GetByIdAsync(Id);
        if (existing == null) return Result<ProductsDto>.Fail("Product not found");
        
        var products = await _repository.DeleteAsync(Id);

        var productDto = new ProductsDto
        {
            Id = products.Id,
            Name = products.Name,
            Description = products.Description,
            Price = products.Price
        };

        return Result<ProductsDto>.Ok(productDto, "Deleted successfully");

    }
}
