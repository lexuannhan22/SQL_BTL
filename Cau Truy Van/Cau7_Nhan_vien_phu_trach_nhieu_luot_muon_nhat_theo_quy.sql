-- 7. Nhân viên phụ trách nhiều lượt mượn nhất theo từng quý
WITH ThongKeNhanVienPhuTrachTheoTungQuy AS (
  SELECT 
    nv.maNhanVien,
    nv.tenNV AS tenNhanVien,
    CASE 
      WHEN MONTH(ctm.ngayMuon) BETWEEN 1 AND 3 THEN 'Quý 1'
      WHEN MONTH(ctm.ngayMuon) BETWEEN 4 AND 6 THEN 'Quý 2'
      WHEN MONTH(ctm.ngayMuon) BETWEEN 7 AND 9 THEN 'Quý 3'
      ELSE 'Quý 4'
    END AS quyTrongNam,
    COUNT(*) AS soLanPhuTrach
  FROM nhanvien nv
  JOIN chitietmuon ctm ON nv.maNhanVien = ctm.maNhanVien
  GROUP BY nv.maNhanVien, nv.tenNV,
           CASE 
             WHEN MONTH(ctm.ngayMuon) BETWEEN 1 AND 3 THEN 'Quý 1'
             WHEN MONTH(ctm.ngayMuon) BETWEEN 4 AND 6 THEN 'Quý 2'
             WHEN MONTH(ctm.ngayMuon) BETWEEN 7 AND 9 THEN 'Quý 3'
             ELSE 'Quý 4'
           END
)
SELECT 
  t.quyTrongNam,
  t.tenNhanVien,
  t.soLanPhuTrach
FROM ThongKeNhanVienPhuTrachTheoTungQuy t, (
  SELECT quyTrongNam, MAX(soLanPhuTrach) AS soLanPhuTrachNhieuNhatQuy
  FROM ThongKeNhanVienPhuTrachTheoTungQuy
  GROUP BY quyTrongNam
) m
WHERE t.quyTrongNam = m.quyTrongNam AND t.soLanPhuTrach = m.soLanPhuTrachNhieuNhatQuy
ORDER BY t.quyTrongNam;
