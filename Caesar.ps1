# Cipher program to encode a message by x number of characters
#
# Run expectations ./Caesar.ps1
# Prompt user for an integer to be used as a cipher key
# Prompt user for the string to encode
#
# ______________________________________________________________
# Author   : Bryan M McGill                                    #
# git      : https://github.com/heybmcgill                     #
# outlook  : bryanmcgill@outlook.com                           #
# linkedin : linkedin.com/heybmcgill                           #
# ______________________________________________________________

# Break out of process if there are problems with entered integer or secret message 
$ErrorActionPreference = "Stop"

#Get the key
[int]$cipherkey = Read-Host "Enter cipher key as integer value"

#Get the message to encode
[char[]]$message  = Read-Host "Enter secret message"


#Convert the char array into an integer array of ascii values
$asciiorig = ($message | %{[int][char]$_})

# Iterate thru the values, moving the ascii char by the cipher key
#   take care to roll the apporpriate value where necessary for upper, lower 
#   pass the value thru if space or other character


for ($i = 0; $i -lt $message.Length; $i++){
#if upper convert by x
    if ($asciiorig[$i] -in (65..91)) {
    $asciiorig[$i] = (($asciiorig[$i] + $cipherkey - [int]65) % [int]26 + [int]65)
    #Write-Host $asciiorig[$i]
    }
#if lower convert by x
    elseif ($asciiorig[$i] -in (97..122)) {
    $asciiorig[$i] = (($asciiorig[$i] + $cipherkey - [int]97) % [int]26 + [int]97)
    #Write-Host $asciiorig[$i]
    }
}

#Convert the integer array back into a char array
$c = ($asciiorig | %{[char][int]$_})
$e = -join $c
# write-host "Encrypted message: $e with cipher of $cipherkey"
$e

### Ideas to iterate upon when more time allows:
###    - Make this into a named function
###    - Provide options (switch) to hid the cipher value and the encrypted message
###    - add an option (parameter of email address to and email address
###      from)to send an email with the encrypted message
###    - add a section to change numeric values of base 10, to roll within