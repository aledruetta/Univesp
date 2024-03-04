namespace DesignPatterns.Library.AbstractFactoryExample.Products;

public sealed class ButtonShadowed : Button
{
    public override void DoSomething()
    {
        Name = "Shadowed Button";
        Console.WriteLine($"Product: {Name}.");
    }
}
