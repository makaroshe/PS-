Import-Module ActiveDirectory

while($True)
{
    $way_to_res = Read-Host "Введите сервер "
    $way_to_res1 = '\\' + $way_to_res + '\Otdel'
    Get-ChildItem -Path $way_to_res1 | Format-table Name
    
    while($True){
        $inp_res = Read-Host "Введите ресурс или 1 "
        $kek = $way_to_res1 +'\'+ $inp_res

        if ($inp_res -ne 1)
        {
        while($True){
            Get-Acl $kek | Format-list PSPath, AccessToString
            $inp_group = Read-Host "Введите интересующую группу или 1 "
            if ( $inp_group -ne 1 )
            {
            $lol = Get-ADGroupMember $inp_group -Recursive | Get-ADUser -Properties company,department,canonicalname | Format-table Name,Department
            $lol
            }
            else
            {
            Get-ChildItem -Path $way_to_res1 | Format-table Name
            break
            }
        }
        }
        else
        {break}
    }
}