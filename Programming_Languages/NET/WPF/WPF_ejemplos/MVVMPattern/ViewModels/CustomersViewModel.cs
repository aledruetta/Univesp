using MVVMPattern.Commands;
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

            ClearCommand = new DelegateCommand(Clear, CanClear);
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

                // Lanza los eventos para notificar a la View del cambio en el item seleccionado
                // y al evento CanExecute del comando Clear para habilitar el botón.
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(SelectedCustomer)));
                ClearCommand.RaiseCanExecuteChanged();
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

        public DelegateCommand ClearCommand { get; }

        private void Clear(object parameter)
        {
            Customers.Clear();
        }

        private bool CanClear(object parameter) => SelectedCustomer?.IsDeveloper == false;
    }
}
