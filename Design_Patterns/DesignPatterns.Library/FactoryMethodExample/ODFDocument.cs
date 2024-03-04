namespace DesignPatterns.Library.FactoryMethodExample;

public sealed class ODFDocument : IDocument
{
    public ODFDocument(string? title, string? body)
    {
        Title = title;
        Body = body;
    }

    public string? Title { get; set; }
    public string? Body { get; set; }

    public void Render()
    {
        Console.WriteLine("ODF rendering...");
        Console.WriteLine($"Title: {Title}");
        Console.WriteLine($"{Body}{Environment.NewLine}");
    }
}