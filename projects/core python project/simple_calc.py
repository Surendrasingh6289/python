def main():
    total = 0
    while True:
        print("\nCurrent Total",total)
        print("1.Addition")
        print("2.Subtraction")
        print("3.Multiplication")
        print("4.Division")
        print("5.Exit")
        choice = int(input("Choose operation: "))
        
        if choice in [1,2,3,4]:
            num = int(input("Enter number: "))

        match choice:
            case 1:
                total+= num
            case 2:
                total -= num
            case 3:
                total *= num
            case 4:
                if num ==0:
                    print("Cannot divide by zero")
                else:
                    total /=num
            case 5:
                break
            case _:
                print("invalid choice")

if __name__ =="__main__":
    main()