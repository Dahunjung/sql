select substring(�Ⱓ,1,4) as ��, �ε�����, sum(���ⷮ) as ���ⷮ, sum("�������-����") as ����
from t_ǰ�񺰱��м���_������ tǰ�� 
where ������ like '%����%'	
	and "����(�ߺз�)" not like '%����%'
group by ��, �ε�����