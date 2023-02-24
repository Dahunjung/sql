select "재질(강종)", SUM(생산량) as 생산량
from t_생산오더별_제조원가 t생제 
where 기간 like '2018%'
	and 작업장 = 'CL302'
group by "재질(강종)"