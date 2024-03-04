namespace DesignPatterns.Library.FactoryMethodExample;

public sealed class PDFDocumentFactory : IDocumentFactory
{
    public IDocument CreateDocument(string? title = null, string? body = null)
    {
        return new PDFDocument(title, body);
    }
}
