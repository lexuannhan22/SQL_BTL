-- 3.	Tìm nhân viên xử lý nhiều phiếu mượn nhất
SELECT 
    nv.maNhanVien,
    nv.tenNhanVien AS tenNhanVien,
    COUNT(pm.maPhieuMuon) AS soPhieuMuon
FROM NhanVien nv
JOIN PhieuMuon pm ON nv.maNhanVien = pm.maNhanVien
GROUP BY nv.maNhanVien, nv.tenNhanVien
HAVING COUNT(pm.maPhieuMuon) = (
    SELECT MAX(soPhieuMuon)
    FROM (
        SELECT COUNT(maPhieuMuon) AS soPhieuMuon
        FROM PhieuMuon
        GROUP BY maNhanVien
    ) AS temp
);