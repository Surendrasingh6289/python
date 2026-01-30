from tkinter import *

root = Tk()
root.title("Hello Niggas!!!")
root.geometry('350x200')

lbl = Label(root,text='Are you nigga?')
lbl.grid()

txt = Entry(root, width=10)
txt.grid(column =1, row =0)

def clicked():
    lbl.configure(text='i am')
btn = Button(root,text='Click me!!',fg='red',command=clicked)
btn.grid(column=1, row=0)

root.mainloop()