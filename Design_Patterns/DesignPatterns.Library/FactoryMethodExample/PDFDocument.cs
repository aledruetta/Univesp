namespace DesignPatterns.Library.FactoryMethodExample;

public sealed class PDFDocument : IDocument
{
    public PDFDocument(string? title, string? body)
    {
        Title = title;
        Body = body;
    }

    public string? Title { get; set; }
    public string? Body { get; set; }

    public void Render()
    {
        Console.WriteLine("PDF rendering...");
        Console.WriteLine($"Title: {Title}");
        Console.WriteLine($"{Body}");
    }
}