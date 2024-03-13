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

            _viewModel = new CustomersViewModel(new CustomerDataProvider());

            DataContext = _viewModel;

            // Occurs when the element is laid out, rendered, and ready for interaction.
            Loaded += CustomerView_Loaded;
        }

        private async void CustomerView_Loaded(object sender, RoutedEventArgs e)
        {
            await _viewModel.LoadAsync();
        }
    }
}
