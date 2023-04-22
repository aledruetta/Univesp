using Microsoft.EntityFrameworkCore;

namespace WebAPI.Data.Context
{
    public class SchoolContext : DbContext
    {
        public DbSet<Student> Students { get; set; } = null!;
        public DbSet<Enrollment> Enrollments { get; set; } = null!;
        public DbSet<Course> Courses { get; set; } = null!;

        public SchoolContext(DbContextOptions<SchoolContext> options) : base(options)
        {
        }

    }
}
