-- 13. Thống kê số lượng tài liệu mỗi phòng đọc đang quản lý
(SELECT 
    pd.tenPD,
    'Tai Lieu quy hiem' AS LoaiTaiLieu,
    COUNT(*) AS SoTaiLieu
FROM PhongDoc pd
JOIN KeSach ks ON pd.maPD = ks.maPD
JOIN TaiLieuQuyHiem tlqh ON ks.maKeSach = tlqh.maKeSach
GROUP BY pd.tenPD)
UNION 
(SELECT 
    pd.tenPD,
	'Sach' AS LoaiTaiLieu,
    COUNT(*) AS SoTaiLieu
FROM phongdoc pd
JOIN kesach ks ON pd.maPD = ks.maPD
JOIN banin bi ON ks.maKeSach = bi.maKeSach
GROUP BY pd.tenPD);