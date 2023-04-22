using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Data.Context;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        private readonly SchoolContext _context;

        public StudentsController(SchoolContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<StudentDto>>> GetStudents()
        {
            var students = await _context.Students.ToListAsync();
            return students.Select(s => new StudentDto(s)).ToList();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<StudentDetailsDto>> GetStudent(int id)
        {
            //var student = await _context.Students.FindAsync(id);
            var student = await _context.Students
                .Include(s => s.Enrollments)
                .ThenInclude(e => e.Course)
                .AsNoTracking()
                .FirstOrDefaultAsync(res => res.StudentID == id);

            if (student == null)
            {
                return NotFound();
            }

            return new StudentDetailsDto(student);
        }

        [HttpPost]
        public async Task<IActionResult> PostStudent([FromBody] StudentDto studentDto)
        {
            var student = studentDto.Map();
            _context.Students.Add(student);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetStudent", new { id = student.StudentID }, new StudentDto(student));
        }
    }
}
