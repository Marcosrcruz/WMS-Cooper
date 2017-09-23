create table papel (
	id integer not null,
	descricao varchar(60) not null,
	
	constraint pk_papel primary key (id)
);

create table permissao (
	id integer not null,
	descricao varchar(60) not null,
	
	constraint pk_permissao primary key (id)
);

create table papel_permissao (
	id_papel integer not null,
	id_permissao integer not null,
	
	constraint pk_papel_permissao primary key (id_papel, id_permissao),
	constraint fk_papel_permissao_papel foreign key (id_papel) references papel(id),
	constraint fk_papel_permissao_permissao foreign key (id_permissao) references permissao(id)
);

create table usuario (
	id integer 				not null,
    nome varchar(60)		not null,
	login varchar(60) 		not null,
	senha varchar(60)       not null,
	id_papel integer 		not null,

	constraint pk_usuario primary key (id),
	constraint uk_usuario_login unique (login),
	constraint fk_usuario_papel foreign key (id_papel) references papel(id)
);