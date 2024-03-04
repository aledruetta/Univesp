namespace DesignPatterns.Library.Builder;

public sealed class Director
{
    private readonly Builder _builder;
    private readonly char? _chr;

    public Director(Builder builder, char? chr)
    {
        _builder = builder ?? throw new ArgumentNullException(nameof(builder));
        _chr = chr;
    }

    public void Construct()
    {
        switch (_chr)
        {
            case '1':
                _builder.BuildPart1();
                break;
            case '2':
                _builder.BuildPart1();
                _builder.BuildPart2();
                break;
            case '3':
                _builder.BuildPart1();
                _builder.BuildPart2();
                _builder.BuildPart3();
                break;
            default:
                throw new NotImplementedException($"Option is not implemented: '{_chr}'");
        }
    }
}