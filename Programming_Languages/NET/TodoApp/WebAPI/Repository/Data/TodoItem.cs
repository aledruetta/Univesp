namespace WebAPI.Repository.Data
{
    public class TodoItem
    {
        public int Id { get; set; }

        public string Text { get; set; } = null!;

        public int TodoId { get; set; }

        public DateTime CreatedDate { get; set; } = new DateTime();

        public DateTime UpdatedDate { get; set; } = new DateTime();

        public Todo Todo { get; set; } = null!;
    }
}
