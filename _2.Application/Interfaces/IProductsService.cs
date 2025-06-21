using _2.Application.Common.Models;
using _2.Application.DTOs;

namespace _2.Application.Interfaces;

public interface IProductsService
{
    Task<Result<IEnumerable<ProductsDto>>> GetAllAsync();
    Task<Result<ProductsDto>> GetByIdAsync(Guid id);
    Task<Result<ProductsDto>> AddAsync(AddProductsDto dto);
    Task<Result<ProductsDto>> UpdateAsync(Guid Id, AddProductsDto dto);
    Task<Result<ProductsDto>> DeleteAsync(Guid id);
}
