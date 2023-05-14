namespace WebAPI.Repository.Data
{
    public class User
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string Password { get; set; } = null!;

        public bool IsAdmin { get; set; } = false;

        public DateTime CreatedDate { get; set; } = new DateTime();

        public DateTime UpdatedDate { get; set; } = new DateTime();

        public ICollection<Todo> Todos { get; set; } = new List<Todo>();
    }
}
