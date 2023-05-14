using System.ComponentModel.DataAnnotations;

namespace WebAPI.Controllers.Mappings
{
    public class AuthDto
    {
        [Required]
        public string Email { get; set; } = null!;

        [Required]
        public string Password { get; set; } = null!;
    }
}
