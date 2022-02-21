#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using JazzApi.Models;
using Newtonsoft.Json;

namespace JazzApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JazzAuthorsController : ControllerBase
    {
        private readonly JazzContext _context;

        public JazzAuthorsController(JazzContext context)
        {
            _context = context;
        }

        // GET: api/JazzAuthors
        [HttpGet]
        public async Task<ActionResult<IEnumerable<JazzAuthor>>> GetJazzAuthorsDbContext()
        {
            return await _context.JazzAuthorsDbContext.ToListAsync();
        }

        // GET: api/JazzAuthors/5
        [HttpGet("{id}")]
        public async Task<ActionResult<JazzAuthor>> GetJazzAuthor(int id)
        {
            var jazzAuthor = await _context.JazzAuthorsDbContext.FindAsync(id);

            if (jazzAuthor == null)
            {
                return NotFound();
            }

            return jazzAuthor;
        }

        // PUT: api/JazzAuthors/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutJazzAuthor(int id, JazzAuthor jazzAuthor)
        {
            if (id != jazzAuthor.Id)
            {
                return BadRequest();
            }

            _context.Entry(jazzAuthor).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!JazzAuthorExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/JazzAuthors
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<JazzAuthor>> PostJazzAuthor(JazzAuthorDto jazzAuthorDto)
        {
            var jazzAuthor = new JazzAuthor()
            {
                Name = jazzAuthorDto.Name,
                BirthDate = DateOnly.Parse(jazzAuthorDto.BirthDate),
                DeathDate = DateOnly.Parse(jazzAuthorDto.DeathDate),
                Country = Enum.Parse<CountryEnum>(jazzAuthorDto.Country)
            };

            _context.JazzAuthorsDbContext.Add(jazzAuthor);
            await _context.SaveChangesAsync();

            jazzAuthorDto.Id = jazzAuthor.Id;

            return CreatedAtAction("GetJazzAuthor", new { id = jazzAuthor.Id }, jazzAuthorDto);
        }

        // DELETE: api/JazzAuthors/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteJazzAuthor(int id)
        {
            var jazzAuthor = await _context.JazzAuthorsDbContext.FindAsync(id);
            if (jazzAuthor == null)
            {
                return NotFound();
            }

            _context.JazzAuthorsDbContext.Remove(jazzAuthor);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool JazzAuthorExists(int id)
        {
            return _context.JazzAuthorsDbContext.Any(e => e.Id == id);
        }
    }
}
