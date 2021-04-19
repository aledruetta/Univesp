using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using SamuraiApp.Data;
using SamuraiApp.Domain;

namespace SamuraiApp.UI
{
    class Program
    {
        private static SamuraiContext _context = new SamuraiContext();

        static void Main(string[] args)
        {
            _context.Database.EnsureCreated();

            AddSamurai();
            GetSamurais();
            Console.Write("Press any key...");
            Console.ReadKey();
        }

        private static void AddSamurai()
        {
            var samurai = new Samurai { Name = "Sampson" };
            _context.Samurais.Add(samurai);
            _context.SaveChanges();
        }

        private static void GetSamurais(string text="")
        {
            var samurais = _context.Samurais
            .TagWith("SamuraiApp.UI.Program.GetSamurais method")
            .ToList();

            Console.WriteLine($"{text}: Samurai count is {samurais.Count}");

            foreach (var samurai in samurais)
            {
                Console.WriteLine(samurai.Name);
            }
        }
    }
}
