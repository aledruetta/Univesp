using System.ComponentModel.DataAnnotations;

namespace WebAPI.Controllers.Mappings
{
    public class TodoItemDto
    {
        public int Id { get; set; }

        [Required]
        public string Text { get; set; } = null!;

        [Required]
        public int TodoId { get; set; }

        public DateTime CreatedDate { get; set; } = new DateTime();

        public DateTime UpdatedDate { get; set; } = new DateTime();
    }
}
