BEGIN;

-- ---------------------------------------------------Tai lieu quy hiem ---------------------------------
INSERT INTO TaiLieuQuyHiem (maTaiLieu_TLQH, nguocGoc, tinhTrangBaoQuan, giaTri, mucDoQuyHiem, maKeSach) VALUES
-- Phân bổ 5 tài liệu vào Kệ KS007
('TL001', N'Bộ Văn Hóa', N'Cần phục chế', 25000000.00, N'Rất cao', 'KS007'),
('TL003', N'Bản dịch cũ', N'Cần phục chế gấp', 80000000.00, N'Rất cao', 'KS007'),
('TL004', N'Đơn vị y học cổ', N'Tốt, hạn chế tiếp xúc', 12000000.00, N'Cao', 'KS007'),
('TL008', N'Bản thảo đầu tiên', N'Tốt, ký tặng tác giả', 30000000.00, N'Rất cao', 'KS007'),
('TL011', N'Nhà sưu tầm tư nhân', N'Tốt', 5000000.00, N'Trung bình', 'KS007'),

-- Phân bổ 5 tài liệu vào Kệ KS008
('TL005', N'Cục Lưu trữ quốc gia', N'Bảo quản nghiêm ngặt', 150000000.00, N'Tuyệt mật', 'KS008'),
('TL009', N'Thư viện Trung ương', N'Tốt, đóng khung', 20000000.00, N'Cao', 'KS008'),
('TL012', N'Viện Sinh học', N'Tốt', 8000000.00, N'Trung bình', 'KS008'),
('TL013', N'Trường Đại học Bách Khoa', N'Rất tốt', 2500000.00, N'Trung bình', 'KS008'),
('TL014', N'Sở Xây dựng', N'Tốt', 7500000.00, N'Trung bình', 'KS008'), -- Dòng này đã đúng từ đầu

-- Phân bổ 5 tài liệu vào Kệ KS009
('TL002', N'Viện Sử Học', N'Bảo quản nghiêm ngặt', 50000000.00, N'Tuyệt mật', 'KS009'), -- Dòng này đã đúng từ đầu
('TL007', N'Dòng họ Nguyễn', N'Bảo quản nghiêm ngặt', 35000000.00, N'Rất cao', 'KS009'), -- Dòng này đã đúng từ đầu
('TL015', N'Cục Địa chính', N'Hư hỏng nhẹ', 15000000.00, N'Cao', 'KS009'), -- Dòng này đã đúng từ đầu
('TL017', N'Bảo tàng Mỹ thuật', N'Tốt', 6000000.00, N'Trung bình', 'KS009'), -- Dòng này đã đúng từ đầu
('TL016', N'Bộ Tư pháp', N'Rất tốt', 9000000.00, N'Trung bình', 'KS009'),

-- Phân bổ 5 tài liệu vào Kệ KS010
('TL006', N'Tòa soạn Báo', N'Tốt, đóng khung', 15000000.00, N'Cao', 'KS010'), -- Dòng này đã đúng từ đầu
('TL010', N'Nhà thờ Lớn', N'Cần phục chế', 10000000.00, N'Trung bình', 'KS010'), -- Dòng này đã đúng từ đầu
('TL018', N'Cục Cảnh sát', N'Tốt', 8000000.00, N'Trung bình', 'KS010'),
('TL019', N'Viện Hóa học', N'Rất tốt', 4000000.00, N'Trung bình', 'KS010'),
('TL020', N'Quỹ khoa học', N'Tốt', 11000000.00, N'Cao', 'KS010');

COMMIT;