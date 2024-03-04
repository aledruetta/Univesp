namespace DesignPatterns.Library.AbstractFactory.Products;

public sealed class ConcreteProductB1 : AbstractProductB
{
    public override void DoSomething()
    {
        Name = "Concrete Product B1";
        Console.WriteLine($"Product: {Name}.");
    }
}
