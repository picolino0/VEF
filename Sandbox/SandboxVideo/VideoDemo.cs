using DirectX.Capture;
using DShowNET;
using System.Windows.Forms;

namespace SandboxVideo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            Filters filters = new Filters();
            Capture capture = new Capture(filters.VideoInputDevices[0], filters.AudioInputDevices[0]);
            capture.PreviewWindow = panel;
            capture.Start();
        }
    }
}
