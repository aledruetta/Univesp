namespace DesignPatterns.Library.FactoryMethodExample;

public interface IDocumentFactory
{
    IDocument CreateDocument(string? title = null, string? body = null);
}
