import json
import os

FILE_NAME = "users.json"

# ---------- Utility Functions ----------

def load_users():
    if not os.path.exists(FILE_NAME):
        return []
    
    with open(FILE_NAME, "r") as file:
        return json.load(file)

def save_users(users):
    with open(FILE_NAME, "w") as file:
        json.dump(users, file, indent=4)

# ---------- CRUD Operations ----------

def add_user():
    users = load_users()
    
    user_id = len(users) + 1
    name = input("Enter name: ")
    age = int(input("Enter age: "))
    
    users.append({
        "id": user_id,
        "name": name,
        "age": age
    })
    
    save_users(users)
    print("User added successfully.\n")

def view_users():
    users = load_users()
    
    if not users:
        print("No users found.\n")
        return
    
    for user in users:
        print(user)
    print()

def update_user():
    users = load_users()
    user_id = int(input("Enter user ID to update: "))
    
    for user in users:
        if user["id"] == user_id:
            user["name"] = input("Enter new name: ")
            user["age"] = int(input("Enter new age: "))
            save_users(users)
            print("User updated successfully.\n")
            return
    
    print("User not found.\n")

def delete_user():
    users = load_users()
    user_id = int(input("Enter user ID to delete: "))
    
    new_users = [user for user in users if user["id"] != user_id]
    
    if len(new_users) == len(users):
        print("User not found.\n")
        return
    
    save_users(new_users)
    print("User deleted successfully.\n")

# ---------- Main Menu ----------

def main():
    while True:
        print("1. Add User")
        print("2. View Users")
        print("3. Update User")
        print("4. Delete User")
        print("5. Exit")
        
        choice = input("Choose option: ")
        
        if choice == "1":
            add_user()
        elif choice == "2":
            view_users()
        elif choice == "3":
            update_user()
        elif choice == "4":
            delete_user()
        elif choice == "5":
            break
        else:
            print("Invalid choice.\n")

if __name__ == "__main__":
    main()