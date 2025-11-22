 -- 12. Tìm nhà xuất bản xb nhiều tài liệu nhất
SELECT 
    nxb.tenXB,
    COUNT(tl.maTaiLieu) AS SoTaiLieu
FROM nhaxuatban nxb
JOIN tailieu tl ON nxb.maXB = tl.maXB
GROUP BY nxb.tenXB
HAVING COUNT(tl.maTaiLieu) = (
	SELECT MAX(tmp.soLan)
    FROM (
		SELECT COUNT(tl.maTaiLieu) AS soLan
        FROM nhaxuatban nxb
        JOIN tailieu tl ON nxb.maXB = tl.maXB
        GROUP BY nxb.maXB
    ) AS tmp
);
