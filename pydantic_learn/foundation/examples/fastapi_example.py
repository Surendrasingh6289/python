from fastapi import FastAPI,Depends
from pydantic import BaseModel,EmailStr

app = FastAPI()

class userSingup(BaseModel):
    username: str
    email: EmailStr
    password: str

class Settings(BaseModel):
    app_name: str = 'chai app'
    admin_email : str = 'admin@chai.com'



@app.post('/signup')
def signup(user: userSingup):
    return {'message': f'user{user.username} signed up sucessfully'}

@app.get('/settings')
def get_settings_endpoint(settings: Settings=Depends(get_settings))