select substring(�Ⱓ,1,4) as ��, �μ��ڵ�, sum(���ⷮ) as ���ⷮ, sum(������ݺ�) as ������ݺ�, sum("���ⰳ����-��ݺ�") as �����ݺ�
from t_ǰ�񺰱��м���_������ tǰ�� 
where ǰ����� = '����ǰ'
	and �ֹ����� = 'T'
group by ��, �μ��ڵ�
order by �� asc, �μ��ڵ� asc