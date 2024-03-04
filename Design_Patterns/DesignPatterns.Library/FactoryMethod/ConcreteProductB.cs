namespace DesignPatterns.Library.FactoryMethod;

public sealed class ConcreteProductB : Product
{
    public override void DoSomething()
    {
        Console.WriteLine("Product B: does something different...");
    }
}