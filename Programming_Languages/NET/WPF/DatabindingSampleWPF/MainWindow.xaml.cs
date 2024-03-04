using System.Windows;

namespace DatabindingSampleWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private MainWindowDataContext DC => (MainWindowDataContext)DataContext;

        private void OnSubmitClicked(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(DC.UserName))
            {
                return;
            }

            DC.IsNameNeeded = false;
        }
    }
}