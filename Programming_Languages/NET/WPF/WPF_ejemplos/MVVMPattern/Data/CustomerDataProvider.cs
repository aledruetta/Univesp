using MVVMPattern.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MVVMPattern.Data
{
    public interface ICustomerDataProvider
    {
        Task<IEnumerable<Customer>> GetAllAsync();
    }

    public class CustomerDataProvider : ICustomerDataProvider
    {
        public async Task<IEnumerable<Customer>> GetAllAsync()
        {
            await Task.Delay(100);

            return new List<Customer>
            {
                new Customer { Id = 1, FirstName = "John", LastName = "Smith", IsDeveloper = true },
                new Customer { Id = 2, FirstName = "Serena", LastName = "Williams" },
                new Customer { Id = 3, FirstName = "Robert", LastName = "De Niro" },
                new Customer { Id = 4, FirstName = "Julia", LastName = "Roberts", IsDeveloper = true }
            };
        }
    }
}
