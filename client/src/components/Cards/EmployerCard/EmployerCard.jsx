import React from 'react';
import { confirmEmployer, deleteEmployer } from '../../../services/employer';

import styles from './EmployerCard.module.scss';

import GreenButton from '../../Buttons/GreenButton/GreenButton';
import RedButton from '../../Buttons/RedButton/RedButton';

function EmployerCard({ employer_id, company_name, company_description, contact, website, created_at, is_confirmed, role, employers, setEmployers }) {
  return (
    <div className={styles.employerCard}>
      <div className={styles.employerCardDate}>
        <span className='small-text'>Mã số: {employer_id}</span>
        <span className='small-text'>Ngày đăng: {created_at.split('T')[0]}</span>
      </div>
      <div className={`line`}></div>
      <div className={styles.employerCardMain}>
        <span className='dark-text'>Công ty: <h3 className={`title`}>{company_name}</h3></span>
        <div className={styles.employerCardContact}>
          <span className='dark-text'>Liên hệ: <p className={`gray-text`}>{contact}</p></span>
          <span className='dark-text'>Website công ty: <a href={website} className={`link-text-blue`}>{website}</a></span>
        </div>
      </div>

      <span className='dark-text'>Mô tả: <span className={`gray-text`}>{company_description}</span></span>

      {role === 'admin' ? (
        is_confirmed ? (
          <RedButton
            title={"Xóa nhà tuyển dụng"}
            onClick={() => deleteEmployer(employer_id, employers, setEmployers)}
          />
        ) : (
          <div className={styles.employerCardButtons}>
            <GreenButton
              title={"Xác nhận"}
              onClick={() => confirmEmployer(employer_id, employers, setEmployers)}
            />
            <RedButton
              title={"Từ chối"}
              onClick={() => deleteEmployer(employer_id, employers, setEmployers)}
            />
          </div>
        )
      ) : null}
    </div>
  );
}

export default EmployerCard;
