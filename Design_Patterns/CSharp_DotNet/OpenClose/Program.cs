using System;
using System.Collections.Generic;

namespace OpenClose
{
    public enum Color
    {
        Red, Blue, Green, Yellow
    }

    public enum Size
    {
        Small, Medium, Large, Huge
    }

    public class Product
    {
        public string Name;
        public Color Color;
        public Size Size;

        public Product(string name, Color color, Size size)
        {
            Name = name;
            Color = color;
            Size = size;
        }
    }

    public interface ISpecification<T>
    {
        bool IsSatisfied(T t);
    }

    public interface IFilter<T>
    {
        IEnumerable<T> Filter(IEnumerable<T> items, ISpecification<T> spec);
    }

    public class ColorSpecification : ISpecification<Product>
    {
        private Color _color;

        public ColorSpecification(Color color)
        {
            _color = color;
        }

        public bool IsSatisfied(Product p)
        {
            return p.Color == _color;
        }
    }

    public class SizeSpecification : ISpecification<Product>
    {
        private Size _size;

        public SizeSpecification(Size size)
        {
            _size = size;
        }

        public bool IsSatisfied(Product p)
        {
            return p.Size == _size;
        }
    }

    public class BetterFilter : IFilter<Product>
    {
        public IEnumerable<Product> Filter(IEnumerable<Product> items, ISpecification<Product> spec)
        {
            foreach (var p in items)
                if (spec.IsSatisfied(p))
                    yield return p;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var apple = new Product("Apple", Color.Red, Size.Small);
            var tree = new Product("Tree", Color.Green, Size.Medium);
            var house = new Product("House", Color.Blue, Size.Huge);
            var car = new Product("Car", Color.Yellow, Size.Medium);

            Product[] products = {apple, tree, house, car};

            var BetterFilter = new BetterFilter();

            var greenSpecification = new ColorSpecification(Color.Green);
            var mediumSpecification = new SizeSpecification(Size.Medium);

            var greenProducts = BetterFilter.Filter(products, greenSpecification);
            var mediumProducts = BetterFilter.Filter(products, mediumSpecification);

            foreach (var p in greenProducts) Console.WriteLine($"{p.Name} is {p.Color}");
            foreach (var p in mediumProducts) Console.WriteLine($"{p.Name} is {p.Size}");
        }
    }
}
