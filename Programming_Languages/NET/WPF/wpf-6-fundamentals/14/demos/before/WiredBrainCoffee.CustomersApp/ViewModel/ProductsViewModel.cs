﻿using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using WiredBrainCoffee.CustomersApp.Data;
using WiredBrainCoffee.CustomersApp.Model;

namespace WiredBrainCoffee.CustomersApp.ViewModel
{
  public class ProductsViewModel : ViewModelBase
  {
    private readonly IProductDataProvider _productDataProvider;

    public ProductsViewModel(IProductDataProvider productDataProvider)
    {
      _productDataProvider = productDataProvider;
    }

    public ObservableCollection<Product> Products { get; } = new();

    public override async Task LoadAsync()
    {
      if (Products.Any())
      {
        return;
      }

      var products = await _productDataProvider.GetAllAsync();
      if (products is not null)
      {
        foreach (var product in products)
        {
          Products.Add(product);
        }
      }
    }
  }
}
