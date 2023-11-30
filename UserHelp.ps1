clear

Get-SmbMapping | Format-Table 
Import-Module ActiveDirectory

$way_to_res = Read-Host "Введите сервер "
$way_to_res1 = '\\' + $way_to_res + '\Office'
Get-ChildItem -Path $way_to_res1 | Format-table Name
    
$inp_res = Read-Host "Введите каталог "
$full_way = $way_to_res1 +'\'+ $inp_res

$user_gr = Get-Acl $full_way
$user_gr = $user_gr.Access | Where-Object  `
    {
    $_.IdentityReference -notlike "**" -and ` 
    $_.IdentityReference -notlike "" -and `
    $_.IdentityReference -notlike "**"} 

$user_gr.IdentityReference

Get-SmbMapping | Format-Table

Read-Host