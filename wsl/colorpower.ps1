function Green
{
    process { Write-Host $_ -ForegroundColor Green }
}

function Red
{
    process { Write-Host $_ -ForegroundColor Red }
}

Write-Output "this is a test" | Green
Write-Output "this is a test" | Red