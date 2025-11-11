-- 1. Tác giả có tổng giá trị tài liệu quý hiếm cao nhất đơn vị tính là triệu đồng
WITH GiaTriTacGia AS (
    SELECT 
        tg.maTacGia,
        tg.tenTacGia,
        SUM(tlqh.giaTri) AS tongGiaTri
    FROM TacGia tg
    JOIN SangTac st ON tg.maTacGia = st.maTacGia
    JOIN TaiLieu tl ON st.maTaiLieu = tl.maTaiLieu
    JOIN TaiLieuQuyHiem tlqh ON tl.maTaiLieu = tlqh.maTaiLieu_TLQH
    GROUP BY tg.maTacGia, tg.tenTacGia
)
SELECT tenTacGia AS ten_tac_gia, (tongGiaTri / 1000000.0) AS "tong_gia_tri(don vi: trieu dong)"
FROM GiaTriTacGia
ORDER BY tongGiaTri DESC
LIMIT 1;