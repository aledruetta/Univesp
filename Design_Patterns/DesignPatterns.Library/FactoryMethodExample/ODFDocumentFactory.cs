namespace DesignPatterns.Library.FactoryMethodExample;

public sealed class ODFDocumentFactory : IDocumentFactory
{
    public IDocument CreateDocument(string? title = null, string? body = null)
    {
        return new ODFDocument(title, body);
    }
}
