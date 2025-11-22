-- Đếm số lượng bản in còn có sẵn của một cuốn sách
SELECT 
    s.maTaiLieu_S,
    COUNT(bi.maBanIn) AS SoBanInCoSan
FROM Sach s
JOIN BanIn bi ON s.maTaiLieu_S = bi.maTaiLieu_S
LEFT JOIN ChiTietMuon ctm ON bi.maBanIn = ctm.maBanIn 
WHERE ctm.maBanIn IS NULL-- Bản in không có trong danh sách "Đang mượn" 
  AND s.maTaiLieu_S = "TL118" 
GROUP BY s.maTaiLieu_S;