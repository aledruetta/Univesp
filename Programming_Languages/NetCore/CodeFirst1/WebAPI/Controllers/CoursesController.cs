using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Data.Context;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CoursesController : ControllerBase
    {
        private readonly SchoolContext _context;

        public CoursesController(SchoolContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<CourseDto>>> GetCourses()
        {
            var courses = await _context.Courses.ToListAsync();
            return courses.Select(c => new CourseDto(c)).ToList();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<CourseDetailsDto>> GetCourse(int id)
        {
            //var course = await _context.Courses.FindAsync(id);
            var course = await _context.Courses
                .Include(c => c.Enrollments)
                .ThenInclude(e => e.Student)
                .AsNoTracking()
                .FirstOrDefaultAsync(res => res.CourseID == id);

            if (course == null)
            {
                return NotFound();
            }

            return new CourseDetailsDto(course);
        }

        [HttpPost]
        public async Task<IActionResult> PostCourse([FromBody] CourseDto courseDto)
        {
            var course = courseDto.Map();
            _context.Courses.Add(course);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCourse", new { id = course.CourseID }, new CourseDto(course));
        }
    }
}
