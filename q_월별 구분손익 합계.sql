select 년월, sum(매출량) as 매출량, sum(매출금액) as 매출액, sum(원재료비+원가차이) as 원재료비, sum(부재료비) as 부재료비, sum(동력비+소모품비+감가상각비+수선비+노무비+외주비+복리후생비+기타제조) as 가공비,
	sum("매출원가-선임" + "매출원가-보험료") as 선임, sum(판매관리비) as 판관비, sum(영업이익) as 영업이익
from t_품목별구분손익_배치번호 t품배  
/*where 년월 like '2017%'*/
group by rollup(년월)
order by 년월