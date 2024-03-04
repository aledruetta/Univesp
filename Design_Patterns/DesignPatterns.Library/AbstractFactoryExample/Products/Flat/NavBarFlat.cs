namespace DesignPatterns.Library.AbstractFactoryExample.Products;

public sealed class NavBarFlat : NavBar
{
    public override void DoSomething()
    {
        Name = "Flat NavBar";
        Console.WriteLine($"Product: {Name}.");
    }
}
