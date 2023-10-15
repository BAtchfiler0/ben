Add-Type -TypeDefinition @"
using System;                                                                                          
using System.Runtime.InteropServices;                                                                  
public class LoserPrinter                                                                              
{                                                                                                      
    [DllImport("user32.dll")]                                                                          
    public static extern IntPtr GetDesktopWindow();                                                    
    [DllImport("user32.dll")]                                                                          
    public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);                             
    [DllImport("user32.dll")]                                                                          
    public static extern IntPtr GetDC(IntPtr hWnd);                                                    
    [DllImport("user32.dll")]                                                                          
    public static extern int ReleaseDC(IntPtr hWnd, IntPtr hDC);                                       
    [DllImport("gdi32.dll")]                                                                           
    public static extern IntPtr CreateSolidBrush(int crColor);                                         
    [DllImport("gdi32.dll")]                                                                           
    public static extern int SelectClipRgn(IntPtr hdc, IntPtr hrgn);                                   
    [DllImport("gdi32.dll")]                                                                           
    public static extern IntPtr SelectObject(IntPtr hdc, IntPtr hgdiobj);                              
    [DllImport("gdi32.dll")]                                                                           
    public static extern int TextOut(IntPtr hdc, int x, int y, string lpString, int nCount);           
    [DllImport("gdi32.dll")]                                                                           
    public static extern int DeleteObject(IntPtr hObject);                                             
    [DllImport("kernel32.dll")]                                                                        
    public static extern void Sleep(uint dwMilliseconds);                                              
    public static void PrintLoser()                                                                    
    {                                                                                                  
        Random rand = new Random();                                                                    
        RECT rect;                                                                                     
        GetWindowRect(GetDesktopWindow(), out rect);                                                   
        int w = rect.right - rect.left;                                                                
        int h = rect.bottom - rect.top;                                                                
        IntPtr hdc = GetDC(IntPtr.Zero);                                                               
        while (true)                                                                                   
        {                                                                                              
            int x = rand.Next() %% w;                                                                   
            int y = rand.Next() %% h;                                                                   
            int r = rand.Next() %% 256;                                                                 
            int g = rand.Next() %% 256;                                                                 
            int b = rand.Next() %% 256;                                                                 
            IntPtr brush = CreateSolidBrush((r << 16) | (g << 8) | b);                                 
            SelectClipRgn(hdc, IntPtr.Zero);                                                           
            SelectObject(hdc, brush);                                                                  
            TextOut(hdc, x, y, "LOSER", 5);                                                            
            DeleteObject(brush);                                                                       
            Sleep(70);                                                                                 
        }                                                                                              
    }                                                                                                  
    [StructLayout(LayoutKind.Sequential)]                                                              
    public struct RECT                                                                                 
    {                                                                                                  
        public int left;                                                                               
        public int top;                                                                                
        public int right;                                                                              
        public int bottom;                                                                             
    }                                                                                                  
}                                                                                                      
"@                                                                                                    
[LoserPrinter]::PrintLoser()                                                                           
