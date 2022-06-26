using System.Runtime.InteropServices;
using MoonWorks;

namespace MinigameJam;

internal class Program
{
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    static extern bool SetDllDirectory(string lpPathName);


    static void Main(string[] args)
    {
        WindowCreateInfo windowCreateInfo = new WindowCreateInfo
        {
            WindowWidth = 1280,
            WindowHeight = 720,
            WindowTitle = "MinigameJam",
            ScreenMode = ScreenMode.Windowed
        };

        MinigameJamGame game = new MinigameJamGame(
            windowCreateInfo,
            MoonWorks.Graphics.PresentMode.FIFORelaxed,
            true
        );

        game.Run();
    }
}
