select �Ⱓ, SUM(���ⷮ) as ���ⷮ, SUM(�����) as �����
from t_ǰ�񺰱��м���_������ tǰ�� 
left join �ŷ�ó���_������ t�ŷ�
	on t�ŷ�."�ŷ�ó ��" = tǰ��.�Ǹ�ó
where t�ŷ�.�ּ� like '%����%'
	and tǰ��.�Ⱓ like '2021%'
group by �Ⱓ