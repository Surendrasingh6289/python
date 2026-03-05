from pydantic import BaseModel,Field,op

class Employee(BaseModel):
    id: int
    name: str = Field(
        ...,
        min_length=3,
        max_length=50,
        description="Employee Name",
        example="sURENDRA singh"
    )
    department: Optional[str] = 'General'
    salary: float = Field(...,ge=10000)