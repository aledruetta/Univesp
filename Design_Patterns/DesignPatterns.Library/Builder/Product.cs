namespace DesignPatterns.Library.Builder;

public sealed class Product
{
    public string Part1 { get; set; } = "Empty";
    public string Part2 { get; set; } = "Empty";
    public string Part3 { get; set; } = "Empty";

    public override string ToString()
    {
        return $"{Part1}, {Part2}, {Part3}";
    }
}