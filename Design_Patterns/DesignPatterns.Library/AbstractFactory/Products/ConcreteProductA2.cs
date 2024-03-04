namespace DesignPatterns.Library.AbstractFactory.Products;

public sealed class ConcreteProductA2 : AbstractProductA
{
    public override void DoSomething()
    {
        Name = "Concrete Product A2";
        Console.WriteLine($"Product: {Name}.");
    }
}
