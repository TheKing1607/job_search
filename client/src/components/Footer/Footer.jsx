import React from "react";
import './Footer.css'; 

const Footer = () => {
    return (
        <footer className="footer">
            <div className="footer-container">
                <div className="footer-left">
                    <p className="footer-description">
                        Quản lý tìm việc làm chuyên nghiệp hàng đầu VN
                    </p>
                </div>

                <div className="footer-links">
                    <h4 className="footer-links-title">Liên kết</h4>
                    <ul className="footer-links-list">
                        <li><a href="/">Dịch vụ</a></li>
                        <li><a href="/">Liên hệ</a></li>
                    </ul>
                </div>

                <div className="footer-contact">
                    <h4 className="footer-contact-title">Liên hệ</h4>
                    <p>Email: jobsearch.hr@website.com</p>
                    <p>Địa chỉ: 334 Nguyễn Trãi, Thanh Xuân, Hà Nội</p>
                </div>
            </div>

            <div className="footer-bottom">
                <p>© 2025 Website của bạn. FROM HUS Trường Đại học Khoa học Tự Nhiên - Đại học Quốc Gia Hà Nội.</p>
            </div>
        </footer>
    );
};

export default Footer;
