# Clear the screen and welcome the player
Clear-Host
Write-Host "Welcome to the Guess the Number Game!" -ForegroundColor Green
Write-Host "I'm thinking of a number between 1 and 100. Can you guess it?" -ForegroundColor Cyan

# Generate a random number between 1 and 100
$target = Get-Random -Minimum 1 -Maximum 101
$guess = $null
$attempts = 0

# Game loop: continues until the correct guess is made
while ($guess -ne $target) {
    $attempts++
    $input = Read-Host "Enter your guess"
    
    # Validate that input is an integer
    if (-not [int]::TryParse($input, [ref]$guess)) {
        Write-Host "That's not a valid number. Please enter an integer." -ForegroundColor Yellow
        continue
    }
    
    # Provide feedback to guide the player
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
