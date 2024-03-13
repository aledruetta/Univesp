using MVVMPattern.Data;
using MVVMPattern.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace MVVMPattern.ViewModels
{
    public class CustomersViewModel : INotifyPropertyChanged
    {
        private readonly ICustomerDataProvider _customerDataProvider;
        private Customer _selectedCustomer;

        public CustomersViewModel(ICustomerDataProvider customerDataProvider)
        {
            _customerDataProvider = customerDataProvider;
        }

        // ObservableCollections lanza un evento CollectionChanged cada vez que se agrega o remueve un item.
        public ObservableCollection<Customer> Customers { get; } = new ObservableCollection<Customer>();

        public event PropertyChangedEventHandler PropertyChanged;

        public Customer SelectedCustomer
        {
            get => _selectedCustomer;
            set
            {
                _selectedCustomer = value;

                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(SelectedCustomer)));
            }
        }

        public async Task LoadAsync()
        {
            if (Customers.Any()) { return; }

            var customers = await _customerDataProvider.GetAllAsync();

            foreach (var customer in customers)
            {
                Customers.Add(customer);
            }
        }
    }
}
