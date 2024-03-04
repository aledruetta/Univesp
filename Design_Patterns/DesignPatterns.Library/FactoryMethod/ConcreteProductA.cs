namespace DesignPatterns.Library.FactoryMethod;

public sealed class ConcreteProductA : Product
{
    public override void DoSomething()
    {
        Console.Write("Product A: ");

        base.DoSomething();
    }
}