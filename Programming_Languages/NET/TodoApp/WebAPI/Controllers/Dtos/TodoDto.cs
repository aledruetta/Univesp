using System.ComponentModel.DataAnnotations;

namespace WebAPI.Controllers.Mappings
{
    public class TodoDto
    {
        public int Id { get; set; }

        [Required]

        public string Title { get; set; } = null!;

        public string? Description { get; set; }

        [Required]
        public int UserId { get; set; }

        public DateTime CreatedDate { get; set; } = new DateTime();

        public DateTime UpdatedDate { get; set; } = new DateTime();
    }

    public class TodoDetailDto : TodoDto
    {
        public IEnumerable<TodoItemDto> TodoItems { get; set; } = new List<TodoItemDto>();
    }
}
