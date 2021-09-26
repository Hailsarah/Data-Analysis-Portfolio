select dosis_vaksin, count(nik) value , concat(count(nik), ' Orang') as jumlah_orang,
CONCAT('Dosis ', dosis_vaksin)
from Vaccination
where DOSIS_VAKSIN is not null
group by DOSIS_VAKSIN
order by count(nik);
