using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;

namespace JazzApi.Models
{
    public class JazzContext : DbContext
    {
        public JazzContext(DbContextOptions<JazzContext> options) : base(options)
        {
        }

        public DbSet<JazzAuthor> JazzAuthorsDbContext { get; set; } = null!;
    }
}