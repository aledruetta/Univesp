using System.Windows.Threading;

namespace DatabindingSampleWPF
{
    public class Clock : ObservableObject
    {
        private readonly DispatcherTimer _timer;

        // must be non static
        public string CurrentTime => DateTime.Now.ToLongTimeString();

        public Clock()
        {
            _timer = new DispatcherTimer { Interval = TimeSpan.FromSeconds(1) };

            _timer.Tick += (sender, o) => RaisePropertyChanged(nameof(CurrentTime));

            _timer.Start();
        }
    }
}
