select JML_VAKSIN_TERSEDIA, jenis_vaksin, concat(jml_vaksin_tersedia, ' Unit') as unit,
instansi.nama_instansi
from vaccine
INNER JOIN instansi ON vaccine.ID_INSTANSI = instansi.ID_INSTANSI
where vaccine.JENIS_VAKSIN is not null
group by JML_VAKSIN_TERSEDIA, jenis_vaksin, instansi.nama_instansi
order by JML_VAKSIN_TERSEDIA
