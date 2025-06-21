using _1.Domain.Common;

namespace _1.Domain.Entities;

public class Products : BaseEntity
{
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public decimal Price { get; set; }
}
