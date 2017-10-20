function Search-Files($term) {
    return Get-ChildItem '.' -Recurse -ErrorAction SilentlyContinue | Select-String -pattern $term
}

function Open-SearchResult($term) {
    return Search-Files($term) | %{ code --goto "$($_.path):$($_.linenumber)" }
}