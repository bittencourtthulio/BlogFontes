unit Live.Model.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  FireDAC.Comp.Client;

type
  TDataConnection = class(TDataModule)
    FDConnection1: TFDConnection;
    QueryVenda: TFDQuery;
    QueryVendaItens: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    QueryVendaID: TFDAutoIncField;
    QueryVendaCOO: TIntegerField;
    QueryVendaSUBTOTAL: TBCDField;
    QueryVendaACRESCIMO: TBCDField;
    QueryVendaDESCONTO: TBCDField;
    QueryVendaTOTAL: TBCDField;
    QueryVendaItensID: TFDAutoIncField;
    QueryVendaItensVENDAID: TIntegerField;
    QueryVendaItensPRODUTO: TStringField;
    QueryVendaItensVALORUNITARIO: TBCDField;
    QueryVendaItensQUANTIDADE: TBCDField;
    QueryVendaItensSUBTOTAL: TBCDField;
    QueryVendaItensACRESCIMO: TBCDField;
    QueryVendaItensDESCONTO: TBCDField;
    QueryVendaItensTOTAL: TBCDField;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataConnection: TDataConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
