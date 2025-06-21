namespace _2.Application.Common.Exceptions;

public class NotFoundException : Exception
{
    public string Code { get; }

    public NotFoundException(string entityName, object key)
        : base($"{entityName} with key '{key}' was not found.")
    {
        Code = "ERR_NOT_FOUND";
    }
}
