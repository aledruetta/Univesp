namespace DesignPatterns.Library.FactoryMethod;

public sealed class ConcreteCreatorA : Creator
{
    public override Product FactoryMethod()
    {
        return new ConcreteProductA();
    }
}