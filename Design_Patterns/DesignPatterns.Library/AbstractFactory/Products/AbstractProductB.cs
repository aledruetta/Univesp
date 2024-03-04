namespace DesignPatterns.Library.AbstractFactory.Products;

public abstract class AbstractProductB : IProduct
{
    public string Name { get; set; } = null!;
    public abstract void DoSomething();
}
