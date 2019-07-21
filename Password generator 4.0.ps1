Add-Type -AssemblyName System.Windows.Forms
Clear-Variable finalpassword -Force -ErrorAction SilentlyContinue
Clear-Variable password -Force -ErrorAction SilentlyContinue
$tempfile = New-TemporaryFile 
$list=Invoke-WebRequest "https://raw.githubusercontent.com/dolph/dictionary/master/popular.txt"
$list.content | Out-File $tempfile
#$count is the number of words you want generated
$count = 3
$list=Get-Content $tempfile
$word = $list | Get-Random -Count 3 -ErrorAction SilentlyContinue
$word | ForEach-Object{
$pass = (Get-Culture).TextInfo.ToTitleCase($_)
$password = $password + $pass
}
$finalpassword = $password -creplace "a","@" -replace "i","1" -replace "o","0"
Set-Clipboard -Value $finalpassword
[System.Windows.Forms.MessageBox]::Show($finalpassword)