from models.user import User
from sqlalchemy.orm import Session


def is_admin(user_id: int, db: Session):
    admin = db.query(User).filter(User.id == user_id).first()

    if admin.role == "admin":
        return True
    return False
