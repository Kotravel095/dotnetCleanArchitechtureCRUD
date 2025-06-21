using _2.Application.DTOs;
using _2.Application.Interfaces;
using _2.Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace _4.WebApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IProductsService _productsService;

    public ProductsController(IProductsService productsService)
    {
        this._productsService = productsService;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProductsDto>>> GetAllAsync()
    {
        try
        {
            return Ok(await _productsService.GetAllAsync());
        }
        catch(Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpGet("{Id}")]
    public async Task<ActionResult<ProductsDto>> GetByIdAsync(Guid Id)
    {
        try
        {
            return Ok(await _productsService.GetByIdAsync(Id));
        }
        catch(ArgumentException ex)
        {
            return StatusCode(404, ex.Message);
        }
        catch(Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    public async Task<ActionResult<ProductsDto>> AddAsync(AddProductsDto dto)
    {
        try
        {
            return Ok(await _productsService.AddAsync(dto));
        }
        catch(Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPatch]
    public async Task<ActionResult<ProductsDto>> UpdateAsync(Guid Id, AddProductsDto dto)
    {
        try
        {
            return Ok(await _productsService.UpdateAsync(Id,dto));
        }
        catch(ArgumentException ex)
        {
            return StatusCode(404, ex.Message);
        }
        catch(Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpDelete]
    public async Task<ActionResult<ProductsDto>> DeleteAsync(Guid Id)
    {
        try
        {
            return Ok(await _productsService.DeleteAsync(Id));
        }
        catch(ArgumentException ex)
        {
            return StatusCode(404, ex.Message);
        }
        catch(Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

}
