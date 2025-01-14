from sqlalchemy.orm import Session
from models.user import User


def is_employer(user_id: int, db: Session):
    employer = db.query(User).filter(User.id == user_id).first()
    if employer.role == "employer":
        return True
    return False
