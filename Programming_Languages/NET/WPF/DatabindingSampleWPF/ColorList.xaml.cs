using System.Windows;

namespace DatabindingSampleWPF
{
    /// <summary>
    /// Interaction logic for ColorList.xaml
    /// </summary>
    public partial class ColorList : Window
    {
        public ColorList()
        {
            InitializeComponent();
        }

        private ColorListDataContext DC => (ColorListDataContext)DataContext;

        private void ButtonAddToFavorites_Click(object sender, RoutedEventArgs e)
        {
            DC.AddSelectedColorToFavorites();
        }

        private void ButtonRemoveFromFavorites_Click(object sender, RoutedEventArgs e)
        {
            DC.RemoveFavoriteColor();
        }
    }
}
