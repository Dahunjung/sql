select substring(t매.매출일자,1,4) as 매출년, SUM(t매.매출중량) as 매출량, t매."TOP 칼라", 색상."1Layer코드 2CCL" , 색상."2Layer코드" , 색상."1-2" , 색상."2" , 색상.fd , 색상.nv 
from t_매출원장 t매 
left join 색상마스터 색상
  on t매."TOP 칼라" = 색상.코드약호
--#상황에 맞는 조건 입력
--where t매.회계관리 = 'AL'
where t매.수지 like '%SQP%'
	and t매.수지기능 = '일반'
group by 매출년, t매."TOP 칼라" , t매."TOP 칼라", 색상."1Layer코드 2CCL" , 색상."2Layer코드" , 색상."1-2" , 색상."2" , 색상.fd , 색상.nv
order by 매출년 asc, 매출량 desc  