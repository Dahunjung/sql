select ���, sum(���ⷮ) as ���ⷮ, sum(����ݾ�) as ����ݾ�, sum(��������) as ��������, t��pk.�۾���
from t_ǰ�񺰱��м���_��ġ��ȣ tǰ�� 
left join
		(
	select *
	from t_���������
	where �۾��� like 'PK%'
	) t��pk
	on tǰ��.��ġ��ȣ = t��pk."Batch(�Ϸ�)" 
where ǰ����� = 'FERT'
group by ���, t��pk.�۾���
order by ��� desc 