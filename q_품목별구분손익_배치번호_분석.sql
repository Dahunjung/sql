select
	tǰ��.*
	, t��pk.�۾���
	, t��pk.����
	, substring(t��pk.����, 1, 7) as �۾��� 
	, t��.ȯ��	
	, t��pk.�Ǹſ�����ȣ
	, t��pk.���ù�ȣ
	, t��pk.�����籸��ó
	, tǰ.�԰�����
	, substring(tǰ.�԰�����, 1, 7) as �԰��
	, tǰ.�԰�ܰ�
	, tǰ.����׷� as ������׷�	
	, t��.gi��ó��
	, t��pk."���ݺ�����(��)"
	, t��.����
	, t��.�������
	, t��.�������� 
	, t��.��ȣ�ʸ�����
/*	, (tǰ��.����ݾ� / tǰ��.���ⷮ / 1000) ::numeric(10,0) as �ǸŴܰ�
	, ((tǰ��.������ + tǰ��.��������) / tǰ��.���ⷮ / 1000) ::numeric(10,0) as �����ܰ�
	, (tǰ��.������ / tǰ��.���ⷮ  / 1000) ::numeric(10,0) as �����ܰ�
	, ((tǰ��.���º� + tǰ��.�Ҹ�ǰ�� + tǰ��."�������-����" + tǰ��."�������-�����") / tǰ��.���ⷮ / 1000) ::numeric(10,0) as "�ſ�(����)"
	, ((tǰ��.�����󰢺� + tǰ��.������ + tǰ��.�빫�� + tǰ��.���ֺ� + tǰ��.�����Ļ��� + tǰ��.��Ÿ����) / tǰ��.���ⷮ / 1000) ::numeric(10,0) as "�ſ�(����)"
	, ((tǰ��.������ݺ� + tǰ��."���ⰳ����-����" + tǰ��."���ⰳ����-��ݺ�" + tǰ��."���ⰳ����-�Ͽ���" + tǰ��."���ⰳ����-��Ÿ") / tǰ��.���ⷮ / 1000) ::numeric(10,0) as"�ǰ�(����)"
	, ((tǰ��.�ΰǺ� + tǰ��.�����Ļ���2 + tǰ��.�������� + tǰ��.��ջ󰢺� + tǰ��.������� + tǰ��.��󿬱����ߺ� + tǰ��.��Ÿ�ǰ���) / tǰ��.���ⷮ / 1000) ::numeric(10,0) as"�ǰ�(����)"
	, (tǰ��.�������� / tǰ��.���ⷮ / 1000) ::numeric(10,0) as �������
	, (tǰ��.�������� / tǰ��.����ݾ�) ::numeric(10,2)as �������ͷ�*/
	, coalesce(t����pl301."������(���)" ::varchar, '') as "CPL������"
	, coalesce(t����pl301.���� ::varchar, '') as "CPL����"
	, coalesce(t����pl301."SPEED(���)" ::varchar, '') as "CPL�ӵ�"
	, coalesce(t����pl301.�۾���,'') as "CPL�۾���"
	, coalesce(t����rm301."������(���)" ::varchar, '') as "CRM������"
	, coalesce(t����rm301.���� ::varchar, '') as "CRM����"
	, coalesce(t����rm301."SPEED(���)" ::varchar, '') as "CRM�ӵ�"
	, coalesce(t����rm301.�۾���, '') as "CRM�۾���"	
	, coalesce(t����gl301."������(���)" ::varchar, '') as "CGL������"
	, coalesce(t����gl301.���� ::varchar, '') as "CGL����"
	, coalesce(t����gl301."SPEED(���)" ::varchar, '') as "CGL�ӵ�"
	, coalesce(t����gl301.�۾���, '') as "CGL�۾���"
	, coalesce(t����gl301."������(���)" ::varchar, '') as "CGL������"	
	, coalesce(t����cl301."������(���)" ::varchar, '') as "1CCL������"
	, coalesce(t����cl301.���� ::varchar, '') as "1CCL����"
	, coalesce(t����cl301."SPEED(���)" ::varchar, '') as "1CCL�ӵ�"
	, coalesce(t����cl301.�۾���, '') as "1CCL�۾���"
	, coalesce(t����cl301."������(���)" ::varchar, '') as "1CCL������"		
	, coalesce(t����cl302."������(���)" ::varchar, '') as "2CCL������"
	, coalesce(t����cl302.���� ::varchar, '') as "2CCL����"
	, coalesce(t����cl302."SPEED(���)" ::varchar, '') as "2CCL�ӵ�"
	, coalesce(t����cl302.�۾���, '') as "2CCL�۾���"
	, coalesce(t����cl302."������(���)" ::varchar, '') as "2CCL������"
/*	, coalesce(t����sl301."������(���)" ::varchar, '') as SLIT������
	, coalesce(t����sl301.���� ::varchar, '') as SLIT����
	, coalesce(t����sl301."SPEED(���)" ::varchar, '') as SLIT�ӵ�
	, coalesce(t����sl301.�۾���, '') as SLIT�۾���
	, coalesce(t����sh301."������(���)" ::varchar, '') as SHEAR������
	, coalesce(t����sh301.���� ::varchar, '') as SHEAR����
	, coalesce(t����sh301."SPEED(���)" ::varchar, '')as SHEAR�ӵ�
	, coalesce(t����sh301.�۾���, '') as SHEAR�۾���
	, coalesce(t����sh302."������(���)" ::varchar, '') as MSHEAR������
	, coalesce(t����sh302.���� ::varchar, '') as MSHEAR����
	, coalesce(t����sh302."SPEED(���)" ::varchar, '') as MSHEAR�ӵ�
	, coalesce(t����sh302.�۾���, '') as MSHEAR�۾���	*/
from t_ǰ�񺰱��м���_��ġ��ȣ tǰ��
left join t_������� t��
  on tǰ��.��ġ��ȣ = t��.��ġ��ȣ
left join
	(
	select *
	from t_���������
	where �۾��� like 'PK%'
	) t��pk  
  on tǰ��.��ġ��ȣ  = t��pk."Batch(�Ϸ�)"
left join t_ǰ���԰���� tǰ 
  on t��pk.������ID = tǰ.��ġ��ȣ  
left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'PL301'
	) t����pl301
	on t��pk.�Ǹſ�����ȣ = t����pl301.����
left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'RM301'
	) t����rm301
	on t��pk.�Ǹſ�����ȣ = t����rm301.����
left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'GL301'
	) t����gl301
	on t��pk.�Ǹſ�����ȣ = t����gl301.����
left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'CL301'
	) t����cl301
	on t��pk.�Ǹſ�����ȣ = t����cl301.����
left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'CL302'
	) t����cl302
	on t��pk.�Ǹſ�����ȣ = t����cl302.����
/*left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'SL301'
	) t����sl301
	on t��pk.�Ǹſ�����ȣ = t����sl301.����
left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'SH301'
	) t����sh301
	on t��pk.�Ǹſ�����ȣ = t����sh301.����
left join
	(
	select *, concat(�Ǹſ���, ' - ', ���) ����
	from t_���������_�������� t����
	where ǰ����� = 'HALB'
		and �۾��� = 'SH302'
	) t����sh302
	on t��pk.�Ǹſ�����ȣ = t����sh302.����*/
where ��� in ('202208', '202207')