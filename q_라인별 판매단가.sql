select t��pk.�۾���, sum(tǰ��.���ⷮ) as ���ⷮ, sum(tǰ��.����ݾ�) as ����ݾ�
from t_ǰ�񺰱��м���_��ġ��ȣ tǰ�� 
left join
	(
	select *
	from t_���������
	where �۾��� like 'PK%'
	) t��pk  
  on tǰ��.��ġ��ȣ  = t��pk."Batch(�Ϸ�)"
where tǰ�� .��� like '2022%'
	and tǰ�� .�������� = 'T'
	and tǰ�� .ǰ����� = 'FERT'
group by t��pk.�۾���