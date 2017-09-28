CREATE VIEW "VW_REQUISICAO_ESTOQUE" (CODIGO, "TIPO DE MOVIMENTACAO", STATUS, EMPRESA, PRODUTO, "DEPOSITO ORIGEM",  "DEPOSITO DESTINO", USUARIO, LOTE) AS
select a.id as "Codigo"
      ,b.tipo_movimentacao as "TIPO DE MOVIMENTACAO"
      ,c.nome_status as "STATUS"
      ,d.nome as "EMPRESA"
      ,e.descricao as "PRODUTO"
      ,f.descricao as "DEPOSITO ORIGEM"
      ,g.descricao as "DEPOSITO DESTINO"
      ,h.nome as "USUARIO"
      ,i.lote as "LOTE"
from REQUISICAO_ESTOQUE a
     inner join tipo_movimentacao b on b.id = a.id_tipo_movimentacao
     inner join status c on c.id = a.id_status
     inner join empresa d on d.id = a.id_empresa
     inner join produto e on e.id = a.id_produto
     inner join deposito f on f.id = a.id_deposito_origem
     inner join deposito g on g.id = a.id_deposito_destino
     inner join usuario h on h.id = a.id_usuario
     inner join lote i on i.id = a.id_lote
GO