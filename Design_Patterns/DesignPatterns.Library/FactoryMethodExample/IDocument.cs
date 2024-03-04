namespace DesignPatterns.Library.FactoryMethodExample;

public interface IDocument
{
    string? Title { get; set; }
    string? Body { get; set; }

    void Render();
}