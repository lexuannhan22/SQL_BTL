-- 11. Thống kê số lượng tài liệu theo thể loại và tình trạng bảo quản
SELECT 
    tl.theLoai,
    tlqh.tinhTrangBaoQuan,
    COUNT(tlqh.maTaiLieu_TLQH) AS SoLuong
FROM TaiLieu tl
JOIN TaiLieuQuyHiem tlqh ON tl.maTaiLieu = tlqh.maTaiLieu_TLQH
GROUP BY tl.theLoai, tlqh.tinhTrangBaoQuan
ORDER BY SoLuong DESC;