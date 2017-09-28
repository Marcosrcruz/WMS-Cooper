create table movimentacao (
	id integer not null,
	id_tipo_movimentacao integer not null,
	id_tipo_operacao integer not null, 
	id_produto integer not null,
	id_status_movimento integer not null,
	id_deposito integer not null,
	id_requisicao integer not null,
	data_movimento timestamp not null,
	quantidade float,
	
	constraint pk_movimentacao primary key (id)
	--constraint fk_tipo_movimentacao foreign key (id_tipo_movimentacao) references tipo_movimentacao(id),
	
);

SELECT a.RDB$CHARACTER_SET_NAME FROM RDB$DATABASE a;

select * from produto;
select * from empresa;

select * from status;
insert into status values (1, 'em digitação');
insert into status values (2, 'confirmada');
insert into status values (3, 'cancelada');

delete from tipo_movimentacao;
insert into tipo_movimentacao values (1, 'compra');
insert into tipo_movimentacao values (2, 'tranferência');

select * from deposito;
select * from usuario;

select * from lote

create lote (
	id
	lote
	valida
	produto -- fk para produto
	fornecedor --fk para empresa
)

select * from requisicao_estoque;
delete from requisicao_estoque where id = 1;
insert into requisicao_estoque values (1, 1, '09/10/2017', '09/11/2017', null, 2, 1, 12345, 1, 1000, 1.39, 0, 4, null, 10, 8, '09/12/2017');
insert into requisicao_estoque values (2, 2, '15/10/2017', '09/11/2017', null, 2, 1, 12345, 1, 1000, 1.39, 0, 4, 1, 'SKOL-A', '', 8, '09/12/2017');


select * from movimentacao;
insert into values (1, )


	

--tipo de movimento
--compra
--venda
--transferencia
--residuo

--operacao
--entrada
--saida

--status da requisicao
--confirmada
--cancelada

--status do movimento
--valido
--estorno
--estornado