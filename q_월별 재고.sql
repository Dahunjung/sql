select 품목계정, 오더유형, 기간, 단위, SUM("기말 중량") as 기말중량, SUM("기말 금액") as 기말금액
from t_수불부 t수 
where 품목계정 IN ('FERT', 'HALB', 'ROH')
	and 오더유형 = 'T'
group by 품목계정, 오더유형, 기간, 단위