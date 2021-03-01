using System;
using System.IO;
using System.Collections.Generic;

namespace SingleResponsability
{
    class Journal
    {
        private readonly List<string> entries = new List<string>();
        private static int count = 0;


        public int AddEntry(string text)
        {
           entries.Add($"{++count}: {text}");
           return count;
        }

        public void RemoveEntry(int index)
        {
            entries.RemoveAt(index);
        }

        public override string ToString()
        {
            return string.Join(Environment.NewLine, entries);
        }
    }

    static class Persistance
    {
        public static void SaveToFile(Journal j, string filename, bool overwrite = false)
        {
            if (overwrite || !File.Exists(filename))
            {
                File.WriteAllText(filename, j.ToString());
            }
        }

        public static string ReadFromfile(string filename)
        {
            string content;

            try
            {
                content = File.ReadAllText(filename);
            }
            catch
            {
                return "";
            }

            return content;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var j = new Journal();
            j.AddEntry("aaaa");
            j.AddEntry("bbb");
            Console.WriteLine(j);

            string filename = @"/home/alejandro/Devel/test/entries.txt";
            Persistance.SaveToFile(j, filename);
            Console.WriteLine(Persistance.ReadFromfile(filename));
        }
    }
}
