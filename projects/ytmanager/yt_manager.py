import json

def load_data():
    try:
        with open('youtube.txt','r') as file:
            test =  json.load(file)
            return test
    except (FileNotFoundError,json.JSONDecodeError):
        return []
    
def save_data_helper(videos):
    with open('youtube.txt','w') as file:
        json.dump(videos,file)

def list_all_videos(videos):
    print("\n")
    print("*"*70)
    for index,video in enumerate(videos,start=1):
        print(f"{index}.{video['name']},Duration:{video['time']}")
    print("\n")
    print("*"*70)

def add_videos(videos):
    name = input("enter video name: ")
    time = input("enter video time :")
    videos.append({'name': name,'time':time})
    save_data_helper(videos)

def update_video(videos):
    list_all_videos(videos)
    index = int(input("enter the video to update "))
    if 1 <= index <= len(videos):
        name = input("enter the new video name")
        time = input("enter the new video time")
        videos[index-1] = {'name':name,'time':time}
        save_data_helper(videos)
    else:
        print("invalid ibdex selected")

def delete_video(videos):
    list_all_videos(videos)
    index = int(input("Enter the video number tobe deleted"))

    if 1<= index <= len(videos):
        del videos[index-1]
        save_data_helper(videos)
    else:
        print("invalid videos index seleted")   


def main():
    videos = load_data()
    while True:
        print('\n Youtube Manager ')
        print("1. list all videos")
        print("2. add a video")
        print("3. update a yt video detail")
        print("4. delete a video")
        print("5. Exit")
        chioce = input("Enter your choice: ")

        match chioce:
            case '1':
                list_all_videos(videos)
            case '2':

                add_videos(videos)
            case '3':
                update_video(videos)
            case '4':
                delete_video(videos)
            case '5':
                break
            case _:
                print("invalid choice")

if __name__ =="__main__":
    main()