using DesignPatterns.Library.AbstractFactoryExample.Products;

namespace DesignPatterns.Library.AbstractFactoryExample.Factories;

public sealed class FlatFactory : IWindowElementFactory
{
    public IWindowElement CreateButton()
    {
        return new ButtonFlat();
    }

    public IWindowElement CreateNavBar()
    {
        return new NavBarFlat();
    }
}
