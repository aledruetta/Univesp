namespace DesignPatterns.Library.AbstractFactory.Products;

public sealed class ConcreteProductB2 : AbstractProductB
{
    public override void DoSomething()
    {
        Name = "Concrete Product B2";
        Console.WriteLine($"Product: {Name}.");
    }
}
