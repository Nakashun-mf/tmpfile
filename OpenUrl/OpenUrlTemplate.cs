using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace Tmpfile.Tools
{
    internal static class Program
    {
        [STAThread]
        private static void Main()
        {
            const string Url = "__URL__";

            try
            {
                if (string.IsNullOrWhiteSpace(Url))
                {
                    MessageBox.Show(
                        "URL が設定されていないため、ブラウザを起動できませんでした。",
                        "URL 未設定",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Warning);
                    return;
                }

                var psi = new ProcessStartInfo
                {
                    FileName = Url,
                    UseShellExecute = true
                };

                Process.Start(psi);
            }
            catch
            {
                MessageBox.Show(
                    "URL を開く際にエラーが発生しました。",
                    "エラー",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }
        }
    }
}
