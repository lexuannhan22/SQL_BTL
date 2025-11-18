-- 6. Tài liệu bị mượn quá hạn chưa trả, hiển thị thêm số ngày trễ hạn
SELECT 
    tl.maTaiLieu,
    tl.tenTaiLieu,
    b.maBanIn,
    ctm.hanTra,
    DATEDIFF(CURRENT_DATE, ctm.hanTra) AS soNgayTreHan,
    dg.maDocGia,
    dg.tenDocGia,
    pm.maPhieuMuon
FROM TaiLieu tl
JOIN Sach s ON tl.maTaiLieu = s.maTaiLieu_S
JOIN BanIn b ON s.maTaiLieu_S = b.maTaiLieu_S
JOIN ChiTietMuon ctm ON b.maBanIn = ctm.maBanIn
JOIN PhieuMuon pm ON ctm.maPhieuMuon = pm.maPhieuMuon
JOIN DocGia dg ON pm.maDocGia = dg.maDocGia
WHERE ctm.hanTra < CURRENT_DATE
  AND (ctm.trangThai IS NULL OR ctm.trangThai = 0)
ORDER BY soNgayTreHan DESC;