 -- 12. Tìm nhà xuất bản xb nhiều tài liệu nhất
SELECT 
    nxb.tenXB,
    COUNT(tl.maTaiLieu) AS SoTaiLieu
FROM nhaxuatban nxb
JOIN tailieu tl ON nxb.maXB = tl.maXB
GROUP BY nxb.tenXB
ORDER BY SoTaiLieu DESC
LIMIT 1;
