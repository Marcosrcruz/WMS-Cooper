unit UUSuario;

interface

uses
    UEntidade
   ,UPessoa
   ;
type
   TUsuario = class(TENTIDADE)
  public
    USUARIO : String;
    SENHA   : integer;
    PESSOA  : TPESSOA;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_Usuario            = 'USUARIO';
    FLD_Usuario_NOME       = 'NOME';
    FLD_Usuario_ID_Pessoa = 'ID_PESSOA';

    VW_CIDADE          = 'VW_CIDADE';
    VW_CIDADE_NOME     = 'Nome';
    VW_CIDADE_ID       = 'Cód.';
  resourcestring
    STR_USUARIO       = 'USUARIO';



implementation

 uses
  SysUtils
  , Dialogs
  ;
{ TSuario }

constructor TUSuario.Create;
begin
  inherited;
    PESSOA := TPESSOA.Create;
end;

destructor TUSuario.Destroy;
begin
   PESSOA  := TPESSOA.Create;
  inherited;
end;

end.
