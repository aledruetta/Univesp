using WebAPI.Repository.Data;

namespace WebAPI.Repository
{
    public interface IUserRepository
    {
        Task<User> CreateUser(User user);

        Task<IEnumerable<User>> GetUsers();

        Task<User?> GetUser(int id);

        Task<User> UpdateUser(User user);

        Task DeleteUser(int id);
    }
}
