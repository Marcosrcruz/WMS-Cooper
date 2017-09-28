
 CREATE TABLE "MOVIMENTACAO" (
	"ID" integer PRIMARY KEY, 
	"ID_TIPO_MOVIMENTACAO" integer not null, 
	"OPERACAO" integer not null, 
	"ID_PRODUTO" integer not null, 
	"ID_STATUS_MOVIMENTO" integer not null, 
	"ID_DEPOSITO" integer not null, 
	"ID_REQUISICAO" integer not null, 
	"DATA_MOVIMENTO" timestamp not null, 
   	"QUANTIDADE" float not null,
   	"SITUACAO" integer not null,
constraint FK_MOVIMENTACAO_TIPO_MOVI foreign key (ID_TIPO_MOVIMENTACAO) 
           references "TIPO_MOVIMENTACAO" (ID),
constraint FK_MOVIMENTACAO_ID_PRODUTO foreign key (ID_PRODUTO)
           references "PRODUTO" (ID),
constraint FK_MOVIMENTACAO_ID_STATUS foreign key (ID_STATUS_MOVIMENTO)
           references "STATUS" (ID),
constraint FK_MOVIMENTACAO_DEPOSITO foreign key (ID_DEPOSITO)
           references "DEPOSITO"(ID),
constraint FK_MOVIMENTACAO_REQUISICAO foreign key (ID_REQUISICAO)
           references "REQUISICAO_ESTOQUE"(ID)
         
	
)

CREATE SEQUENCE "GEN_MOVIMENTACAO_ID"