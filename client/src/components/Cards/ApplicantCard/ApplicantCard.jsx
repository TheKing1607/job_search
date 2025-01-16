import React from 'react';

import styles from './ApplicantCard.module.scss';

import { deleteApplicant, fromArchiveApplicant, fromArchiveMySummary, inArchiveApplicant, inArchiveMySummary } from '../../../services/applicant';

import GreenButton from '../../Buttons/GreenButton/GreenButton';
import BlueButton from '../../Buttons/BlueButton/BlueButton';
import RedButton from '../../Buttons/RedButton/RedButton';

function ApplicantCard({ applicant_id, created_at, speciality, experience, salary, phone_number, email, resume_text, is_archived, role, applicants, setApplicants, mySummary, setMySummary, showButtons = true }) {
    return (
        <div className={styles.applicantCard}>
            <div className={styles.applicantCardDate}>
                <span className='small-text'>Mã số: {applicant_id}</span>
                <span className='small-text'>Ngày đăng hồ sơ: {created_at.split('T')[0]}</span>
            </div>
            <div className={`line`}></div>
            <div className={styles.applicantCardMain}>
                <div className={styles.applicantCardTitle}>
                    <h3 className={`title`}>{speciality}</h3>
                    <span className='small-text'>Kinh nghiệm làm việc: <span className={`title`}>{experience} năm</span></span>
                </div>
                <p className="gray-text">Mong muốn mức lương: <span className={`dark-text`}>{salary} <span className={`green-text`}>VND</span> </span></p>
                <div className={styles.applicantCardContacts}>
                    <h3 className={`dark-text`}>Liên hệ</h3>
                    <div className={styles.applicantCardContactsContent}>
                        <p className={`small-text`}>Số điện thoại: <span className={`blue-text`}>{phone_number}</span></p>
                        <p className={`small-text`}>Email: <span className={`blue-text`}>{email}</span></p>
                    </div>
                </div>
            </div>

            <div className={styles.applicantCardDescription}>
                <span className='dark-text'>Giới thiệu bản thân: <p className={`gray-text`}>{resume_text}</p></span>
            </div>

            {role === 'applicant' && showButtons ? (
                <div className={`buttons`}>
                    {is_archived === false ? (
                        <BlueButton
                            title={"Ẩn CV"}
                            onClick={() => inArchiveMySummary(applicant_id, mySummary, setMySummary)}
                        />
                    ) : (
                        <BlueButton
                            title={"Hiện CV"}
                            onClick={() => fromArchiveMySummary(applicant_id, mySummary, setMySummary)}
                        />
                    )}
                </div>
            ) : (
                null
            )}
            {role === 'admin' && (
                <div className={`buttons`}>
                    <RedButton
                        title={"Xóa"}
                        onClick={() => deleteApplicant(applicant_id, applicants, setApplicants)}
                    />
                    {is_archived === false ? (
                        <BlueButton
                            title={"Lưu vào kho lưu trữ"}
                            onClick={() => inArchiveApplicant(applicant_id, applicants, setApplicants).catch(err => console.error("Failed to archive:", err))}
                        />
                    ) : (
                        <BlueButton
                            title={"Bỏ lưu khỏi kho lưu trữ"}
                            onClick={() => fromArchiveApplicant(applicant_id, applicants, setApplicants)}
                        />
                    )}
                </div>
            )}
        </div>
    );
}

export default ApplicantCard;
