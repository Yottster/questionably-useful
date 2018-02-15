function Search-Files($term) {
    return Get-ChildItem '.' -Recurse -ErrorAction SilentlyContinue | Select-String -pattern $term
}

function Open-SearchResult($term) {
    return Search-Files($term) | ForEach-Object{ code --goto "$($_.path):$($_.linenumber)" }
}

function Find-KillLocked($fileUri) {
    Get-Process | ForEach-Object{
        $processVar = $_;$_.Modules | ForEach-Object{
            if($_.FileName -eq $fileUri){
                Stop-Process $processVar.id;
                $processVar.Name + " PID:" + $processVar.id
            }
        }
    }
}

