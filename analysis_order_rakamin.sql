-- Soal no. 1
-- Mengetahui kota (unik) mana saja asal customer
SELECT 
  DISTINCT kota 
FROM 
  rakamin_customer_address;


-- Soal no. 2
-- Mengetahui kolom-kolom 10 pembelian tearatas pada tabel rakamin order berdasarkan tanggal pembelian terkini 
SELECT 
  * 
FROM 
  rakamin_order 
ORDER BY 
  tanggal_pembelian DESC 
LIMIT 
  10;


-- Soal no. 3
-- Mengetahui banyaknya customer yang dikategorikan sebagai penipu
SELECT 
  COUNT(id_pelanggan) AS customer_penipu 
FROM 
  rakamin_customer 
WHERE 
  penipu = 1;


-- Soal no. 4
-- Mengetahui dan mengkategorikan email-email berdasarkan platform email, untuk "Google", "Outlook", "Yahoo", dan "Others"
SELECT 
  *, 
  CASE WHEN email like '%gmail%' THEN 'Google' 
       WHEN email like '%yahoo%' THEN 'Yahoo' 
       WHEN email like '%outlook%' THEN 'Outlook' 
       ELSE 'Others' 
  END AS email_platform 
FROM 
  rakamin_customer 
WHERE 
  tanggal_registrasi BETWEEN '2013-01-01' 
  AND '2013-06-30' 
  AND umur >= 17 
ORDER BY 
  email_platform;


-- Soal no.5
-- Membandingkan banyaknya transaksi, banyaknya spending terendah, rata-rata dan tertinggi
SELECT 
  metode_bayar, 
  COUNT(*) AS jumlah_transaksi, 
  MIN(harga) AS harga_terendah, 
  AVG(harga) AS harga_rata_rata, 
  MAX(harga) AS harga_tertinggi, 
  SUM(harga) AS total_spending 
FROM 
  rakamin_order 
WHERE 
  metode_bayar IN ('ovo', 'gopay') 
  AND id_merchant IN (3, 5, 6) 
GROUP BY 
  metode_bayar;


-- Soal no.6
-- Menampilkan spending_group berdasarkan metode bayar selain cash dan jumlah customer uniknya
SELECT 
  metode_bayar, 
  CASE WHEN harga + (harga * ppn) < 30000 THEN 'Low Spending' 
  	   WHEN harga + (harga * ppn) BETWEEN 30000 AND 50000 
	   		THEN 'Medium Spending'
	   WHEN harga + (harga * ppn) > 50000 THEN 'High Spending' 
  END AS spending_group, 
  COUNT(distinct id_pelanggan) AS jumlah_customer_unik
FROM 
  rakamin_order 
WHERE 
  metode_bayar <> 'cash' 
GROUP BY 
  metode_bayar, 
  spending_group;
