print ("Welcome!!!")
print ("Please Choose an operation:")
print ("1. Addition")
print ("2. Subtraction")
choice = int(input("Enter Choice: "))
match choice:
    case 1:
        num1 = int(input("Enter the first number: "))
        num2 = int(input("Enter the second number: "))
        ans = num1 + num2
        print("The answer is " + str(ans))
    case 2:
        num1 = int(input("Enter the first number: "))
        num2 = int(input("Enter the second number: "))
        ans = num1 + num2
        print("The answer is " + str(ans))
    case _:
        print("Please enter choice 1 or 2 only!!!")