using DesignPatterns.Library.AbstractFactoryExample.Products;

namespace DesignPatterns.Library.AbstractFactoryExample.Factories;

public sealed class ShadowedFactory : IWindowElementFactory
{
    public IWindowElement CreateButton()
    {
        return new ButtonShadowed();
    }

    public IWindowElement CreateNavBar()
    {
        return new NavBarShadowed();
    }
}
