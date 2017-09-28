create table LOTE (
                 ID integer not null,
                 LOTE varchar(20) not null,
                 VALIDADE timestamp not null,
                 ID_EMPRESA integer not null,
       constraint PK_LOTE primary key (ID),
       constraint FK_LOTE_ID_EMPRESA foreign key (ID_EMPRESA) references EMPRESA(ID)

)
CREATE VIEW "VW_LOTE" (CODIGO, LOTE, EMPRESA) AS
  select a.id as "COD"
        ,a.lote as "LOTE"
        ,c.id_empresa as "empresa"
from LOTE a
     inner join empresa c on c.id = a.id_empresa




