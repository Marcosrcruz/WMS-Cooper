unit UGrupoProduto;

interface

Uses
  UEntidade
  ,UFamiliaProduto
;

type
  TGrupoProduto = class(TEntidade)
    public
      NOMEGRUPO       : string;
      FAMILIA_PRODUTO : TFamiliaProduto;

      constructor Create; override;
      destructor Destroy; override;
    end;

 const
  TBL_GRUPOPRODUTO                    = 'GRUPO_PRODUTO';
  FLD_GRUPOPRODUTO_NOMEGRUPO          = 'NOMEGRUPO';
  FLD_GRUPOPRODUTO_ID_FAMILIA_PRODUTO = 'ID_FAMILIAPRODUTO';

  VW_GRUPOPRODUTO       = 'VW_GRUPO_PRODUTO';
  VW_GRUPOPRODUTO_ID    = 'COD';
  VW_GRUPOPRODUTON_NOME = 'NOME';

resourcestring

  STR_GRUPOPRODUTO   = 'Grupo de Produto';

implementation

uses
    SysUtils
  , Dialogs
  ;

{ TGrupoProduto }

constructor TGrupoProduto.Create;
begin
  inherited;
  FAMILIA_PRODUTO := TFamiliaProduto.Create;
end;

destructor TGrupoProduto.Destroy;
begin
  FreeAndNil(FAMILIA_PRODUTO);
  inherited;
end;

end.
