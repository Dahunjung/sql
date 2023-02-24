select 기간, SUM(매출량) as 매출량, SUM(매출액) as 매출액
from t_품목별구분손익_관리자 t품관 
left join 거래처등록_관리자 t거래
	on t거래."거래처 명" = t품관.판매처
where t거래.주소 like '%전북%'
	and t품관.기간 like '2021%'
group by 기간