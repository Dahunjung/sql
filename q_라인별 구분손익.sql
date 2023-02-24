select 년월, sum(매출량) as 매출량, sum(매출금액) as 매출금액, sum(영업이익) as 영업이익, t실pk.작업장
from t_품목별구분손익_배치번호 t품배 
left join
		(
	select *
	from t_실적보고상세
	where 작업장 like 'PK%'
	) t실pk
	on t품배.배치번호 = t실pk."Batch(완료)" 
where 품목계정 = 'FERT'
group by 년월, t실pk.작업장
order by 년월 desc 