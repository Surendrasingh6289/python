from pydantic import BaseModel , ConfigDict #type: ignore
from typing import List
from datetime import datetime

class Address(BaseModel):
    street:str
    city: str
    zip_code: str

class User(BaseModel):
    user_id : int
    name: str
    email: str
    is_active: bool = True
    created_at = datetime
    address: Address
    tags: List[str] = []

    model_config = ConfigDict(
        json_encoders={datetime: lambda v: v.strftime('%d-%m-%Y %H:%M:%S')}
    )

#craete a usr instance

user = User(
    id = 1,
    name ='surendra',
    email = 'surrndrs@gmail.com',
    created_at = datetime(2024,3,15,14,30),
    address = Address(
        street = 'somethong',
        city = 'Indore',
        zip_code = '001144'
    ),
    is_active = False,
    tags = ['premium','subsriber']
)

python_dict = user.model_dump()
print(python_dict)

json_str= user.model_dump_json()
print(json_str)