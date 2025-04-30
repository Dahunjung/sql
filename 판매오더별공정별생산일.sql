WITH filtered_batch AS (
    SELECT
        판매오더번호
        /*"Batch(완료)"*/ /*#삭제 가능*/
    FROM t_실적보고상세
    WHERE 작업장 LIKE 'PK%'
),
joined_cost AS (
    SELECT
        /*f."Batch(완료)",*/ /*#삭제 가능*/
    	f.판매오더번호,
        c.작업장,
        TO_CHAR(c.작업일::date, 'YYYY-MM-DD') AS 작업일
    FROM filtered_batch f
    LEFT JOIN t_생산오더별_제조원가 c
        ON f.판매오더번호 = c.판매오더 || ' - ' || c.행번
),
pivoted_dates AS (
    SELECT
        /*"Batch(완료)",*/ /*#삭제 가능*/
    	판매오더번호,
        MIN(CASE WHEN 작업장 = 'PL301' THEN 작업일 END) AS CPL_일자,
        MIN(CASE WHEN 작업장 = 'RM301' THEN 작업일 END) AS CRM_일자,
        MIN(CASE WHEN 작업장 = 'GL301' THEN 작업일 END) AS CGL_일자,
        MIN(CASE WHEN 작업장 = 'CL301' THEN 작업일 END) AS CCL1_일자,
        MIN(CASE WHEN 작업장 = 'CL302' THEN 작업일 END) AS CCL2_일자,
        MIN(CASE WHEN 작업장 = 'CL303' THEN 작업일 END) AS CCL3_일자
        -- 필요 작업장은 여기에 계속 추가하세요
    FROM joined_cost
    GROUP BY /*"Batch(완료)",*/판매오더번호
)
SELECT distinct
	pivoted_dates.*,
	s."주문 등록일"
FROM pivoted_dates
left join t_수주진행현황 s
	on pivoted_dates.판매오더번호 = s.수주번호 || ' - ' || s.순번
