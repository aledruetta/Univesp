namespace DesignPatterns.Library.AbstractFactory.Products;

public sealed class ConcreteProductA1 : AbstractProductA
{
    public override void DoSomething()
    {
        Name = "Concrete Product A1";
        Console.WriteLine($"Product: {Name}.");
    }
}
