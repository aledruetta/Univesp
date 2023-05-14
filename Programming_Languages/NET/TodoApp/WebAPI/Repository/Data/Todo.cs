namespace WebAPI.Repository.Data
{
    public class Todo
    {
        public int Id { get; set; }
        public string Title { get; set; } = null!;
        public string? Description { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedDate { get; set; } = new DateTime();
        public DateTime UpdatedDate { get; set; } = new DateTime();

        public User User { get; set; } = null!;
        public ICollection<TodoItem> TodoItems { get; set; } = new List<TodoItem>();
    }
}
