namespace DesignPatterns.Library.FactoryMethod;

public sealed class ConcreteCreatorB : Creator
{
    public override Product FactoryMethod()
    {
        return new ConcreteProductB();
    }
}