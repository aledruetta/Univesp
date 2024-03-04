using System.Collections.ObjectModel;
using System.Windows.Media;

namespace DatabindingSampleWPF
{
    public class ColorListDataContext : ObservableObject
    {
        public List<ColorDescriptor> LotsOfColors { get; private set; }

        public ColorListDataContext()
        {
            LotsOfColors = new List<ColorDescriptor>
            {
               new(Colors.Red, "red"),
               new(Colors.White, "white"),
               new(Colors.Green, "green"),
               new(Colors.Yellow, "yellow"),
               new(Colors.Blue, "blue"),
               new(Colors.Black, "black")
            };

            SelectedColor = LotsOfColors[0];
        }

        private ColorDescriptor? _selectedColor;

        private ColorDescriptor? _selectedFavoriteColor;

        public ObservableCollection<ColorDescriptor> FavoriteColors { get; } = new();

        public bool IsRemoveFavoriteEnabled => SelectedFavoriteColor != null;

        public ColorDescriptor? SelectedColor
        {
            get => _selectedColor;
            set => Set(ref _selectedColor, value);
        }

        public ColorDescriptor? SelectedFavoriteColor
        {
            get => _selectedFavoriteColor;
            set
            {
                Set(ref _selectedFavoriteColor, value);
                RaisePropertyChanged(nameof(IsRemoveFavoriteEnabled));
            }
        }

        public void AddSelectedColorToFavorites()
        {
            if (SelectedColor == null) return;
            FavoriteColors.Add(SelectedColor);
        }

        public void RemoveFavoriteColor()
        {
            if (SelectedFavoriteColor == null) return;
            FavoriteColors.Remove(SelectedFavoriteColor);
        }
    }
}
