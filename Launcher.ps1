Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Add or edit entries here: Name = description, Cmd = what Run box accepts
$commands = @(
    [pscustomobject]@{ Name = 'System Information';    Cmd = 'msinfo32' }
    [pscustomobject]@{ Name = 'Resource Monitor';      Cmd = 'resmon' }
    [pscustomobject]@{ Name = 'Apps'; Cmd = 'shell:appsfolder' }
    [pscustomobject]@{ Name = 'Services';              Cmd = 'services.msc' }
    [pscustomobject]@{ Name = 'Device Manager';        Cmd = 'devmgmt.msc' }
    [pscustomobject]@{ Name = 'Disk Management';       Cmd = 'diskmgmt.msc' }
    [pscustomobject]@{ Name = 'Event Viewer';          Cmd = 'eventvwr.msc' }
    [pscustomobject]@{ Name = 'Task Scheduler';        Cmd = 'taskschd.msc' }
    [pscustomobject]@{ Name = 'Network Connections';   Cmd = 'ncpa.cpl' }
    [pscustomobject]@{ Name = 'Firewall (Advanced)';   Cmd = 'wf.msc' }
    [pscustomobject]@{ Name = 'Registry Editor';       Cmd = 'regedit' }
    [pscustomobject]@{ Name = 'Group Policy ';   Cmd = 'gpedit.msc' }
    [pscustomobject]@{ Name = 'System Properties';     Cmd = 'sysdm.cpl' }
    [pscustomobject]@{ Name = 'Optional Features';     Cmd = 'optionalfeatures' }
    [pscustomobject]@{ Name = 'Programs and Features'; Cmd = 'appwiz.cpl' }
    [pscustomobject]@{ Name = 'Power Options';         Cmd = 'powercfg.cpl' }
    [pscustomobject]@{ Name = 'Disk Cleanup';          Cmd = 'cleanmgr' }
    [pscustomobject]@{ Name = 'Startup Folder';        Cmd = 'shell:startup' }
    [pscustomobject]@{ Name = 'Temp Folder';           Cmd = '%temp%' }
    [pscustomobject]@{ Name = 'Windows Update';        Cmd = 'ms-settings:windowsupdate' }
    [pscustomobject]@{ Name = 'Windows Version';       Cmd = 'winver' }
)
foreach ($c in $commands) { $c | Add-Member -NotePropertyName Display -NotePropertyValue "$($c.Name)  [$($c.Cmd)]" }

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Commands'
$form.Size = New-Object System.Drawing.Size(460, 520)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false

$filter = New-Object System.Windows.Forms.TextBox
$filter.Location = New-Object System.Drawing.Point(12, 12)
$filter.Size = New-Object System.Drawing.Size(420, 25)

$list = New-Object System.Windows.Forms.ListBox
$list.Location = New-Object System.Drawing.Point(12, 45)
$list.Size = New-Object System.Drawing.Size(420, 380)
$list.DisplayMember = 'Display'

$runBtn = New-Object System.Windows.Forms.Button
$runBtn.Text = 'Run'
$runBtn.Location = New-Object System.Drawing.Point(12, 435)
$runBtn.Size = New-Object System.Drawing.Size(420, 35)

function Update-List {
    $list.BeginUpdate()
    $list.Items.Clear()
    foreach ($c in $commands) {
        if ($c.Display -like "*$($filter.Text)*") { [void]$list.Items.Add($c) }
    }
    $list.EndUpdate()
}

function Invoke-Selected {
    $sel = $list.SelectedItem
    if ($sel) {
        # cmd's "start" resolves Run-box syntax (shell:, ms-settings:, %temp%, .msc, .cpl)
        Start-Process -FilePath cmd.exe -ArgumentList "/c start `"`" `"$($sel.Cmd)`"" -WindowStyle Hidden
    }
}

$filter.Add_TextChanged({ Update-List })
$runBtn.Add_Click({ Invoke-Selected })
$list.Add_DoubleClick({ Invoke-Selected })

$form.Controls.AddRange(@($filter, $list, $runBtn))
Update-List
[void]$form.ShowDialog()
