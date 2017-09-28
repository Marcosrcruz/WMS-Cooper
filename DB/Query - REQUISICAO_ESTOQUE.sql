CREATE TABLE "REQUISICAO_ESTOQUE" (
	"ID" integer PRIMARY KEY , 
	"ID_TIPO_MOVIMENTACAO" integer not null, 
	"DATA_EMISSAO" timestamp not null, 
	"DATA_ENTRADA" timestamp not null, 
	"DATA_CANCELAMENTO" date not null, 
	"ID_STATUS" integer not null, 
	"ID_EMPRESA" integer not null, 
	"NUMERO_DOCUMENTO" integer not null, 
	"ID_PRODUTO" integer not null, 
	"QUANTIDADE" float not null, 
	"CUSTO_UNITARIO" float not null, 
	"VALOR_TOTAL" float not null, 
	"ID_DEPOSITO_ORIGEM" integer not null, 
	"ID_DEPOSITO_DESTINO" integer not null, 
	"ID_LOTE" integer not null, 
	"ID_USUARIO" integer not null, 
	"DATA_INCLUSAO" timestamp not null, 
	FOREIGN KEY ("ID_EMPRESA")
		REFERENCES "EMPRESA" ("ID"), 
	FOREIGN KEY ("ID_DEPOSITO_DESTINO")
		REFERENCES "DEPOSITO" ("ID"), 
	FOREIGN KEY ("ID_PRODUTO")
		REFERENCES "PRODUTO" ("ID"), 
	FOREIGN KEY ("ID_USUARIO")
		REFERENCES "USUARIO" ("ID"), 
	FOREIGN KEY ("ID_DEPOSITO_ORIGEM")
		REFERENCES "DEPOSITO" ("ID"), 
	FOREIGN KEY ("ID_STATUS")
		REFERENCES "STATUS" ("ID"), 
	FOREIGN KEY ("ID_TIPO_MOVIMENTACAO")
		REFERENCES "TIPO_MOVIMENTACAO" ("ID"),
    FOREIGN KEY ("ID_LOTE")
        REFERENCES "LOTE" ("ID")
);
