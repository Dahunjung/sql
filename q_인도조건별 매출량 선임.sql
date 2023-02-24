select substring(기간,1,4) as 년, 인도조건, sum(매출량) as 매출량, sum("매출원가-선임") as 선임
from t_품목별구분손익_관리자 t품관 
where 유통경로 like '%수출%'	
	and "시장(중분류)" not like '%가전%'
group by 년, 인도조건