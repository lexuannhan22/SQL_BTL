-- 5. Tính tổng giá trị tài liệu quý hiếm của từng tác giả đơn vị tính là triệu đồng
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
ORDER BY tongGiaTri DESC;