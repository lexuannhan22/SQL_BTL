-- 14. Cập nhật trạng thái chi tiết mượn của các độc giả
SET SQL_SAFE_UPDATES = 0;
UPDATE chitietmuon
SET trangThai = 'Quá hạn'
WHERE trangThai = 'Đang mượn' and hanTra < current_date();