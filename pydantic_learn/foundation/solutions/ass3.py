from pydantic import BaseModel
from typing import Optional,List,Dict

class Lesson(BaseModel):
    lesson_id: str
    topic: str

class Module(BaseModel):
    module_id: str
    