select �Ⱓ, sum(���ⷮ) as ���ⷮ, sum(�����) as �����, sum(��������) as ��������
from t_ǰ�񺰱��м���_������ tǰ�� 
group by rollup(�Ⱓ)
order by �Ⱓ