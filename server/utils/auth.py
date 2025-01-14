from passlib.context import CryptContext
import re
from datetime import timedelta
import unicodedata

from config.jwt_config import AuthJWT
from config.settings import settings

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def hash_password(password: str):
    return pwd_context.hash(password)


def verify_password(password: str, hashed_password: str):
    return pwd_context.verify(password, hashed_password)


def is_valid_email(email: str):
    email_syntax = "^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+\\.[a-z]{1,3}$"
    if re.match(email_syntax, email):
        return True
    return False


def is_valid_password(password: str):
    if len(password) >= 4:
        return True
    return False


def is_valid_phone_number(phone_number: str):
    phone_syntax = r"^(?:\+84|0)[\s\-]?\(?\d{2,3}\)?[\s\-]?\d{3}[\s\-]?\d{3}$"
    if re.match(phone_syntax, phone_number):
        return True
    return False


def is_valid_vietnamese_name(name: str) -> bool:
    # Kiểm tra từng ký tự trong chuỗi
    for char in name:
        # Bỏ qua khoảng trắng (cho phép tên nhiều từ)
        if char.isspace():
            continue
        # Kiểm tra nếu ký tự là chữ cái hoặc chữ cái có dấu
        if not (char.isalpha() or unicodedata.category(char) in ["Ll", "Lu"]):
            return False
    return True


def is_valid_name_surname(name: str, surname: str) -> bool:
    return is_valid_vietnamese_name(name) and is_valid_vietnamese_name(surname)


def create_access_token(authorize: AuthJWT, user_id: str):
    access_token = authorize.create_access_token(
        subject=user_id,
        expires_time=timedelta(minutes=settings.ACCESS_TOKEN_EXPIRES_IN),
    )
    return access_token


def create_refresh_token(authorize: AuthJWT, user_id: str):
    refresh_token = authorize.create_refresh_token(
        subject=user_id,
        expires_time=timedelta(minutes=settings.REFRESH_TOKEN_EXPIRES_IN),
    )
    return refresh_token
