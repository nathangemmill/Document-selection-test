Function Get-FileName($initialDirectory) {  
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
    Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "All files (*.*)| *.*"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}

$RequiredCSV = Get-FileName
$ImportedCSV = Import-Csv $RequiredCSV -join ','

ForEach ($Library in $ImportedCSV.LibraryName) {
    Write-Host Here: $Library
}