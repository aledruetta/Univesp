using System.ComponentModel;

namespace MVVMPattern.ViewModels
{
    public class CustomerItemViewModel : INotifyPropertyChanged
    {
        private readonly Customer _model;

        public CustomerItemViewModel(Customer model)
        {
            _model = model;
        }

        public int Id => _model.Id;

        public string FullName => $"{_model.FirstName} {_model.LastName}";


        public event PropertyChangedEventHandler PropertyChanged;
    }
}
