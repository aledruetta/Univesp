namespace DesignPatterns.Library.Builder;

public abstract class Builder
{
    protected readonly Product _product = new();

    public abstract void BuildPart1();
    public abstract void BuildPart2();
    public abstract void BuildPart3();

    public virtual Product GetProduct()
    {
        return _product.Part1 is null || _product.Part2 is null || _product.Part3 is null
            ? throw new InvalidOperationException()
            : _product;
    }
}