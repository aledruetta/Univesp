namespace DesignPatterns.Library.FactoryMethod;

public abstract class Product
{
    public virtual void DoSomething()
    {
        Console.WriteLine("does something standard...");
    }
}