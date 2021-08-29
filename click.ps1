##############################################
# Set the variables below
##############################################
$delay_before_start=1
$how_many_clicks=30
##############################################
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
$signature=@'
[DllImport("user32.dll",CharSet=CharSet.Auto,CallingConvention=CallingConvention.StdCall)]
public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@
$SendMouseClick = Add-Type -memberDefinition $signature -name "Win32MouseEventNew" -namespace Win32Functions -passThru
Write-Output "Clicking begins in $delay_before_start seconds."
sleep -Seconds $delay_before_start
$i=0
while ($i -le $how_many_clicks)
{
	Write-Output "Click"
	$SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0);
	sleep -Milliseconds 200
	$SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0);
	$i++
}

[System.Windows.Forms.SendKeys]::Send("E")
