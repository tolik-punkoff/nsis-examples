using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace testapp
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            MessageBox.Show("I am running", "TestApp", MessageBoxButtons.OK,
                MessageBoxIcon.Information);
        }
    }
}
