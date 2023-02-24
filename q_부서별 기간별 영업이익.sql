select 기간, SUM(영업이익) as 영업이익
from t_품목별구분손익_관리자 t품관 
where 부서코드 = '소재영업팀'
	and 자재그룹 like 'G%'
group by 기간