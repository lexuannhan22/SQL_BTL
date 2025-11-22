-- 7. Nhân viên phụ trách nhiều lượt mượn nhất theo từng quý
WITH ThongKeNhanVienPhuTrachTheoTungQuy AS (
  SELECT 
    nv.maNhanVien,
    nv.tenNhanVien AS tenNhanVien,
    CASE 
      WHEN MONTH(ctm.ngayMuon) BETWEEN 1 AND 3 THEN 'Quý 1'
      WHEN MONTH(ctm.ngayMuon) BETWEEN 4 AND 6 THEN 'Quý 2'
      WHEN MONTH(ctm.ngayMuon) BETWEEN 7 AND 9 THEN 'Quý 3'
      ELSE 'Quý 4'
    END AS quyTrongNam,
    YEAR(ctm.ngayMuon) AS nam,
    COUNT(*) AS soLanPhuTrach
  FROM nhanvien nv
  JOIN phieumuon pm ON nv.maNhanVien = pm.maNhanVien
  JOIN chitietmuon ctm ON ctm.maPhieuMuon = pm.maPhieuMuon
  GROUP BY nv.maNhanVien, nv.tenNhanVien,
           CASE 
             WHEN MONTH(ctm.ngayMuon) BETWEEN 1 AND 3 THEN 'Quý 1'
             WHEN MONTH(ctm.ngayMuon) BETWEEN 4 AND 6 THEN 'Quý 2'
             WHEN MONTH(ctm.ngayMuon) BETWEEN 7 AND 9 THEN 'Quý 3'
             ELSE 'Quý 4'
           END,
           YEAR(ctm.ngayMuon)
)
SELECT 
  t.quyTrongNam,
  m.nam,
  t.tenNhanVien,
  t.soLanPhuTrach
FROM ThongKeNhanVienPhuTrachTheoTungQuy t, (
  SELECT quyTrongNam, nam, MAX(soLanPhuTrach) AS soLanPhuTrachNhieuNhatQuy
  FROM ThongKeNhanVienPhuTrachTheoTungQuy
  GROUP BY quyTrongNam, nam
) m
WHERE t.quyTrongNam = m.quyTrongNam AND t.soLanPhuTrach = m.soLanPhuTrachNhieuNhatQuy
ORDER BY t.quyTrongNam, m.nam;