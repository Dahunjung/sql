select substring(t��.��������,1,4) as �����, SUM(t��.�����߷�) as ���ⷮ, t��."TOP Į��", ����."1Layer�ڵ� 2CCL" , ����."2Layer�ڵ�" , ����."1-2" , ����."2" , ����.fd , ����.nv 
from t_������� t�� 
left join ���󸶽��� ����
  on t��."TOP Į��" = ����.�ڵ��ȣ
--#��Ȳ�� �´� ���� �Է�
--where t��.ȸ����� = 'AL'
where t��.���� like '%SQP%'
	and t��.������� = '�Ϲ�'
group by �����, t��."TOP Į��" , t��."TOP Į��", ����."1Layer�ڵ� 2CCL" , ����."2Layer�ڵ�" , ����."1-2" , ����."2" , ����.fd , ����.nv
order by ����� asc, ���ⷮ desc  