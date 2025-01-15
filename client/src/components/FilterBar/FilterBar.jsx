import React from 'react';

import styles from './FilterBar.module.scss';

import BlueButton from '../Buttons/BlueButton/BlueButton';

function FilterBar({ is_vacancies = false, is_applicants = false, onSubmit }) {
  return (
    <div className={styles.filterBar}>
      {is_vacancies &&
        <form className={styles.filterBarContent} onSubmit={onSubmit}>
          <div className={styles.filterBarBlock}>
            <h3 className={`bold-text`}>Thành phố</h3>
            <select className={`${styles.citySelect} ${`blue-text`}`} name="place">
              <option className={`dark-text`} value="Hà Nội">Hà Nội</option>
              <option className={`dark-text`} value="Đà Nẵng">Đà Nẵng</option>
              <option className={`dark-text`} value="Hồ Chí Minh">Hồ Chí Minh</option>
              {/* Thêm các thành phố khác ở đây */}
            </select>
          </div>

          <div className={`line`}></div>

          <div className={styles.filterBarBlock}>
            <h3 className={`bold-text`}>Mức thu nhập</h3>
            <div className={styles.filterBarBlockForm}>

              <label>
                <input value="0-20" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 0 đến 2.000.000 VND</span>
              </label>

              <label>
                <input value="20-80" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 2.000.000 đến 8.000.000 VND</span>
              </label>

              <label>
                <input value="80-160" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 8.000.000 đến 16.000.000 VND</span>
              </label>

              <label>
                <input value="160" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 16.000.000+ VND</span>
              </label>

            </div>
          </div>

          <div className={`line`}></div>

          <div className={styles.filterBarBlock}>
            <h3 className={`bold-text`}>Kinh nghiệm</h3>
            <div className={styles.filterBarBlockForm}>
              <label>
                <input value="0" type="radio" name="experience" />
                <span className={`dark-text`}>Không có kinh nghiệm</span>
              </label>

              <label>
                <input value="1-3" type="radio" name="experience" />
                <span className={`dark-text`}>Từ 1 đến 3 năm</span>
              </label>

              <label>
                <input value="4-7" type="radio" name="experience" />
                <span className={`dark-text`}>Từ 4 đến 7 năm</span>
              </label>

              <label>
                <input value="8" type="radio" name="experience" />
                <span className={`dark-text`}>Từ 8 năm trở lên</span>
              </label>

            </div>
          </div>

          <div className={`line`}></div>
          <BlueButton title={"Áp dụng"} />
        </form>
      }
      {is_applicants &&
        <form className={styles.filterBarContent} onSubmit={onSubmit}>

          <div className={styles.filterBarBlock}>
            <h3 className={`bold-text`}>Mức thu nhập mong muốn</h3>

            <div className={styles.filterBarBlockForm}>

              <label>
                <input value="20-60" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 2.000.000 đến 6.000.000 VND</span>
              </label>

              <label>
                <input value="60-100" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 6.000.000 đến 10.000.000 VND</span>
              </label>

              <label>
                <input value="100-160" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 10.000.000 đến 16.000.000 VND</span>
              </label>

              <label>
                <input value="160" type="radio" name="salary" />
                <span className={`dark-text`}>Từ 16.000.000+ VND</span>
              </label>

            </div>
          </div>

          <div className={`line`}></div>

          <div className={styles.filterBarBlock}>
            <h3 className={`bold-text`}>Kinh nghiệm</h3>

            <div className={styles.filterBarBlockForm}>
              <label>
                <input value="0" type="radio" name="experience" />
                <span className={`dark-text`}>Không có kinh nghiệm</span>
              </label>

              <label>
                <input value="1-3" type="radio" name="experience" />
                <span className={`dark-text`}>Từ 1 đến 3 năm</span>
              </label>

              <label>
                <input value="4-7" type="radio" name="experience" />
                <span className={`dark-text`}>Từ 4 đến 7 năm</span>
              </label>

              <label>
                <input value="8" type="radio" name="experience" />
                <span className={`dark-text`}>Từ 8 năm trở lên</span>
              </label>

            </div>
          </div>

          <div className={`line`}></div>

          <BlueButton title={"Áp dụng"} />
        </form>
      }
    </div>
  );
}

export default FilterBar;
