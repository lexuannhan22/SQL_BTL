-- 1.	Liệt kê các sách được mượn nhiều nhất
SELECT tl.tenTaiLieu AS ten_tai_lieu, COUNT(ctm.maPhieuMuon) AS so_lan_muon
FROM tailieu AS tl 
INNER JOIN sach AS s ON tl.maTaiLieu = s.maTaiLieu_s
INNER JOIN banin AS bi ON bi.maTaiLieu_s = s.maTaiLieu_s
INNER JOIN chitietmuon AS ctm ON ctm.maPhieuMuon = bi.maPhieuMuon
GROUP BY tl.tenTaiLieu
HAVING COUNT(ctm.maPhieuMuon) = (
		SELECT MAX(soLan)
        FROM (
			SELECT COUNT(ctm2.maPhieuMuon) AS soLan
            FROM ChiTietMuon ctm2
            JOIN BanIn b2 ON b2.maPhieuMuon = ctm2.maPhieuMuon
            JOIN Sach s2 ON s2.maTaiLieu_S = b2.maTaiLieu_S
            GROUP BY s2.maTaiLieu_S
		) AS temp
);