# start VcXsrv if it is not started yet
$prog="$env:ProgramFiles\VcXsrv\vcxsrv.exe"
if (! (ps | ? {$_.path -eq $prog})) {& $prog -ac -multiwindow}

# get the IP address used by Docker for Windows
$ip = Get-NetIPAddress `
    | where {$_.InterfaceAlias -eq 'vEthernet (DockerNAT)' -and $_.AddressFamily -eq 'IPv4'} `
    | select -ExpandProperty IPAddress

# start Visual Studo Code as the vscode user
$cmd="export DISPLAY=${ip}:0; code -w ."
docker run --rm ctaggart/golang-vscode su - vscode -c $cmd