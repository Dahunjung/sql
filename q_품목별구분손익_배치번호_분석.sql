select
	t품배.*
	, t실pk.작업장
	, t실pk.일자
	, substring(t실pk.일자, 1, 7) as 작업월 
	, t매.환율	
	, t실pk.판매오더번호
	, t실pk.지시번호
	, t실pk.원소재구입처
	, t품.입고일자
	, substring(t품.입고일자, 1, 7) as 입고월
	, t품.입고단가
	, t품.자재그룹 as 원소재그룹	
	, t매.gi후처리
	, t실pk."도금부착량(반)"
	, t매.수지
	, t매.수지기능
	, t매.엠보패턴 
	, t매.보호필름유무
/*	, (t품배.매출금액 / t품배.매출량 / 1000) ::numeric(10,0) as 판매단가
	, ((t품배.원재료비 + t품배.원가차이) / t품배.매출량 / 1000) ::numeric(10,0) as 원재료단가
	, (t품배.부재료비 / t품배.매출량  / 1000) ::numeric(10,0) as 부재료단가
	, ((t품배.동력비 + t품배.소모품비 + t품배."매출원가-선임" + t품배."매출원가-보험료") / t품배.매출량 / 1000) ::numeric(10,0) as "매원(변동)"
	, ((t품배.감가상각비 + t품배.수선비 + t품배.노무비 + t품배.외주비 + t품배.복리후생비 + t품배.기타제조) / t품배.매출량 / 1000) ::numeric(10,0) as "매원(고정)"
	, ((t품배.국내운반비 + t품배."수출개별비-선임" + t품배."수출개별비-운반비" + t품배."수출개별비-하역비" + t품배."수출개별비-기타") / t품배.매출량 / 1000) ::numeric(10,0) as"판관(변동)"
	, ((t품배.인건비 + t품배.복리후생비2 + t품배.광고선전비 + t품배.대손상각비 + t품배.여비교통비 + t품배.경상연구개발비 + t품배.기타판관비) / t품배.매출량 / 1000) ::numeric(10,0) as"판관(고정)"
	, (t품배.영업이익 / t품배.매출량 / 1000) ::numeric(10,0) as 톤당이익
	, (t품배.영업이익 / t품배.매출금액) ::numeric(10,2)as 영업이익률*/
	, coalesce(t생제pl301."가공비(톤당)" ::varchar, '') as "CPL가공비"
	, coalesce(t생제pl301.수율 ::varchar, '') as "CPL수율"
	, coalesce(t생제pl301."SPEED(톤당)" ::varchar, '') as "CPL속도"
	, coalesce(t생제pl301.작업일,'') as "CPL작업일"
	, coalesce(t생제rm301."가공비(톤당)" ::varchar, '') as "CRM가공비"
	, coalesce(t생제rm301.수율 ::varchar, '') as "CRM수율"
	, coalesce(t생제rm301."SPEED(톤당)" ::varchar, '') as "CRM속도"
	, coalesce(t생제rm301.작업일, '') as "CRM작업일"	
	, coalesce(t생제gl301."가공비(톤당)" ::varchar, '') as "CGL가공비"
	, coalesce(t생제gl301.수율 ::varchar, '') as "CGL수율"
	, coalesce(t생제gl301."SPEED(톤당)" ::varchar, '') as "CGL속도"
	, coalesce(t생제gl301.작업일, '') as "CGL작업일"
	, coalesce(t생제gl301."부재료비(톤당)" ::varchar, '') as "CGL부재료비"	
	, coalesce(t생제cl301."가공비(톤당)" ::varchar, '') as "1CCL가공비"
	, coalesce(t생제cl301.수율 ::varchar, '') as "1CCL수율"
	, coalesce(t생제cl301."SPEED(톤당)" ::varchar, '') as "1CCL속도"
	, coalesce(t생제cl301.작업일, '') as "1CCL작업일"
	, coalesce(t생제cl301."부재료비(톤당)" ::varchar, '') as "1CCL부재료비"		
	, coalesce(t생제cl302."가공비(톤당)" ::varchar, '') as "2CCL가공비"
	, coalesce(t생제cl302.수율 ::varchar, '') as "2CCL수율"
	, coalesce(t생제cl302."SPEED(톤당)" ::varchar, '') as "2CCL속도"
	, coalesce(t생제cl302.작업일, '') as "2CCL작업일"
	, coalesce(t생제cl302."부재료비(톤당)" ::varchar, '') as "2CCL부재료비"
/*	, coalesce(t생제sl301."가공비(톤당)" ::varchar, '') as SLIT가공비
	, coalesce(t생제sl301.수율 ::varchar, '') as SLIT수율
	, coalesce(t생제sl301."SPEED(톤당)" ::varchar, '') as SLIT속도
	, coalesce(t생제sl301.작업일, '') as SLIT작업일
	, coalesce(t생제sh301."가공비(톤당)" ::varchar, '') as SHEAR가공비
	, coalesce(t생제sh301.수율 ::varchar, '') as SHEAR수율
	, coalesce(t생제sh301."SPEED(톤당)" ::varchar, '')as SHEAR속도
	, coalesce(t생제sh301.작업일, '') as SHEAR작업일
	, coalesce(t생제sh302."가공비(톤당)" ::varchar, '') as MSHEAR가공비
	, coalesce(t생제sh302.수율 ::varchar, '') as MSHEAR수율
	, coalesce(t생제sh302."SPEED(톤당)" ::varchar, '') as MSHEAR속도
	, coalesce(t생제sh302.작업일, '') as MSHEAR작업일	*/
from t_품목별구분손익_배치번호 t품배
left join t_매출원장 t매
  on t품배.배치번호 = t매.배치번호
left join
	(
	select *
	from t_실적보고상세
	where 작업장 like 'PK%'
	) t실pk  
  on t품배.배치번호  = t실pk."Batch(완료)"
left join t_품목입고명세서 t품 
  on t실pk.원소재ID = t품.배치번호  
left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'PL301'
	) t생제pl301
	on t실pk.판매오더번호 = t생제pl301.수주
left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'RM301'
	) t생제rm301
	on t실pk.판매오더번호 = t생제rm301.수주
left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'GL301'
	) t생제gl301
	on t실pk.판매오더번호 = t생제gl301.수주
left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'CL301'
	) t생제cl301
	on t실pk.판매오더번호 = t생제cl301.수주
left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'CL302'
	) t생제cl302
	on t실pk.판매오더번호 = t생제cl302.수주
/*left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'SL301'
	) t생제sl301
	on t실pk.판매오더번호 = t생제sl301.수주
left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'SH301'
	) t생제sh301
	on t실pk.판매오더번호 = t생제sh301.수주
left join
	(
	select *, concat(판매오더, ' - ', 행번) 수주
	from t_생산오더별_제조원가 t생제
	where 품목계정 = 'HALB'
		and 작업장 = 'SH302'
	) t생제sh302
	on t실pk.판매오더번호 = t생제sh302.수주*/
where 년월 in ('202208', '202207')