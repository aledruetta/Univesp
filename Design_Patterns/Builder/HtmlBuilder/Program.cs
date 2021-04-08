using System.Collections.Generic;
using System.Text;
using static System.Console;

namespace HtmlBuilder
{
  class HtmlElement
  {
    public string Name, Text;
    public List<HtmlElement> Children = new List<HtmlElement>();
    private const int indentSize = 2;

    public HtmlElement()
    {
      
    }

    public HtmlElement(string name, string text)
    {
      Name = name;
      Text = text;
    }

    private string ToStringImpl(int indent)
    {
      var sb = new StringBuilder();
      var i = new string(' ', indentSize * indent);
      sb.Append($"{i}<{Name}>\n");
      if (!string.IsNullOrWhiteSpace(Text))
      {
        sb.Append(new string(' ', indentSize * (indent + 1)));
        sb.Append(Text);
        sb.Append("\n");
      }

      foreach (var e in Children)
        sb.Append(e.ToStringImpl(indent + 1));

      sb.Append($"{i}</{Name}>\n");
      return sb.ToString();
    }

    public override string ToString()
    {
      return ToStringImpl(0);
    }
  }

  class HtmlBuilder
  {
    private readonly string _rootName;
    private HtmlElement _root = new HtmlElement();

    public HtmlBuilder(string rootName)
    {
      _rootName = rootName;
      _root.Name = rootName;
    }

    // not fluent
    public void AddChild(string childName, string childText)
    {
      var e = new HtmlElement(childName, childText);
      _root.Children.Add(e);
    }

    public HtmlBuilder AddChildFluent(string childName, string childText)
    {
      var e = new HtmlElement(childName, childText);
      _root.Children.Add(e);

      return this;
    }

    public override string ToString()
    {
      return _root.ToString();
    }

    public void Clear()
    {
      _root = new HtmlElement{Name = _rootName};
    }
  }

  public class Demo
  {
    static void Main(string[] args)
    {
      // if you want to build a simple HTML paragraph using StringBuilder
      var hello = "hello";
      var sb = new StringBuilder();
      sb.Append("<p>");
      sb.Append(hello);
      sb.Append("</p>");
      WriteLine(sb);

      // now I want an HTML list with 2 words in it
      var words = new[] {"hello", "world"};
      sb.Clear();
      sb.Append("<ul>");
      foreach (var word in words)
      {
        sb.AppendFormat("<li>{0}</li>", word);
      }
      sb.Append("</ul>");
      WriteLine(sb);
      sb.Clear();

      // ordinary non-fluent builder
      var ulBuilder = new HtmlBuilder("ul");
      ulBuilder.AddChild("li", "hello");
      ulBuilder.AddChild("li", "world");
      WriteLine(ulBuilder);

      // fluent builder
      ulBuilder.Clear(); // disengage builder from the object it's building, then...
      ulBuilder.AddChildFluent("li", "hello").AddChildFluent("li", "world");
      WriteLine(ulBuilder);
    }
  }
}