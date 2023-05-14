using System.ComponentModel.DataAnnotations;

namespace WebAPI.Controllers.Mappings
{
    public class UserDto
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; } = null!;

        [Required]
        public string Email { get; set; } = null!;

        public DateTime CreatedDate { get; set; } = new DateTime();

        public DateTime UpdatedDate { get; set; } = new DateTime();
    }

    public class UserCreateDto : UserDto
    {
        [Required]
        public string Password { get; set; } = null!;
    }

    public class UserDetailDto : UserDto
    {
        public IEnumerable<TodoDto> Todos { get; set; } = new List<TodoDto>();
    }
}
