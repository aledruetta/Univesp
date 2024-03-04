namespace DesignPatterns.Library.AbstractFactory.Products;

public interface IProduct
{
    string Name { get; set; }
    void DoSomething();
}
