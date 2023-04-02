using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using WebAPI.Data;
using WebAPI.Data.Context;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnrollmentsController : ControllerBase
    {
        private readonly SchoolContext _context;

        public EnrollmentsController(SchoolContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<EnrollmentDetailsDto>>> GetEnrollments()
        {
            var enrollments = await _context.Enrollments
                .Include(e => e.Course)
                .Include(e => e.Student)
                .AsNoTracking()
                .ToListAsync();
            return enrollments.Select(e => new EnrollmentDetailsDto(e)).ToList();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<EnrollmentDetailsDto>> GetEnrollment(int id)
        {
            //var enrollment = await _context.Enrollments.FindAsync(id);
            var enrollment = await _context.Enrollments
                .Include(e => e.Course)
                .Include(e => e.Student)
                .AsNoTracking()
                .FirstOrDefaultAsync(res => res.EnrollmentID == id);

            if (enrollment == null)
            {
                return NotFound();
            }

            return new EnrollmentDetailsDto(enrollment);
        }

        [HttpPost]
        public async Task<IActionResult> PostEnrollment([FromBody] EnrollmentDto enrollmentDto)
        {
            var enrollment = enrollmentDto.Map();
            _context.Enrollments.Add(enrollment);
            await _context.SaveChangesAsync();

            var enrollmentFromDB = _context.Enrollments
                .Include(e => e.Course)
                .Include(e => e.Student)
                .AsNoTracking()
                .FirstOrDefault(res => res.EnrollmentID == enrollment.EnrollmentID);

            return CreatedAtAction("GetEnrollment", new { id = enrollmentFromDB.EnrollmentID }, new EnrollmentDetailsDto(enrollmentFromDB));
        }
    }
}
