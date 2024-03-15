﻿using System;
using System.Windows.Input;

namespace MVVMPattern.Commands
{
    public class DelegateCommand : ICommand
    {
        private readonly Action<object> _execute;
        private readonly Func<object, bool> _canExecute;

        public DelegateCommand(Action<object> execute, Func<object, bool> canExecute = null)
        {
            if (execute is null) throw new ArgumentNullException(nameof(execute));

            _execute = execute;
            _canExecute = canExecute;
        }

        public event EventHandler CanExecuteChanged;

        public void RaiseCanExecuteChanged() => CanExecuteChanged.Invoke(this, EventArgs.Empty);

        public bool CanExecute(object parameter) => _canExecute is null || _canExecute(parameter);

        public void Execute(object parameter) => _execute(parameter);
    }
}
