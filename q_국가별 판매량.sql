select "�����ڵ� (��ǰó)", sum(���ⷮ)
from t_ǰ�񺰱��м���_������ tǰ��  
where �Ⱓ like '2020%'
	and ǰ����� = '����ǰ'
	and ����׷� = 'GI'
	and ������ like '%����%'
group by ("�����ڵ� (��ǰó)")