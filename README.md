# Win Power User Commands

<!-- Optional: a screenshot or GIF of the launcher in action -->
<img width="668" height="769" alt="image" src="https://github.com/user-attachments/assets/5e7ce445-f2dc-41f0-9013-3f2d07d6f1f7" />
<img width="668" height="769" alt="Screenshot 2026-11-05 131801" src="https://github.com/user-attachments/assets/bc1c5e4c-791d-4831-aafd-c03938bb4fe7" />


- Quick-access launcher and reference for Windows Run-box commands, PowerShell tools, and system utilities.
- I cant remember all the commands so i have created a gui to run it.Most commonly used commands are added.
- Feel free to add  commands yourself(Explained below) .
- Framework used for gui:WinForms


## Features

- Searchable list of Windows management tools (`msinfo32`, `services.msc`, `eventvwr.msc`, and more)
- One-click or double-click launch
- Easy to extend by editing a single array

## Requirements

- Windows 10 or Windows 11
- PowerShell 5 or higher (`pwsh`) installed via WinGet: `winget install Microsoft.PowerShell` or Built-in



## Usage
- 1.Open PowerShell with administrator privilages.
- 2.Change Directory or location to where the file is and then run the below
- For Example(If the .ps1 file is in Downloads):
  ```powershell
  cd /Users/$env:USERNAME/Downloads
  ```
3. Run the launcher:
  
```powershell
.\Launcher.ps1
```
- If the above command fails,try the below command

```powershell

```powershell
pwsh -ExecutionPolicy Bypass -File ".\Launcher.ps1"
```



## Adding your own commands

Open `Launcher.ps1` with you preferred editor and add a line to the `$commands` array:

```powershell
[pscustomobject]@{ Name = 'My Tool'; Cmd = 'mytool.exe' }
```

## Contributing

Contributions are welcome. Please open an issue first to discuss major changes, then submit a pull request.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
