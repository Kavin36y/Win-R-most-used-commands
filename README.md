# Win Power User Commands

<!-- Optional: a screenshot or GIF of the launcher in action -->
![Launcher screenshot](docs/images/launcher.png)

-Quick-access launcher and reference for Windows Run-box commands, PowerShell tools, and system utilities.
-I cant remember all the commands so i have created a gui to run it.Most commonly used commands are added.
-Feel free to add  commands yourself(Explained below) .
-Framework used for gui:WinForms


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
3. Run the launcher:

```powershell
pwsh -ExecutionPolicy Bypass -File ".\Launcher.ps1"
```

Type part of a command name to filter the list, then double-click it or press **Run**.

## Adding your own commands

Open `Launcher.ps1` and add a line to the `$commands` array:

```powershell
[pscustomobject]@{ Name = 'My Tool'; Cmd = 'mytool.exe' }
```

## Contributing

Contributions are welcome. Please open an issue first to discuss major changes, then submit a pull request.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
