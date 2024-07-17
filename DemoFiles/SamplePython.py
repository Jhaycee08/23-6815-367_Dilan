def add_and_subtract(num1, num2):

  sum = num1 + num2
  difference = num1 - num2
  return sum, difference

while True:
  try:
    num1 = float(input("Enter the first number: "))
    num2 = float(input("Enter the second number: "))
    break
  except ValueError:
    print("Invalid input. Please enter numbers only.")


sum, difference = add_and_subtract(num1, num2)

print("The sum of", num1, "and", num2, "is", sum)
print("The difference of", num1, "and", num2, "is", difference)
