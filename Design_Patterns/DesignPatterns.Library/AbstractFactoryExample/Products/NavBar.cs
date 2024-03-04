namespace DesignPatterns.Library.AbstractFactoryExample.Products;

public abstract class NavBar : IWindowElement
{
    public string Name { get; set; } = null!;
    public abstract void DoSomething();
}
