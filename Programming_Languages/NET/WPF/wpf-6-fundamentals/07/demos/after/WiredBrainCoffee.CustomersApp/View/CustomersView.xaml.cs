﻿using System.Windows;
using System.Windows.Controls;
using WiredBrainCoffee.CustomersApp.Data;
using WiredBrainCoffee.CustomersApp.ViewModel;

namespace WiredBrainCoffee.CustomersApp.View
{
  public partial class CustomersView : UserControl
  {
    private CustomersViewModel _viewModel;

    public CustomersView()
    {
      InitializeComponent();
      _viewModel = new CustomersViewModel(new CustomerDataProvider());
      DataContext = _viewModel;
      Loaded += CustomersView_Loaded;
    }

    private async void CustomersView_Loaded(object sender, RoutedEventArgs e)
    {
      await _viewModel.LoadAsync();
    }
  }
}
