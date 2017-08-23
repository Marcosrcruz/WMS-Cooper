unit UFrmCadastroEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UEstado
  , UUtilitarios
  , URegraCRUDPais
  , URegraCRUDEstado
  ;

type
  TFrmCadastroEstado = class(TFrmCRUD)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroEstado: TFrmCadastroEstado;

implementation

{$R *.dfm}

end.
