select substring(기간,1,4) as 년, 부서코드, sum(매출량) as 매출량, sum(내수운반비) as 내수운반비, sum("수출개별비-운반비") as 수출운반비
from t_품목별구분손익_관리자 t품관 
where 품목계정 = '완제품'
	and 주문유형 = 'T'
group by 년, 부서코드
order by 년 asc, 부서코드 asc