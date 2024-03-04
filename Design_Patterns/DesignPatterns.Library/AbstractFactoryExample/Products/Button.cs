namespace DesignPatterns.Library.AbstractFactoryExample.Products;

public abstract class Button : IWindowElement
{
    public string Name { get; set; } = null!;
    public abstract void DoSomething();
}
