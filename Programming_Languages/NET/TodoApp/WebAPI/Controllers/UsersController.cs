using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using WebAPI.Controllers.Mappings;
using WebAPI.Repository;
using WebAPI.Repository.Data;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public UsersController(IUserRepository userRepository, IMapper mapper)
        {
            _userRepository = userRepository ?? throw new ArgumentNullException(nameof(userRepository));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<ActionResult> PostUser(UserCreateDto createDto)
        {
            DateTime now = DateTime.Now;

            try
            {
                User user = await _userRepository.CreateUser(new()
                {
                    Name = createDto.Name,
                    Email = createDto.Email,
                    Password = createDto.Password,
                    CreatedDate = now,
                    UpdatedDate = now
                });

                UserDto userDto = _mapper.Map<UserDto>(user);

                return CreatedAtAction(nameof(GetUser), new { id = userDto.Id }, userDto);
            }
            catch (DbUpdateException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserDto>>> GetUsers()
        {
            bool isAdmin = HttpContext.User.Identity is ClaimsIdentity identity
                           && identity.HasClaim(ClaimTypes.Role, "Admin");

            if (!isAdmin)
            {
                return Unauthorized();
            }

            IEnumerable<User> users = await _userRepository.GetUsers();

            IEnumerable<UserDto> dtos = _mapper.Map<IEnumerable<UserDto>>(users);

            return Ok(dtos);
        }

        [Authorize]
        [HttpGet("{id:int}")]
        public async Task<ActionResult<UserDetailDto>> GetUser(int id)
        {
            User? user = await _userRepository.GetUser(id);

            if (user == null)
            {
                return NotFound();
            }

            ClaimsIdentity? identity = HttpContext.User.Identity as ClaimsIdentity;

            bool userIsWhoClaims = identity is not null && (
                identity.HasClaim(ClaimTypes.Role, "Admin")
                || identity.HasClaim(ClaimTypes.NameIdentifier, user.Id.ToString())
            );


            if (!userIsWhoClaims)
            {
                return Unauthorized();
            }

            UserDetailDto dto = _mapper.Map<UserDetailDto>(user);

            return Ok(dto);
        }
    }
}
