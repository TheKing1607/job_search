import React from 'react';

const Home = () => {
    return (
        <div style={styles.container}>
            <section style={styles.introduction}>
                <h2 style={styles.heading}>Chào mừng đến với JobSearch!</h2>
                <p style={styles.paragraph}>
                    JobSearch là nền tảng tìm kiếm việc làm hàng đầu giúp kết nối ứng viên với các nhà tuyển dụng uy tín trên toàn quốc.
                    Với hàng ngàn cơ hội nghề nghiệp đa dạng từ các ngành nghề khác nhau, chúng tôi cam kết mang đến cho bạn công việc phù hợp với kỹ năng và sở thích.
                </p>
            </section>

            <section style={styles.features}>
                <h3 style={styles.featuresHeading}>Các tính năng nổi bật:</h3>
                <ul style={styles.featureList}>
                    <li style={styles.featureItem}>Tìm kiếm việc làm nhanh chóng và dễ dàng</li>
                    <li style={styles.featureItem}>Cập nhật các cơ hội việc làm mới nhất mỗi ngày</li>
                    <li style={styles.featureItem}>Ứng dụng cho phép lọc việc làm theo nhiều tiêu chí như vị trí, mức lương, loại công việc...</li>
                    <li style={styles.featureItem}>Kết nối trực tiếp với các nhà tuyển dụng</li>
                </ul>
            </section>
        </div>
    );
};

const styles = {
    container: {
        padding: '40px',
        maxWidth: '1200px',
        margin: '0 auto',
        fontFamily: '"Helvetica Neue", sans-serif',
        color: '#333',
        backgroundColor: '#f4f7fa',
    },
    introduction: {
        textAlign: 'center',
        marginBottom: '60px',
    },
    heading: {
        fontSize: '2.5rem',
        fontWeight: '700',
        color: '#2e3d49',
        marginBottom: '20px',
    },
    paragraph: {
        fontSize: '1.2rem',
        lineHeight: '1.8',
        color: '#6c757d',
        maxWidth: '900px',
        margin: '0 auto',
    },
    features: {
        marginTop: '60px',
    },
    featuresHeading: {
        fontSize: '2rem',
        fontWeight: '600',
        color: '#2e3d49',
        marginBottom: '20px',
    },
    featureList: {
        listStyleType: 'none',
        paddingLeft: '0',
        marginTop: '20px',
        fontSize: '1.1rem',
    },
    featureItem: {
        padding: '10px',
        backgroundColor: '#fff',
        borderRadius: '8px',
        marginBottom: '15px',
        boxShadow: '0 4px 6px rgba(0, 0, 0, 0.1)',
        transition: 'transform 0.3s ease, box-shadow 0.3s ease',
    },
    featureItemHover: {
        transform: 'scale(1.05)',
        boxShadow: '0 6px 8px rgba(0, 0, 0, 0.15)',
    },
};

export default Home;
