Clear-Host
Write-Host "Welcome to the Guess the Number Game!" -ForegroundColor Green
Write-Host "I'm thinking of a number between 1 and 100. Can you guess it?" -ForegroundColor Cyan

$target = Get-Random -Minimum 1 -Maximum 101
$guess = $null
$attempts = 0

while ($guess -ne $target) {
    $attempts++
    $input = Read-Host "Enter your guess"
    
    if (-not [int]::TryParse($input, [ref]$guess)) {
        Write-Host "That's not a valid number. Please enter an integer." -ForegroundColor Yellow
        continue
    }
    
    if ($guess -lt $target) {
        Write-Host "Too low! Try a higher number." -ForegroundColor Red
    }
    elseif ($guess -gt $target) {
        Write-Host "Too high! Try a lower number." -ForegroundColor Red
    }
    else {
        Write-Host "Congratulations! You guessed the number in $attempts attempt(s)!" -ForegroundColor Green
    }
}
