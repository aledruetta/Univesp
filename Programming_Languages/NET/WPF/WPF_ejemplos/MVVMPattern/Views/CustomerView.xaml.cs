using MVVMPattern.Data;
using MVVMPattern.ViewModels;
using System.Windows;
using System.Windows.Controls;

namespace MVVMPattern.Views
{
    /// <summary>
    /// Interaction logic for CustomerView.xaml
    /// </summary>
    public partial class CustomerView : UserControl
    {
        private readonly CustomersViewModel _viewModel;

        public CustomerView()
        {
            InitializeComponent();

            // Construye una instancia del ViewModel.
            _viewModel = new CustomersViewModel(new CustomerDataProvider());

            // Asigna el ViewModel al DataContext de la View para poder hacer uso de
            // las propiedades y métodos definidos en el ViewModel.
            DataContext = _viewModel;

            // Occurs when the element is laid out, rendered, and ready for interaction.
            Loaded += CustomerView_Loaded;
        }

        // Método que será invocado por el evento Loaded.
        private async void CustomerView_Loaded(object sender, RoutedEventArgs e)
        {
            await _viewModel.LoadAsync();
        }
    }
}
