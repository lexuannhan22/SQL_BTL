-- 8. Tính số lượng tài liệu đang đặt trên từng kệ sách

SELECT ks.tenKe AS tenKe, 'Sach' AS loaiTaiLieu, COUNT(*) AS soLuongTaiLieuTrenTungKe
FROM kesach ks, banin bi
WHERE ks.maKeSach = bi.maKeSach
GROUP BY ks.tenKe
UNION
SELECT ks.tenKe AS tenKe, 'Tai lieu quy hiem' AS loaiTaiLieu, COUNT(*) AS soLuongTaiLieuTrenTungKe
FROM kesach ks, tailieuquyhiem tlqh 
WHERE ks.maKeSach = tlqh.maKeSach
GROUP BY ks.tenKe;


