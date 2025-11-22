-- 2.	Liệt kê các độc giả chưa trả sách (quá hạn) với thông tin mã độc giả, tên độc giả, số lượng sách chưa trả
SELECT 
    dg.maDocGia,
    dg.tenDocGia,
    COUNT(DISTINCT ctm.maBanIn) AS soLuongSachChuaTra
FROM DocGia dg
JOIN PhieuMuon pm ON dg.maDocGia = pm.maDocGia
JOIN ChiTietMuon ctm ON pm.maPhieuMuon = ctm.maPhieuMuon
WHERE ctm.hanTra < CURRENT_DATE OR ctm.trangThai = 'Quá hạn'
GROUP BY dg.maDocGia, dg.tenDocGia
ORDER BY soLuongSachChuaTra DESC;