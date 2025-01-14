from sqlalchemy import and_

from models.vacancy import Vacancy
from models.applicant import Applicant

salary_filters_for_vacancy = {
    "0-20": and_(Vacancy.salary.between(0, 2000000)),
    "20-80": and_(Vacancy.salary.between(2000000, 8000000)),
    "80-160": and_(Vacancy.salary.between(8000000, 16000000)),
    "160": Vacancy.salary >= 16000000
}

experience_filters_for_vacancy = {
    "0": Vacancy.experience == "0",
    "1-3": and_(Vacancy.experience.between(1, 3)),
    "4-7": and_(Vacancy.experience.between(4, 7)),
    "8": Vacancy.experience >= 8
}

salary_filters_for_applicants = {
    "20-60": and_(Applicant.salary.between(2000000, 6000000)),
    "60-100": and_(Applicant.salary.between(6000000, 10000000)),
    "100-160": and_(Applicant.salary.between(10000000, 16000000)),
    "160": Applicant.salary >= 16000000
}

experience_filters_for_applicants = {
    "0": Applicant.experience == "0",
    "1-3": and_(Applicant.experience.between(1, 3)),
    "4-7": and_(Applicant.experience.between(4, 7)),
    "8": Applicant.experience >= 8
}
