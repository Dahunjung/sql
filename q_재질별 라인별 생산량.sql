select "����(����)", SUM(���귮) as ���귮
from t_���������_�������� t���� 
where �Ⱓ like '2018%'
	and �۾��� = 'CL302'
group by "����(����)"