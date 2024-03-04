
namespace DesignPatterns.Library.Builder;

public sealed class ConcreteBuilderB : Builder
{
    public override void BuildPart1()
    {
        _product.Part1 = "Apple";
    }

    public override void BuildPart2()
    {
        _product.Part2 = "Watermelon";
    }

    public override void BuildPart3()
    {
        _product.Part3 = "Bananas";
    }
}