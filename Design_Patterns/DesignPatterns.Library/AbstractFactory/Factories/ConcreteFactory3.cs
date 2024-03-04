using DesignPatterns.Library.AbstractFactory.Products;

namespace DesignPatterns.Library.AbstractFactory.Factories;

public sealed class ConcreteFactory3 : IAbstractFactory
{
    public IProduct CreateProductA()
    {
        return new ConcreteProductA1();
    }

    public IProduct CreateProductB()
    {
        return new ConcreteProductB2();
    }
}
