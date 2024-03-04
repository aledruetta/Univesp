namespace DesignPatterns.Library.AbstractFactoryExample.Products;

public sealed class ButtonFlat : Button
{
    public override void DoSomething()
    {
        Name = "Flat Button";
        Console.WriteLine($"Product: {Name}.");
    }
}
