namespace DesignPatterns.Library.AbstractFactoryExample.Products;

public sealed class NavBarShadowed : NavBar
{
    public override void DoSomething()
    {
        Name = "Shadowed NavBar";
        Console.WriteLine($"Product: {Name}.");
    }
}
