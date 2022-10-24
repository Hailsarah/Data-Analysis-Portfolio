-- Soal no. 1
-- mengambil data dengan kolom kota, alamat, dan total order (total dari order yang ada) yang bukan berasal dari kota depok
SELECT
   kota,
   alamat,
   COUNT(DISTINCT id_order) AS total_order 
FROM
   rakamin_order AS ro 
   LEFT JOIN
      rakamin_customer_address AS rca 
      ON ro.id_pelanggan = rca.id_pelanggan 
WHERE
   kota <> 'Depok' 
GROUP BY
   kota,
   alamat 
ORDER BY
   total_order DESC;



-- Soal no. 2
-- join rc table dengan ro table dan mengambil customer_id, nomor_telepon, email, dan tpv(harga * kuantitas)
-- dengan ketentuan customer menggunakan email berdomain 'yahoo.com' dan bukan penipu
SELECT
   rc.id_pelanggan AS customer_id,
   rc.nama,
   rc.telepon AS nomor_telepon,
   rc.email,
   sum(ro.harga * ro.kuantitas) AS tpv 
FROM
   rakamin_customer rc 
   LEFT JOIN
      rakamin_order ro 
      ON rc.id_pelanggan = ro.id_pelanggan 
WHERE
   rc.email LIKE '%@yahoo.com' 
   AND rc.penipu = 0 
GROUP BY
   1, 2, 3, 4 
ORDER BY
   tpv DESC;



-- Soal no. 3

WITH user_cash_non_cash AS 
(
   SELECT
      id_pelanggan,
      metode_bayar,
      bayar_cash,
      COUNT(DISTINCT 
      CASE
         WHEN
            bayar_cash = 1 
         THEN
            id_order 
      END
	    ) AS total_order_cash, 
      COUNT(DISTINCT 
      CASE
         WHEN
            bayar_cash = 0 
         THEN
            id_order 
      END
	    ) AS total_order_non_cash, COUNT(DISTINCT id_order) AS jumlah_order 
   FROM
      rakamin_order ro 
   GROUP BY
      1, 2, 3 
   HAVING
      COUNT(DISTINCT 
      CASE
         WHEN
            bayar_cash = 0 
         THEN
            id_order 
      END
	   ) = 0 
)
SELECT
   rc.nama,
   rc.email,
   rc.telepon,
   rca.alamat,
   ucnc.metode_bayar,
   ucnc.jumlah_order 
FROM
   user_cash_non_cash AS ucnc 
   LEFT JOIN
      rakamin_customer rc 
      ON rc.id_pelanggan = ucnc.id_pelanggan 
   LEFT JOIN
      rakamin_customer_address rca 
      ON rc.id_pelanggan = rca.id_pelanggan 
WHERE
   rc.konfirmasi_telepon = 1 
   AND rc.penipu = 0 
   AND rc.pengguna_aktif = 1


-- Soal no. 4
-- menampilkan jumlah order dan metode bayar untuk memberi insight kepada stakeholder seberapa banyak order yang dilakuan setiap customer berdasarkan metode bayarnya
-- selain itu dilakukan filter metoder bayar cash, bukan penipu, sudah konfirmasi telepon, dan merupakan pengguna aktif
-- hal ini dilakukan agar data yg terlihat valid, karena merupakan customer yang real bukan bot/penipu
-- bisa juga dilakukan campaign diskon sekian persen untuk penggunaan metode bayar cashless yang pertama kalinya untuk orang2 yg cenderung prefer cash
SELECT
  nama,
  email,
  telepon,
  alamat,
  metode_bayar,
  COUNT(id_order) AS jumlah_order
FROM
  rakamin_customer rc
  LEFT JOIN rakamin_customer_address rca ON rc.id_pelanggan = rca.id_pelanggan
  LEFT JOIN rakamin_order ro ON rc.id_pelanggan = ro.id_pelanggan
WHERE
  penipu = 0
  AND pengguna_aktif = 1
  AND konfirmasi_telepon = 1
  AND metode_bayar = 'cash'
GROUP BY
  1,
  2,
  5,
  4,
  3



-- Soal no.5
-- menampilkan kota dan jumlah pelanggan berdasarkan tipe-tipe membernya

WITH cte_member AS (
  SELECT
    id_pelanggan,
    kuantitas * harga AS total_belanja,
    (kuantitas * harga) / 1000 AS point,
    CASE WHEN (kuantitas * harga) / 1000 > 300 THEN 'Gold Member' WHEN (kuantitas * harga) / 1000 <= 300 THEN 'Silver Member' WHEN (kuantitas * harga) / 1000 <= 100 THEN 'Bronze Member' WHEN (kuantitas * harga) / 1000 < 10 THEN 'Non Member' END AS member_type
  FROM
    rakamin_order
  WHERE
    bayar_cash = 0
)
SELECT
  kota,
  COUNT(
    CASE WHEN member_type = 'Gold Member' THEN member_type END
  ) AS Jumlah_Gold_Member,
  COUNT(
    CASE WHEN member_type = 'Silver Member' THEN member_type END
  ) AS Jumlah_Silver_Member,
  COUNT(
    CASE WHEN member_type = 'Bronze Member' THEN member_type END
  ) AS Jumlah_Bronze_Member,
  COUNT(
    CASE WHEN member_type = 'Non Member' THEN member_type END
  ) AS Jumlah_Non_Member
FROM
  cte_member AS ctem
  LEFT JOIN rakamin_customer_address rca ON ctem.id_pelanggan = rca.id_pelanggan
GROUP BY
  1
ORDER BY
  2 DESC
