using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Controllers.Mappings;
using WebAPI.Repository.Data;
using WebAPI.Repository.Data.Context;

namespace WebAPI.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TodosController : ControllerBase
    {
        private readonly TodoContext _dbContext;

        public TodosController(TodoContext dbContext)
        {
            _dbContext = dbContext;
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<TodoDetailDto>> GetTodo(int id)
        {
            var todo = await _dbContext.Todos
                .Include(t => t.TodoItems)
                .AsNoTracking()
                .FirstOrDefaultAsync(t => t.Id == id);

            if (todo == null)
            {
                return NotFound();
            }

            var dto = new TodoDetailDto
            {
                Id = todo.Id,
                Title = todo.Title,
                Description = todo.Description,
                UserId = todo.UserId,
                CreatedDate = todo.CreatedDate,
                UpdatedDate = todo.UpdatedDate,
                TodoItems = todo.TodoItems.Select(i => new TodoItemDto
                {
                    Id = i.Id,
                    Text = i.Text,
                    TodoId = i.TodoId,
                    CreatedDate = i.CreatedDate,
                    UpdatedDate = i.UpdatedDate
                }).ToList()
            };

            return Ok(dto);
        }

        [HttpPost]
        public async Task<ActionResult<TodoDto>> PostTodo(TodoDto dto)
        {
            var user = await _dbContext.Users.FindAsync(dto.UserId);
            if (user == null)
            {
                return NotFound();
            }

            var now = DateTime.Now;
            dto.CreatedDate = now;
            dto.UpdatedDate = now;

            var record = new Todo
            {
                Title = dto.Title,
                Description = dto.Description,
                CreatedDate = now,
                UpdatedDate = now,
                User = user
            };

            _dbContext.Todos.Add(record);
            await _dbContext.SaveChangesAsync();

            dto.Id = record.Id;

            return CreatedAtAction(nameof(GetTodo), new { id = record.Id }, dto);
        }

        [HttpPost("{id:int}")]
        public async Task<ActionResult<TodoItemDto>> PostTodoItem(int id, TodoItemDto itemDto)
        {
            var todo = await _dbContext.Todos.FindAsync(id);

            if (todo == null)
            {
                return NotFound();
            }

            var now = DateTime.Now;

            var item = new TodoItem
            {
                Text = itemDto.Text,
                CreatedDate = now,
                UpdatedDate = now,
                Todo = todo
            };

            todo.TodoItems.Add(item);

            _dbContext.Todos.Update(todo);
            await _dbContext.SaveChangesAsync();

            itemDto.Id = item.Id;
            itemDto.TodoId = item.TodoId;
            itemDto.CreatedDate = now;
            itemDto.UpdatedDate = now;

            return CreatedAtAction(nameof(GetTodo), new { id = todo.Id }, itemDto);
        }
    }
}
