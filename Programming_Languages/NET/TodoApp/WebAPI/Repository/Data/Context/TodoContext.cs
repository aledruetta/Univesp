using Microsoft.EntityFrameworkCore;

namespace WebAPI.Repository.Data.Context
{
    public class TodoContext : DbContext
    {
        public DbSet<User> Users { get; set; } = null!;
        public DbSet<Todo> Todos { get; set; } = null!;
        public DbSet<TodoItem> TodoItems { get; set; } = null!;

        public TodoContext(DbContextOptions<TodoContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<User>()
                .HasIndex(u => u.Email)
                .IsUnique();
        }
    }
}
