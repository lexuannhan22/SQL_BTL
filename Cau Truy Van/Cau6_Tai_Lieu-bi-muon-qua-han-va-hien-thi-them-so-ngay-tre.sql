-- 6. Tài liệu bị mượn quá hạn và chưa trả, hiển thị thêm số ngày trễ hạn
SET SQL_SAFE_UPDATES = 0;

UPDATE chitietmuon
SET trangThai = 'Quá hạn'
WHERE trangThai = 'Đang mượn' and hanTra < NOW();

SELECT 
    dg.tenDocGia,
    tl.tenTaiLieu,
    ct.ngayMuon,
    ct.hanTra,
    ABS(DATEDIFF(NOW(), ct.hanTra)) AS soNgayTreHan,
    CASE
        WHEN ABS(DATEDIFF(NOW(), ct.hanTra)) > 7 THEN 'Cảnh báo đỏ'
        WHEN ABS(DATEDIFF(NOW(), ct.hanTra)) > 5 THEN 'Cảnh báo vàng'
        ELSE 'Nhắc nhẹ'
    END AS mucDoViPham
FROM
    ChiTietMuon ct
        JOIN
    DocGia dg ON ct.maDG = dg.maDG
        JOIN
    BanIn bi ON ct.maPhieuMuon = bi.maPhieuMuon
        JOIN
    TaiLieu tl ON bi.maTaiLieu_S = tl.maTaiLieu
WHERE
    ct.trangThai = 'Quá hạn'
ORDER BY soNgayTreHan DESC;

