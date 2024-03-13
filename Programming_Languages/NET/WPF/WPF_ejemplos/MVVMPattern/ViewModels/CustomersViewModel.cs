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

        // Declara el evento que será usado para notificar a la View sobre cambios en Dependency Property.
        public event PropertyChangedEventHandler PropertyChanged;

        // Dependency Property.
        public Customer SelectedCustomer
        {
            get => _selectedCustomer;
            set
            {
                _selectedCustomer = value;

                // Lanza el evento de notificación.
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(SelectedCustomer)));
            }
        }

        // Construye la lista de Customers a partir del DataProvider (repositorio).
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
