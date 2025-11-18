-- 7. Nhân viên phụ trách nhiều lượt mượn nhất theo từng quý
WITH RankedNhanVien AS (
    SELECT 
        YEAR(ctm.ngayMuon) AS Nam,
        QUARTER(ctm.ngayMuon) AS Quy,
        nv.maNhanVien,
        nv.tenNhanVien,
        COUNT(DISTINCT pm.maPhieuMuon) AS SoLuotMuon,
        RANK() OVER (
            PARTITION BY YEAR(ctm.ngayMuon), QUARTER(ctm.ngayMuon) 
            ORDER BY COUNT(DISTINCT pm.maPhieuMuon) DESC
        ) AS XepHang
    FROM ChiTietMuon ctm
    JOIN PhieuMuon pm ON ctm.maPhieuMuon = pm.maPhieuMuon
    JOIN NhanVien nv ON pm.maNhanVien = nv.maNhanVien
    GROUP BY YEAR(ctm.ngayMuon), QUARTER(ctm.ngayMuon), nv.maNhanVien, nv.tenNhanVien
)
SELECT Nam, Quy, maNhanVien, tenNhanVien, SoLuotMuon
FROM RankedNhanVien
WHERE XepHang = 1
ORDER BY Nam, Quy;