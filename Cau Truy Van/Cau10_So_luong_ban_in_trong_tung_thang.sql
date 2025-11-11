-- 10. Số bản in nhập trong từng tháng
SELECT MONTH(bi.ngayNhap) AS Thang, YEAR(bi.ngayNhap) AS Nam, COUNT(*) AS SoLuong
FROM banin bi
GROUP BY MONTH(bi.ngayNhap), YEAR(bi.ngayNhap);