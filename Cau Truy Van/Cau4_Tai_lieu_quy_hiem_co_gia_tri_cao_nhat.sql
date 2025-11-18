-- 4.	Tìm các tài liệu hiếm có giá trị cao nhất trong mỗi kệ sách
SELECT ks.tenKe, tl.tenTaiLieu, tlqh.giaTri 
FROM tailieuquyhiem tlqh 
INNER JOIN tailieu tl ON tlqh.maTaiLieu_TLQH = tl.maTaiLieu 
INNER JOIN kesach ks ON ks.maKeSach = tlqh.maKeSach 
WHERE tlqh.giaTri = (         
	SELECT MAX(tlqh2.giaTri)         
	FROM TaiLieuQuyHiem tlqh2         
	WHERE tlqh2.maKeSach = ks.maKeSach     
);
