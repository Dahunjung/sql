select �μ�, �۾���, "����(����)", ������, SUM(���귮) as ���귮
from t_���������_�������� t���� 
where ǰ����� = 'HALB'
	and �Ⱓ like '2021%'
	and �۾��� = 'GL301'
	and "����(������ǰ)" in ('RMP', 'PVDF', 'PRINT', 'LAMI', 'HPP', 'EMBO', 'AL', 'STS')
group by �μ�, �۾���, "����(����)", ������