insert into papel values (0, 'Encarregado');
insert into papel values (1, 'Gestor');
insert into papel values (2, 'Administrador');

insert into permissao values (1, 'Cadastrar Produtos');
insert into permissao values (2, 'Visualizar Relatórios');

insert into papel_permissao values (0, 1);
insert into papel_permissao values (1, 2);
insert into papel_permissao values (2, 1);
insert into papel_permissao values (2, 2);

insert into usuario values (1, 'Administrador', 'admin', '21232F297A57A5A743894A0E4A801FC3', 2);

