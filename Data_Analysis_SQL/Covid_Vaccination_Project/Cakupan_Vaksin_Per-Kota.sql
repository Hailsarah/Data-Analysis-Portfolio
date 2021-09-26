--- Analyze Vaccination Coverage in Urban Area ---
--- First, the Chart should show us: City (kota), row of citizen's id (nik), value of how many row of citizen's id (nik) + ' Orang' ---
--- The data i took was from peserta_vaksin Table ---
--- Grouping by kota ---
--- Ascending Order by kota ---
SELECT kota, COUNT(nik) value, CONCAT(COUNT(nik), ' Orang')
FROM peserta_vaksin
WHERE kota is not null
GROUP BY kota
ORDER BY kota;
