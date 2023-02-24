select t실pk.작업장, sum(t품배.매출량) as 매출량, sum(t품배.매출금액) as 매출금액
from t_품목별구분손익_배치번호 t품배 
left join
	(
	select *
	from t_실적보고상세
	where 작업장 like 'PK%'
	) t실pk  
  on t품배.배치번호  = t실pk."Batch(완료)"
where t품배 .년월 like '2022%'
	and t품배 .오더유형 = 'T'
	and t품배 .품목계정 = 'FERT'
group by t실pk.작업장