using DesignPatterns.Library.AbstractFactoryExample.Products;

namespace DesignPatterns.Library.AbstractFactoryExample.Factories
{
    public interface IWindowElementFactory
    {
        IWindowElement CreateButton();
        IWindowElement CreateNavBar();
    }
}