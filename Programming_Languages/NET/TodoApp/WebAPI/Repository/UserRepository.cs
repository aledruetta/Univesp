using Microsoft.EntityFrameworkCore;
using WebAPI.Repository.Data;
using WebAPI.Repository.Data.Context;

namespace WebAPI.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly TodoContext _dbContext;

        public UserRepository(TodoContext dbContext)
        {
            _dbContext = dbContext ?? throw new ArgumentNullException(nameof(dbContext));
        }

        public async Task<User> CreateUser(User user)
        {

            _dbContext.Users.Add(user);

            try
            {
                await _dbContext.SaveChangesAsync();

                return user;
            }
            catch (DbUpdateException) 
            {
                throw;
            }
        }

        public async Task<IEnumerable<User>> GetUsers()
        {
            return await _dbContext.Users
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<User?> GetUser(int id)
        {
            return await _dbContext.Users
                .Include(u => u.Todos)
                .AsNoTracking()
                .FirstOrDefaultAsync(u => u.Id == id);
        }

        public async Task<User> UpdateUser(User user)
        {
            throw new NotImplementedException();
        }

        public async Task DeleteUser(int id)
        {
            throw new NotImplementedException();
        }
    }
}
