namespace DesignPatterns.Library.AbstractFactory.Products;

public abstract class AbstractProductA : IProduct
{
    public string Name { get; set; } = null!;
    public abstract void DoSomething();
}
