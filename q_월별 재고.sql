select ǰ�����, ��������, �Ⱓ, ����, SUM("�⸻ �߷�") as �⸻�߷�, SUM("�⸻ �ݾ�") as �⸻�ݾ�
from t_���Һ� t�� 
where ǰ����� IN ('FERT', 'HALB', 'ROH')
	and �������� = 'T'
group by ǰ�����, ��������, �Ⱓ, ����