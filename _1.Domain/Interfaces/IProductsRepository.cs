using _1.Domain.Entities;

namespace _1.Domain.Interfaces;

public interface IProductsRepository
{
    Task<IEnumerable<Products>> GetAllAsync();
    Task<Products> GetByIdAsync(Guid id);
    Task<Products> AddAsync(Products products);
    Task<Products> UpdateAsync(Guid Id, Products products);
    Task<Products> DeleteAsync(Guid id);
}
