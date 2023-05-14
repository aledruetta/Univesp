using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WebAPI.Controllers.Mappings;
using WebAPI.Repository.Data.Context;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly TodoContext _dbContext;
        private readonly IConfiguration _config;

        public AuthController(TodoContext dbContext, IConfiguration config)
        {
            _dbContext = dbContext ?? throw new ArgumentNullException(nameof(dbContext));
            _config = config ?? throw new ArgumentNullException(nameof(config));
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> CreateToken([FromBody] AuthDto dto)
        {
            var user = await _dbContext.Users
                .FirstOrDefaultAsync(u => u.Email == dto.Email);

            if (user == null)
            {
                return NotFound();
            }

            // ToDo: Hash password
            if (user.Password != dto.Password)
            {
                return Unauthorized();
            }

            var token = new JwtSecurityToken(
                issuer: _config["Jwt:Issuer"],
                audience: _config["Jwt:Audience"],
                claims: new List<Claim>
                {
                    new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()),
                    new Claim(JwtRegisteredClaimNames.Email, user.Email),
                    new Claim(ClaimsIdentity.DefaultRoleClaimType, user.IsAdmin ? "Admin" : "Default"),
                },
                expires: DateTime.Now.AddMinutes(30),
                signingCredentials: new SigningCredentials(
                    new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"])),
                    SecurityAlgorithms.HmacSha512Signature)
            );

            return Ok(new { AccessToken = new JwtSecurityTokenHandler().WriteToken(token), UserId = user.Id });
        }
    }
}
