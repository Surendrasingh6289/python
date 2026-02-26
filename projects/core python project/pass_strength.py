def strength(password):
    

def main():
    while True:
        print("1.Enter Your password")
        print("2.Exit")
        choice = int(input("Choose option"))
        match choice:
            case 1:
                password = input("Enter your password: ")
            case 2:
                break
            case _:
                print("Invalid choice")
        


if __name__ =="__main__":
    main()