using DesignPatterns.Library.AbstractFactory.Products;

namespace DesignPatterns.Library.AbstractFactory.Factories;

public sealed class ConcreteFactory1 : IAbstractFactory
{
    public IProduct CreateProductA()
    {
        return new ConcreteProductA1();
    }

    public IProduct CreateProductB()
    {
        return new ConcreteProductB1();
    }
}
