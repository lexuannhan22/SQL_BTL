-- 9. Liệt kê các tác giả và số sách của họ có trong thư viện
SELECT 
    tg.tenTacGia, COUNT(s.maTaiLieu_S) AS soSachCoTrongThuVien
FROM
    TacGia tg
        JOIN
    SangTac st ON tg.maTacGia = st.maTacGia
        JOIN
    TaiLieu tl ON tl.maTaiLieu = st.maTaiLieu
        JOIN
    Sach s ON s.maTaiLieu_S = tl.maTaiLieu
GROUP BY tg.tenTacGia
ORDER BY soSachCoTrongThuVien DESC
