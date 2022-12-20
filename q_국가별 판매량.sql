select "국가코드 (납품처)", sum(매출량)
from t_품목별구분손익_관리자 t품관  
where 기간 like '2020%'
	and 품목계정 = '완제품'
	and 자재그룹 = 'GI'
	and 유통경로 like '%수출%'
group by ("국가코드 (납품처)")