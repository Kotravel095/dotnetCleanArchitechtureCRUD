using _1.Domain.Entities;
using _1.Domain.Interfaces;
using _2.Application.Common.Exceptions;
using _2.Application.Common.Models;
using _3.Infrastructure.Persistence.MSSQL.DBContext;
using Microsoft.EntityFrameworkCore;

namespace _3.Infrastructure.Persistence.MSSQL.Repositories;

public class ProductsRepository : IProductsRepository
{
    private readonly MssqlDbContext _context;

    public ProductsRepository(MssqlDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<Products>> GetAllAsync()
    {
        return await _context.Products.AsNoTracking().ToListAsync();
    }

    public async Task<Products?> GetByIdAsync(Guid Id)
    {
        return await _context.Products.FindAsync(Id);
    }

    public async Task<Products> AddAsync(Products products)
    {
        await _context.Products.AddAsync(products);
        await _context.SaveChangesAsync();
        return products;
    }

    public async Task<Products?> UpdateAsync(Guid Id, Products updatedProduct)
    {
        var existingProduct = await _context.Products.FindAsync(Id);
        if (existingProduct == null) return null;

        existingProduct.Name = updatedProduct.Name;
        existingProduct.Description = updatedProduct.Description;
        existingProduct.Price = updatedProduct.Price;
        existingProduct.UpdatedAt = DateTime.UtcNow;

        _context.Products.Update(existingProduct);
        await _context.SaveChangesAsync();

        return existingProduct;
    }

    public async Task<Products?> DeleteAsync(Guid Id)
    {
        var product = await _context.Products.FindAsync(Id);
        if (product == null) return null;
        _context.Products.Remove(product);
        await _context.SaveChangesAsync();
        return product;
    }
}