unit ULote;


interface

uses
   UEntidade
  ,UEmpresaMatriz
  ;
type TLOTE = class (TENTIDADE)
  public
    LOTE       : string;
    VALIDADE   : TDateTime;
    EMPRESA    : TEmpresa;

  constructor Create; override;
  destructor  Destroy; override;

end;

  const
    TBL_LOTE            =   'LOTE';
    FLD_LOTE_CODIGO     =   'CODIGO DO LOTE';
    FLD_LOTE_VALIDADE   =   'VALIDADE DO LOTE';
    FLD_LOTE_EMPRESA    =   'EMPRESA DO LOTE';

    VW_LOTE             =   'VW_LOTE';
    VW_LOTE_ID          =   'CODIGO';
    VW_LOTE_DESCRICAO   =   'CODIGO DO LOTE';
    VW_LOTE_EMPRESA     =   'EMPRESA';



  resourcestring
    STR_LOTE            =   'LOTE';


implementation

Uses
   sysUtils
   ,Dialogs
   ;
{ TLOTE }

constructor TLOTE.Create;
begin
  inherited;
    EMPRESA := TEmpresa.Create;
    end;

destructor TLOTE.Destroy;
begin
    FreeAndNil(EMPRESA);
  inherited;
end;

end.
