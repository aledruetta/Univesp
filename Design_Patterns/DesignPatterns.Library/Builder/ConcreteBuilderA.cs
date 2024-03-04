namespace DesignPatterns.Library.Builder;

public sealed class ConcreteBuilderA : Builder
{
    public override void BuildPart1()
    {
        _product.Part1 = "Blue";
    }

    public override void BuildPart2()
    {
        _product.Part2 = "Green";
    }

    public override void BuildPart3()
    {
        _product.Part3 = "Orange";
    }
}