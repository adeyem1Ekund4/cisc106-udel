import random

max = int(input("Max value?"))
target = random.randint(1,20)
guess = int(input("Enter a guess [1-20]:"))
counter = 1

while (guess != target):
    print("That's not it!")
    if (guess < target):
        print("You're number is too small")
    else:
        print("Your number is too big")
    guess = int(input("Guess again:"))
    counter += 1
    
print("Yay! You got it in", counter, "guesses")