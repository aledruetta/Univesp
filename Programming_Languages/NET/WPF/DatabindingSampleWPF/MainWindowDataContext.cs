using System.Windows;

namespace DatabindingSampleWPF
{
    public class MainWindowDataContext : ObservableObject
    {
        private bool _isNameNeeded = true;
        private string? _userName;

        public MainWindowDataContext()
        {
        }

        public bool IsSubmitAllowed => !string.IsNullOrWhiteSpace(UserName)
                                       && UserName.Length > 2;

        public string? UserName
        {
            get => _userName;
            set
            {
                _userName = value;
                RaisePropertyChanged(nameof(IsSubmitAllowed));
            }
        }

        public Visibility GreetingVisibility => IsNameNeeded
                                                ? Visibility.Collapsed
                                                : Visibility.Visible;

        public bool IsNameNeeded
        {
            get { return _isNameNeeded; }
            set
            {
                if (Set(ref _isNameNeeded, value))
                {
                    RaisePropertyChanged(nameof(GreetingVisibility));
                }
            }
        }
    }
}
