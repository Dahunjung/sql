select 부서, 작업장, "재질(강종)", 유통경로, SUM(생산량) as 생산량
from t_생산오더별_제조원가 t생제 
where 품목계정 = 'HALB'
	and 기간 like '2021%'
	and 작업장 = 'GL301'
	and "재질(최종제품)" in ('RMP', 'PVDF', 'PRINT', 'LAMI', 'HPP', 'EMBO', 'AL', 'STS')
group by 부서, 작업장, "재질(강종)", 유통경로