select concat(TRUNC(months_between(sysdate, tgl_lahir) / 12), ' Tahun') as usia,  count(TRUNC(months_between(sysdate, tgl_lahir) / 12)) as value,
concat(count(*), ' Orang') as Jumlah  
from peserta_vaksin
where tgl_lahir is not null

group by TRUNC(months_between(sysdate, tgl_lahir) / 12)
order by count(TRUNC(months_between(sysdate, tgl_lahir) / 12));
