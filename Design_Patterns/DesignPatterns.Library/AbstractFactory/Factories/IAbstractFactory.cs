using DesignPatterns.Library.AbstractFactory.Products;

namespace DesignPatterns.Library.AbstractFactory.Factories
{
    public interface IAbstractFactory
    {
        IProduct CreateProductA();
        IProduct CreateProductB();
    }
}