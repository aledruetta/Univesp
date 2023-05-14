using System;
using System.Collections.Generic;
using System.Linq;

public static class Program
{
    public static void Main()
    {
        var strings = new List<string> { "one", "two", "three", "four", "five" };
        var filtered = strings.FilterByLength(4);
        foreach (var s in filtered)
        {
            Console.WriteLine(s);
        }
        var count = strings.Count(s => s.Length >= 4);
        var any = strings.Any(s => s.Length >= 4);
        Console.WriteLine("Count: " + count);
        Console.WriteLine("Any: " + any);
    }
}

public static class StringExtensions
{
    public static IEnumerable<string> FilterByLength(this IEnumerable<string> source, int length)
    {
        return source.Where(s => s.Length >= length);
    }
}