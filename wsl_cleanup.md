# Free Up WSL2 space

## Trim WSL2
```sh
fstrim -a
```

## Shutdown WSL
```powershell
wsl --shutdown
```

## Find the path to your wsl distro vhd
On registry -> `Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss`
Then look at `BasePath`

## Optimize VHD
Optimize-Vhd -Path <YOUR_PATH>\ext4.vhdx -Mode full
