using DesignPatterns.Library.AbstractFactory.Products;

namespace DesignPatterns.Library.AbstractFactory.Factories;

public sealed class ConcreteFactory4 : IAbstractFactory
{
    public IProduct CreateProductA()
    {
        return new ConcreteProductA2();
    }

    public IProduct CreateProductB()
    {
        return new ConcreteProductB1();
    }
}
