unit frm_repositorio;

interface

uses
  SysUtils, Classes, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ImgList, Controls, System.ImageList,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList ;

type
  Tfrmrepositorio = class(TDataModule)
    IconosTodos48: TcxImageList;
    IconosTodos32: TcxImageList;
    IconosTodos24: TcxImageList;
    IconosTodos16: TcxImageList;
    IconosBarra: TcxImageList;
    IconosNav: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepositorio: Tfrmrepositorio;

implementation

{$R *.dfm}

End.
