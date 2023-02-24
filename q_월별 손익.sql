select 기간, sum(매출량) as 매출량, sum(매출액) as 매출액, sum(영업이익) as 영업이익
from t_품목별구분손익_관리자 t품관 
group by rollup(기간)
order by 기간