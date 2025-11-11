-- 2.	Liệt kê các độc giả chưa trả sách quá hạn với thông tin mã độc giả, tên độc giả, số lượng sách chưa trả
SELECT dg.maDG AS ma_doc_gia, dg.tenDocGia AS ten_doc_gia, COUNT(dg.maDG) AS so_luong_sach_chua_tra
FROM docgia dg
JOIN chitietmuon ctm ON dg.maDG = ctm.maDG
JOIN banin bi ON bi.maPhieuMuon = ctm.maPhieuMuon
WHERE ctm.trangThai = 'Quá hạn'
GROUP BY dg.maDG, dg.tenDocGia;