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

            // AddSamuraisByName("Shimada", "Okamoto", "Kikuchio", "Hayashida");
            // AddVariousTypes();
            // GetSamurais();
            QueryFilters();
        }

        private static void AddVariousTypes()
        {
            _context.AddRange(
                new Samurai { Name = "Kurosawa" },
                new Samurai { Name = "Toshiro" },
                new Battle { Name = "Battle of Hiroshima" },
                new Battle { Name = "Battle of Nagasaki" }
            );
            _context.SaveChanges();
        }

        private static void AddSamuraisByName(params string[] names)
        {
            foreach (string name in names)
            {
                _context.Samurais.Add(new Samurai { Name =  name });
            }
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

        private static void QueryFilters()
        {
            var expr = "O%";
            var samurais = _context.Samurais.Where(s => EF.Functions.Like(s.Name, expr)).ToList();

            var name = "Sampson";
            var samurai1 = _context.Samurais.FirstOrDefault(s => s.Name == name);

            var id = 3;
            var samurai2 = _context.Samurais.Find(id);
        }
    }
}
