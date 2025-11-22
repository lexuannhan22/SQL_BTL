-- 1.	Liệt kê các bản in sách được mượn nhiều nhất
SELECT 
    b.maBanIn,
    tl.tenTaiLieu AS tenSach,
    COUNT(*) AS soLanMuon
FROM ChiTietMuon ctm
JOIN BanIn b ON ctm.maBanIn = b.maBanIn
JOIN Sach s ON b.maTaiLieu_S = s.maTaiLieu_S
JOIN TaiLieu tl ON s.maTaiLieu_s = tl.maTaiLieu
GROUP BY b.maBanIn, tl.tenTaiLieu
HAVING COUNT(*) = (
    SELECT MAX(soLanMuon)
    FROM (
        SELECT COUNT(*) AS soLanMuon
        FROM ChiTietMuon
        GROUP BY maBanIn
    ) AS temp
);