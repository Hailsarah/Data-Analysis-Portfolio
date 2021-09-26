select JML_VAKSIN_TERSEDIA, jenis_vaksin, count(JENIS_VAKSIN) value, concat(JML_VAKSIN_TERSEDIA, ' Unit' ) as unit,
instansi.KOTA_INSTANSI
from vaccine
INNER JOIN instansi ON vaccine.ID_INSTANSI = instansi.ID_INSTANSI
where vaccine.JENIS_VAKSIN is not null
group by vaccine.JML_VAKSIN_TERSEDIA, jenis_vaksin, instansi.KOTA_INSTANSI
order by vaccine.JML_VAKSIN_TERSEDIA
