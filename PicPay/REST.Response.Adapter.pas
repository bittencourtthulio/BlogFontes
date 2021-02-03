{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit REST.Response.Adapter;

interface

{$SCOPEDENUMS ON}

uses
  System.JSON, System.Rtti, System.Classes, System.DateUtils,
  Data.DB,
  Data.Bind.Components,
  REST.Client,
  System.Generics.Collections,
  REST.Types;

type

  TOnBeforeOpenDataSetEvent = procedure(Sender: TObject) of object;

  TJSONParserObjectCallback = procedure(const AJSONObject: TJSONObject) of object;

  /// <summary>
  /// Updates a dataset with the content of a TJSONValue.  Can dynamically generate field definitions or
  /// use user-specified field definitions.
  /// </summary>
  TCustomJSONDataSetAdapter = class abstract(TComponent)
  private type
    TAdaptJSONFieldType = (JSONObject, JSONArray, JSONValue);

    TAdaptJSONField = record
    public
      Path: string;
      FieldName: string;
      FieldType: TAdaptJSONFieldType;
      constructor Create(const AName, APath: string; AFieldType: TAdaptJSONFieldType);
    end;

  strict private
    FDataSet: TDataSet;
    FFieldDefsDS: TDataSet;
    FFieldDefs: TFieldDefs;
    FInternalFieldDefsDS: TDataSet;
    FInternalFieldDefs: TFieldDefs;
    FInternalFieldPaths: TDictionary<string, string>;
    FStringFieldSize: Integer;

    procedure SetFieldDefs(AValue: TFieldDefs);
    procedure SetDataSet(const AValue: TDataSet);
    procedure ScanJSONForFields(const AJSON: TJSONValue);
    procedure TransferJSONData(const AJSON: TJSONValue);
    procedure AddJSONFieldNames(const AParent: TJSONValue; const APath: string;
      const AList: TList<TAdaptJSONField>; ADepth: Integer); overload;
    procedure AddJSONFieldNames(const AParent: TJSONValue;
      const AList: TList<TAdaptJSONField>; ADepth: Integer); overload;
    procedure AddJSONDataRow(const AJSONValue: TJSONValue);
    procedure AddJSONDataRows(const AJSON: TJSONValue);
  protected
    procedure DoBeforeOpenDataSet; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;


    function GetFieldDefsClass: TFieldDefsClass; virtual;

    function GetDefaultFieldName(const AJSON: TJSONValue): string; virtual;
    function GetScanDepth: Integer; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary>
    /// Clears all field definitions.
    /// </summary>
    procedure ResetToDefaults;
    /// <summary>
    /// Activates and loads the attached dataset.  First, the field definitions are determined.
    /// If the FieldDefs list is empty, then the JSON value will
    /// be scanned for field definitions.  Otherwise, the definitions in the FieldDefs list
    /// will be used.  Next, the field definitions are assigned to the dataset so that the dataset can create fields.
    /// Finally, the dataset is loaded from the elements in the JSON value.
    /// </summary>
    procedure UpdateDataSet(const AJSON: TJSONValue);

    /// <summary>
    /// Closes the dataset and clears field definitions from the dataset.
    /// </summary>
    procedure ClearDataSet;

    /// <summary>
    /// Dataset that will be filled with values from a JSON value.
    /// </summary>
    property Dataset: TDataSet read FDataSet write SetDataSet;
    /// <summary>
    /// Optional list of field definitions.  Add to this list to explicitly define the names and types of fields
    /// to add to the dataset.  The Name property of each field definition should correspond to a member of the JSON value.
    /// Adding a field definition is one way to customize the dataset.  Another way is to
    /// add fields to the dataset.  When adding fields to the dataset, the FieldName property of each field should correspond to a member of the JSON value.
    /// </summary>
    property FieldDefs: TFieldDefs read FFieldDefs write SetFieldDefs;
    property StringFieldSize: Integer read FStringFieldSize write FStringFieldSize;
  end;


  /// <summary>
  /// Updates a dataset with the JSONValue from a REST response.
  /// </summary>
  TCustomRESTResponseDataSetAdapter = class(TComponent)
  private type
    /// <summary>
    /// Declare adapter responsible for writing the JSONValue to the dataset
    /// </summary>
    TAdapter = class(TCustomJSONDataSetAdapter)
    private
      FOwner: TCustomRESTResponseDataSetAdapter;
    protected
      procedure DoBeforeOpenDataSet; override;
      function GetDefaultFieldName(const AJSON: TJSONValue): string; override;
      function GetScanDepth: Integer; override;
    end;

    TNotify = class(TCustomRESTResponse.TNotify)
    private
      FOwner: TCustomRESTResponseDataSetAdapter;
      constructor Create(const AOwner: TCustomRESTResponseDataSetAdapter);
    public
      procedure JSONValueChanged(ASender: TObject); override;
    end;

  public type

    TJSONValueError = (NoContent, NoJSON, NoResponseComponent, InvalidRootElement);
    TJSONValueErrorEvent = procedure(Sender: TObject; AUpdateError: TJSONValueError; const AMessage: string) of object;
    EJSONValueError = class(ERESTException)
    private
      FError: TJSONValueError;
    public
      constructor Create(AError: TJSONValueError; const AMessage: string);
      property Error: TJSONValueError read FError;
    end;

  strict private
    FOnBeforeOpenDataSet: TOnBeforeOpenDataSetEvent;
    FAdapter: TAdapter;
    FResponse: TCustomRESTResponse;
    FAutoUpdate: boolean;
    FNotify: TNotify;
    FResponseJSONIntf: IRESTResponseJSON;
    FNestedElementsDepth: Integer;
    FNestedElements: Boolean;
    FDeferActivate: Boolean;
    procedure SetResponse(const AValue: TCustomRESTResponse);
    function GetDataSet: TDataSet;
    function GetFieldDefs: TFieldDefs;
    procedure SetDataSet(const Value: TDataSet);
    procedure SetFieldDefs(const Value: TFieldDefs);
    procedure SetActive(const Value: boolean);
    function GetActive: boolean;
    procedure SetAutoUpdate(const Value: boolean);
    procedure SetResponseJSONIntf(const Value: IRESTResponseJSON);
    procedure ResponseJSONChanged(Sender: TObject);
    procedure SetNestedElementsDepth(const Value: Integer);
    procedure InvalidateJSONValue;
    procedure DoJSONValueChanged;
  private
    FRootElement: string;
    FJSONValue: TJSONValue;
    FOnUpdateError: TJSONValueErrorEvent;
    procedure SetNestedElements(const Value: Boolean);
    function CreateJSONValue: TJSONValue;
    function GetJSONValue: TJSONValue;
    function GetResponseComponent: IRESTResponseJSON;
    function GetRootFieldName: string;
    function GetStringFieldSize: Integer;
    procedure SetStringFieldSize(const Value: Integer);
  protected
    procedure DoBeforeOpenDataSet; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetRootElement(const AValue: string);
    procedure Loaded; override;
    procedure DoUpdateError(AError: TJSONValueError; const AMessage: string); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetDefaultFieldName(const AJSON: TJSONValue): string; deprecated;
    /// <summary>
    /// Set Active True to fill the dataset.  Set Active False to close the dataset.
    /// </summary>
    property Active: boolean read GetActive write SetActive default False;
    /// <summary>
    /// Set to AutoUpdate True to automatically update the dataset when the JSON changes. For example,
    /// if the Response property is set, then the dataset will be updated when the corresponding
    /// request is executed.
    /// </summary>
    property AutoUpdate: boolean read FAutoUpdate write SetAutoUpdate default True;
    // <summary>Associate the adapter with a REST response.  When the corresponding request is execute, the dataset may be automatically filled.
    property Response: TCustomRESTResponse read FResponse write SetResponse;
    // <summary>Associate the adapter with an object that has a JSON value.  When the JSON of the object is updated, the dataset may be automatically filled.
    property ResponseJSON: IRESTResponseJSON read FResponseJSONIntf write SetResponseJSONIntf;
    /// <summary>
    /// Clears all field definitions.
    /// </summary>
    procedure ResetToDefaults;
    /// <summary>
    /// Activates and loads the attached dataset.  First, the field definitions are determined.
    /// If the FieldDefs list is empty, then the JSON value will
    /// be scanned for field definitions.  Otherwise, the definitions in the FieldDefs list
    /// will be used.  Next, the field definitions are assigned to the dataset so that the dataset can create fields.
    /// Finally, the dataset is loaded from the elements in the JSON value.
    /// </summary>
    procedure UpdateDataSet(AJSONValue: TJSONValue = nil);
    /// <summary>
    /// Clears an attached dataset.
    /// </summary>
    procedure ClearDataSet;
    property Dataset: TDataSet read GetDataSet write SetDataSet;
    /// <summary>
    /// Optional list of field definitions.  Add to this list to explicitly define the names and types of fields
    /// to add to the dataset.  The Name property of each field definition should correspond to a member of the JSON value.
    /// Adding a field definition is one way to customize the dataset.  Another way is to
    /// add fields to the dataset.  When adding fields to the dataset, the FieldName property of each field should correspond to a member of the JSON value.
    /// </summary>
    property FieldDefs: TFieldDefs read GetFieldDefs write SetFieldDefs;
    /// <summary>
    /// Optional path into the JSON value.  The path identifies a starting point for loading the dataset.
    /// This RootElement is applied after an optionally set RootElement of the corresponding TRESTResponse was applied.
    /// A Response object may also have a RootElement.  In this case, the RootElement of the response object is applied before
    /// the RootElement of the adapter.
    /// Sample RootElement paths: "foo", "foo.bar", "[0].foo", "foo.bar[0]".
    /// </summary>
    property RootElement: string read FRootElement write SetRootElement;

    property OnBeforeOpenDataSet: TOnBeforeOpenDataSetEvent read FOnBeforeOpenDataSet write FOnBeforeOpenDataSet;
    /// <summary>
    /// When NestedElements is true, JSON child elements will be used to define fields.
    /// </summary>
    property NestedElements: Boolean read FNestedElements write SetNestedElements default False;
    /// <summary>
    /// NestedElementsDepth is used when NestedElements = true.  NestedElementsDepth indicate how
    /// deep to scan JSON child elements for fields.  The value 0 indicates a deep scan.
    /// </summary>
    property NestedElementsDepth: Integer read FNestedElementsDepth write SetNestedElementsDepth default 0;
    property StringFieldSize: Integer read GetStringFieldSize write SetStringFieldSize default 255;
    property OnUpdateError: TJSONValueErrorEvent read FOnUpdateError write FOnUpdateError;

  end;

  TRESTResponseDataSetAdapter = class(TCustomRESTResponseDataSetAdapter)
  published
    property Active;
    property AutoUpdate;
    property Dataset;
    property FieldDefs;
                      
    property Response;
    property ResponseJSON;
    property RootElement;
    property NestedElementsDepth;
    property NestedElements;
    property StringFieldSize;
    property OnBeforeOpenDataSet;
    property OnUpdateError;
  end;

  /// <summary>JSON value holder. Allows TRESTResponseDataSetAdapter to consume a JSON value
  /// created by a means other than TRESTResponse.
  /// To use, assign an instance of this class to TRESTREsponseDataSetAdapter.ResponseJSON.
  /// </summary>
  TRESTResponseJSON =  class(TComponent, IRESTResponseJSON)
  private
    FValue: TJSONValue;
    FJSONNotifyList: TList<TNotifyEvent>;
    FOwnsValue: Boolean;
  protected
    /// <summary>Indicate that the JSON value has changed.  Subscribers will be notified.</summary>
    procedure ValueChanged(Sender: TObject);
    { IRESTResponseJSON }
    /// <summary>Add a change event for subscribing to a change to the JSON value</summary>
    procedure AddJSONChangedEvent(const ANotify: TNotifyEvent);
    /// <summary>Remove a change event</summary>
    procedure RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
    /// <summary>Get the current JSON value</summary>
    procedure GetJSONResponse(out AValue: TJSONValue; out AHasOwner: Boolean);
    /// <summary>Indicate if there is a JSON value</summary>
    function HasJSONResponse: Boolean;
    /// <summary>Indicate if there is some content.  In this class, the content is always JSON</summary>
    function HasResponseContent: Boolean;
  public
    /// <summary>Create the class with no JSON</summary>
    constructor Create(AOwner: TComponent); overload; override;
    /// <summary>Create the class with JSON.  If AOwnsValue is true then the JSON will be freed automatically.</summary>
    constructor Create(AOwner: TComponent; const AValue: TJSONValue; AOwnsValue: Boolean); reintroduce; overload;
    destructor Destroy; override;
    /// <summary>Set the JSON value.  Subscribers will be notified.  If AOwnsValue is true then the JSON will be freed automatically.</summary>
    procedure SetJSONValue(const AValue: TJSONValue; AOwnsValue: Boolean);
  end;

implementation

uses
  System.SysUtils, System.StrUtils, System.Types,
  REST.Utils, System.Math, REST.Consts,
  System.Variants;

type

  /// <summary>
  /// we need a TDataSet-Class to maintain the FieldDefs (they're requiring a
  /// "living" dataset. we cannot just use TDataSet as it contains abstract
  /// methods. so we need a minimal implementation without abstract methods.
  /// USED ONLY INTERNALLY
  /// </summary>
  TRESTAdapterDataSet = class(TDataSet)
  protected
    procedure InternalClose; override;
    procedure InternalHandleException; override;
    procedure InternalInitFieldDefs; override;
    procedure InternalOpen; override;
    function IsCursorOpen: boolean; override;
{$IFDEF NEXTGEN}
    function GetRecord(Buffer: TRecBuf; GetMode: TGetMode; DoCheck: boolean): TGetResult; override;
{$ENDIF !NEXTGEN}
  end;


                 
function FindDefaultDataSet(AComp: TComponent): TDataSet;
  begin
  Result := TRESTFindDefaultComponent.FindDefaultT<TDataSet>(AComp);
end;

{ TCustomJSONDataSetAdapter }

procedure TCustomJSONDataSetAdapter.AddJSONDataRows(const AJSON: TJSONValue);
var
  LJSONValue: TJSONValue;
begin
  if AJSON is TJSONArray then
  begin
    // Multiple rows
    for LJSONValue in TJSONArray(AJSON) do
      AddJSONDataRow(LJSONValue);
  end
  else
    AddJSONDataRow(AJSON);

end;

procedure TCustomJSONDataSetAdapter.AddJSONDataRow(const AJSONValue: TJSONValue);
var
  LValue : variant;
  LJSONValue: TJSONValue;
  LField: TField;
  I: Integer;
  LPath: string;
  LDateTime: TDateTime;
begin
  Assert(FDataSet <> nil);
  FDataSet.Append;
  try
    for I := 0 to FDataSet.Fields.Count - 1 do
    begin
      LField := FDataSet.Fields[I];
      if not FInternalFieldPaths.TryGetValue(LField.FieldName, LPath) then
        LPath := LField.FieldName;
      if not AJSONValue.TryGetValue<TJSONValue>(LPath, LJSONValue) then
        LJSONValue := nil;
      if (LJSONValue = nil) then
        LValue := System.Variants.Null
      else
      if (LJSONValue IS TJSONFalse) then
        LValue := False
      else
      if (LJSONValue IS TJSONTrue) then
        LValue := True
      else
      if (LJSONValue IS TJSONNull) then
        LValue := System.Variants.Null
      else
      if (LJSONValue IS TJSONObject) then
        LValue:= LJSONValue.ToString
      else
      if (LJSONValue IS TJSONArray) then
        LValue:= LJSONValue.ToString
      else
      if LJSONValue IS TJSONString then
      begin
        LValue := LJSONValue.Value;
        if LField.DataType = ftDateTIme then
        begin
          if TryISO8601ToDate(LJSONValue.Value, LDateTime) then
            LValue := LDateTime
        end
        else if LField.DataType = ftTime then
        begin
          if TryISO8601ToDate(LJSONValue.Value, LDateTime) then
            LValue := TTime(TimeOf(LDateTime))
        end
        else if LField.DataType = ftDate then
        begin
          if TryISO8601ToDate(LJSONValue.Value, LDateTime) then
            LValue := TDate(DateOf(LDateTime));
        end
      end
      else
        LValue := LJSONValue.Value;

      LField.Value := LValue;
    end;
  finally
    FDataSet.Post;
  end;
end;

procedure TCustomJSONDataSetAdapter.ClearDataSet;
begin
  if Assigned(FDataSet) then
  begin
    FDataSet.Close;
    FDataSet.FieldDefs.Clear;
  end;
end;

constructor TCustomJSONDataSetAdapter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDataSet := nil;

  FFieldDefsDS := TRESTAdapterDataSet.Create(self);
  FFieldDefs := GetFieldDefsClass.Create(FFieldDefsDS);
  FInternalFieldDefsDS := TRESTAdapterDataSet.Create(self);
  FInternalFieldDefs := GetFieldDefsClass.Create(FInternalFieldDefsDS);
  FInternalFieldPaths := TDictionary<string, string>.Create;
  FStringFieldSize := 255;
end;

destructor TCustomJSONDataSetAdapter.Destroy;
begin
  FreeAndNIL(FFieldDefs);
  FFieldDefsDS.Free;
  FInternalFieldDefs.Free;
  FInternalFieldDefsDS.Free;
  FInternalFieldPaths.Free;
  inherited;
end;

procedure TCustomJSONDataSetAdapter.DoBeforeOpenDataSet;
begin
  //
end;

constructor TCustomJSONDataSetAdapter.TAdaptJSONField.Create(const AName, APath: string; AFieldType: TAdaptJSONFieldType);
begin
  FieldName := AName;
  Path := APath;
  FieldType := AFieldType;
end;

procedure TCustomJSONDataSetAdapter.AddJSONFieldNames(const AParent: TJSONValue; const APath: string; const AList: TList<TAdaptJSONField>; ADepth: Integer);

  procedure InternalAddJSONFieldNames(const AParent: TJSONValue; const AFullName, APath: string; const AList: TList<TAdaptJSONField>; ADepth: Integer);

    function BuildPath(const AParentPath, AName: string): string;
    begin
      if Pos('.', AName) <> 0 then
        Result := AParentPath + '[''' + AName + ''']'
      else
      begin
        Result := AParentPath;
        if Result <> '' then
          Result := Result + '.';
        Result := Result + AName;
      end;
    end;

    function BuildFullName(const AParentName, AName: string): string;
    begin
      Result := AParentName;
      if Result <> '' then
        Result := Result + '.';
      Result := Result + AName;
    end;

  var
    LPair: TJSONPair;
    LDepth: Integer;
  begin
    if ADepth = 0 then
      Exit;
    Assert((AParent is TJSONObject) or (APath <> ''));
    if AParent <> nil then
      if AParent is TJSONObject then
      begin
        if APath <> '' then
        begin
          AList.Add(TAdaptJSONField.Create(AFullName, APath, TAdaptJSONFieldType.JSONObject));
          LDepth := ADepth - 1;
        end
        else
          LDepth := ADepth;
        for LPair in TJSONObject(AParent) do
          InternalAddJSONFieldNames(LPair.JsonValue, BuildFullName(AFullName, LPair.JsonString.Value),
            BuildPath(APath, LPair.JsonString.Value), AList, LDepth);
      end
      else if AParent is TJSONArray then
      begin
        if APath <> '' then
          AList.Add(TAdaptJSONField.Create(AFullName, APath, TAdaptJSONFieldType.JSONArray));
      end
      else
      begin
        if APath <> '' then
          AList.Add(TAdaptJSONField.Create(AFullName, APath, TAdaptJSONFieldType.JSONValue));
      end;
  end;

begin
  InternalAddJSONFieldNames(AParent, APath, APath, AList, ADepth);
end;

procedure TCustomJSONDataSetAdapter.AddJSONFieldNames(const AParent: TJSONValue; const AList: TList<TAdaptJSONField>; ADepth: Integer);
var
  LValue: TJSONValue;
begin
  if ADepth = 0 then
    Exit;
  if AParent is TJSONObject then
    AddJSONFieldNames(AParent, '', AList, ADepth)
  else if AParent is TJSONArray then
  begin
    if TJSONArray(AParent).Count > 0 then
    begin
      LValue := TJSONArray(AParent).Items[0];
      if LValue is TJSONObject then
        AddJSONFieldNames(LValue, '', AList, ADepth)
      else if LValue is TJSONArray then
        AList.Add(TAdaptJSONField.Create(GetDefaultFieldName(LValue), '', TAdaptJSONFieldType.JSONArray))
      else
        AList.Add(TAdaptJSONField.Create(GetDefaultFieldName(LValue), '', TAdaptJSONFieldType.JSONValue))
    end;
  end
  else
    AList.Add(TAdaptJSONField.Create(GetDefaultFieldName(AParent), '', TAdaptJSONFieldType.JSONValue));
end;

procedure TCustomJSONDataSetAdapter.ScanJSONForFields(const AJSON: TJSONValue);

  function AddFieldDef(const AFieldName: string; const ADataType: TFieldType): boolean;
  var
    LFieldDef: TFieldDef;
  begin
    Result := FALSE;

    // we add each field only once

    if FInternalFieldDefs.IndexOf(AFieldName) < 0 then
    begin
      LFieldDef := FInternalFieldDefs.AddFieldDef;
      LFieldDef.Name := AFieldName;
      LFieldDef.DataType := ADataType;
      /// set size for stringtype-fields
      if (ADataType in [ftString, ftWideString]) then
        LFieldDef.Size := StringFieldSize;

      Result := True;
    end;
  end;

var
  LJSONFieldList: TList<TAdaptJSONField>;
  LJSONField: TAdaptJSONField;
begin
  Assert(FDataSet <> nil);
  Assert(AJSON <> nil);

  LJSONFieldList := TList<TAdaptJSONField>.Create;
  try
    AddJSONFieldNames(AJSON, LJSONFieldList, Max(1, GetScanDepth));
    for LJSONField in LJSONFieldList do
    begin
      AddFieldDef(LJSONField.FieldName, ftWideString);
      // Save path associated with a field
      FInternalFieldPaths.AddOrSetValue(LJSONField.FieldName, LJSONField.Path);
    end;
  finally
    LJSONFieldList.Free;
  end;
end;

procedure TCustomJSONDataSetAdapter.TransferJSONData(const AJSON: TJSONValue);
var
  LContext: TRTTIContext;
  LType: TRTTIType;
  LMethod: TRTTIMethod;
begin
  Assert(Assigned(FDataSet));
  Assert(Assigned(AJSON));

  /// dataset MUST have fields before we can continue
  if (FDataSet.Fields.Count = 0) and (FDataSet.FieldDefs.Count = 0) then
    exit;

  // Disable controls while creating dataset so that
  // activate notification is sent after populate
  FDataSet.DisableControls;
  try
    if not FDataSet.Active then
    begin
      DoBeforeOpenDataSet;
      if not FDataSet.Active then
      begin
        LType := LContext.GetType(FDataSet.ClassType);
        if LType <> nil then
        begin
          // Support TClientDataSet
          LMethod := LType.GetMethod('CreateDataSet');
          if (LMethod <> nil) and (Length(LMethod.GetParameters) = 0) then
            LMethod.Invoke(FDataSet, []);
        end;
      end;
      if not FDataSet.Active then
        FDataSet.Open;
    end;

    AddJSONDataRows(AJSON);

    /// just for convenience we relocate
    /// the dataset to the first record
    FDataSet.First;
  finally
    FDataSet.EnableControls;
  end;
end;

function TCustomRESTResponseDataSetAdapter.GetActive: boolean;
begin
  result := (Dataset <> nil) and Dataset.Active;
end;

function TCustomJSONDataSetAdapter.GetDefaultFieldName(
  const AJSON: TJSONValue): string;
begin
  Result := AJSON.ClassName.Substring(1);
end;

function TCustomJSONDataSetAdapter.GetFieldDefsClass: TFieldDefsClass;
begin
  result := DefaultFieldDefsClass;
end;

function TCustomJSONDataSetAdapter.GetScanDepth: Integer;
begin
  Result := 1;
end;

procedure TCustomJSONDataSetAdapter.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  /// clean up component-references
  if (Operation = opRemove) then
  begin
    if (AComponent = FDataSet) then
      FDataSet := nil
  end;
end;

procedure TCustomJSONDataSetAdapter.ResetToDefaults;
begin
  FFieldDefs.Clear;
  FFieldDefsDS.Fields.Clear;
  FFieldDefsDS.FieldDefs.Clear;
  FInternalFieldDefsDS.Fields.Clear;
  FInternalFieldDefsDS.FieldDefs.Clear;

end;

procedure TCustomJSONDataSetAdapter.SetDataSet(const AValue: TDataSet);
begin
  if Assigned(FDataSet) then
    FDataSet.RemoveFreeNotification(self);

  FDataSet := AValue;

  if Assigned(FDataSet) then
    FDataSet.FreeNotification(self);
end;

procedure TCustomJSONDataSetAdapter.SetFieldDefs(AValue: TFieldDefs);
begin
  FieldDefs.Assign(AValue);
end;

procedure TCustomJSONDataSetAdapter.UpdateDataSet(const AJSON: TJSONValue);
var
  I: Integer;
  LField: TField;
  LFieldDef: TFieldDef;
begin
  /// this code might get triggered even without a tdataset
  /// being attached. so we should check, if we have a dataset
  /// or not - both is okay. really.
  if Assigned(FDataSet) and (not (csDestroying in FDataSet.ComponentState)) and
    (not (csLoading in FDataSet.ComponentState)) then
  begin
    FInternalFieldPaths.Clear;
    try
      /// if we do not have any predefined fields-defs,
      /// we scan the JSON for available fields
      if FFieldDefs.Count = 0 then
      begin
        FInternalFieldDefs.Clear;
        // The following may raise an exception
        ScanJSONForFields(AJSON);
      end
      else
        FInternalFieldDefs.Assign(FFieldDefs);
    except
      if FDataSet.Active then
        FDataSet.Close;
      raise;
    end;
    if FDataSet.Active then
      FDataSet.Close;

    // Synchronize fielddefs and persistent fields
    if FDataSet.Fields.Count > 0 then
    begin
      for I := 0 to FInternalFieldDefs.Count - 1 do
      begin
        // Be sure fields and fields defs are compatible
        LField := FDataSet.FindField(FInternalFieldDefs[I].Name);
        if LField <> nil then
          LField.SetFieldDefProps(FInternalFieldDefs[I]);
      end;
      for I := 0 to FDataSet.Fields.Count - 1 do
      begin
        LField := FDataSet.Fields[I];
        if (FInternalFieldDefs as TDefCollection).Find(LField.FieldName) = nil then
        begin
          // Be sure there is a fielddef for every field
          LFieldDef := FInternalFieldDefs.AddFieldDef;
          LFieldDef.Name := LField.FieldName;
          LField.SetFieldDefProps(LFieldDef);
        end;
      end;
    end;

    FDataSet.DisableControls;
    try
      FDataSet.FieldDefs.Clear;
      FDataSet.FieldDefs.Assign(FInternalFieldDefs);
    finally
      FDataSet.EnableControls;
    end;

    TransferJSONData(AJSON);
  end;
end;

{ TCustomRESTResponseDataSetAdapter }

procedure TCustomRESTResponseDataSetAdapter.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  /// clean up component-references
  if (Operation = opRemove) then
  begin
    if (AComponent = Response) then
    begin
      FResponse := nil;
      if not (csDestroying in ComponentState) then
        DoJSONValueChanged;
    end;
    if (FResponseJSONIntf is TComponent) and (TComponent(FResponseJSONIntf) = AComponent) then
    begin
      FResponseJSONIntf := nil;
      if not (csDestroying in ComponentState) then
        DoJSONValueChanged;
    end;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.ResetToDefaults;
begin
  FAdapter.ResetToDefaults;
end;

function TCustomRESTResponseDataSetAdapter.GetResponseComponent: IRESTResponseJSON;
begin
  Result := nil;
  if Response <> nil then
    Result := Response
  else if ResponseJSON <> nil then
    Result := ResponseJSON;
end;

function TCustomRESTResponseDataSetAdapter.CreateJSONValue: TJSONValue;
var
  LJsonValue: TJSONValue;
  LHasOwner: Boolean;
  LPathValue: TJSONValue;
  LRESTResponseJSON: IRESTResponseJSON;
begin
  LRESTResponseJSON := GetResponseComponent;
  if LRESTResponseJSON = nil then
    raise EJSONValueError.Create(TJSONValueError.NoResponseComponent,  sAdapterResponseComponentIsNil);
  if LRESTResponseJSON.HasResponseContent then
    if not LRESTResponseJSON.HasJSONResponse then
      raise EJSONValueError.Create(TJSONValueError.NoJSON, sResponseContentIsNotJSON);

  if LRESTResponseJSON.HasJSONResponse then
  begin
    LRESTResponseJSON.GetJSONResponse(LJSONValue, LHasOwner);
    try
      Assert(LJSONValue <> nil);
      if LHasOwner then
        LJSONValue := LJSONValue.Clone as TJSONValue;
      LHasOwner := False;
      if (RootElement <> '') and (LJsonValue <> nil) then
      begin
        if LJSONValue.TryGetValue<TJSONValue>(RootElement, LPathValue) then
        begin
          LPathValue.Owned := False; // Need to decouple from parent, to avoid memleak
          LJsonValue.Free;
          LJsonValue := LPathValue;
        end
        else
          raise EJSONValueError.Create(TJSONValueError.InvalidRootElement, Format(sAdapterInvalidRootElement, [RootElement]));
      end;
    except
      if not LHasOwner then
        LJSONValue.Free;
      raise;
    end;
  end
  else
    LJSONValue := TJSONArray.Create; // Empty value
  Result := LJSONValue;
end;

function TCustomRESTResponseDataSetAdapter.GetJSONValue: TJSONValue;
begin
  if FJSONValue = nil then
    FJSONValue := CreateJSONValue;
  Assert(FJSONValue <> nil);
  Result := FJSONValue;
end;

procedure TCustomRESTResponseDataSetAdapter.SetActive(const Value: boolean);
begin
  if Value <> Active then
  begin
    if csLoading in ComponentState then
      FDeferActivate := Value
    else
    begin
      if Value then
        UpdateDataSet
      else
        ClearDataSet;
    end;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.SetAutoUpdate(const Value: boolean);
begin
  // Changing autoupdate does not cause an update.
  FAutoUpdate := Value;
end;

procedure TCustomRESTResponseDataSetAdapter.ClearDataSet;
begin
  if Assigned(FAdapter) then
    FAdapter.ClearDataSet;
end;

constructor TCustomRESTResponseDataSetAdapter.Create(AOwner: TComponent);
begin
  inherited;
  FAutoUpdate := TRUE;
  FNotify := TNotify.Create(self);
  FAdapter := TAdapter.Create(Self);
  FAdapter.FOwner := self;
end;

destructor TCustomRESTResponseDataSetAdapter.Destroy;
begin
  FAdapter.Free;
  inherited;
  if FResponse <> nil then
    if FResponse.NotifyList <> nil then
      FResponse.NotifyList.RemoveNotify(FNotify);
  FNotify.Free;
  FJSONValue.Free;
end;

procedure TCustomRESTResponseDataSetAdapter.DoBeforeOpenDataSet;
begin
  if Assigned(FOnBeforeOpenDataSet) then
    FOnBeforeOpenDataSet(self)
end;

procedure TCustomRESTResponseDataSetAdapter.DoJSONValueChanged;
begin
  InvalidateJSONValue;
  if not(csLoading in ComponentState) then
    if AutoUpdate then
      if (GetResponseComponent <> nil) and (GetResponseComponent.HasResponseContent) then
        UpdateDataSet
      else
        ClearDataSet;
end;

procedure TCustomRESTResponseDataSetAdapter.DoUpdateError(AError: TJSONValueError; const AMessage: string);
begin
  if Assigned(FOnUpdateError) then
    FOnUpdateError(Self, AError, AMessage);

end;

function TCustomRESTResponseDataSetAdapter.GetDataSet: TDataSet;
begin
  if Assigned(FAdapter) then
    result := FAdapter.Dataset
  else
    result := nil;
end;

function TCustomRESTResponseDataSetAdapter.GetDefaultFieldName(
  const AJSON: TJSONValue): string;
begin
  Result := FAdapter.GetDefaultFieldName(AJSON);
end;

function TCustomRESTResponseDataSetAdapter.GetRootFieldName: string;
var
  I: Integer;
  LRootElement: string;
begin
  LRootElement := RootElement;
  if LRootElement = '' then
  begin
    if FResponse <> nil then
      LRootElement := FResponse.RootElement;
  end;

  if LRootElement <> '' then
  begin
    I := LRootElement.LastDelimiter('.');
    if I >= 0 then
      Result := LRootElement.Substring(I+1);
  end;
end;

function TCustomRESTResponseDataSetAdapter.GetFieldDefs: TFieldDefs;
begin
  if Assigned(FAdapter) then
    result := FAdapter.FieldDefs
  else
    result := nil;
end;

function TCustomRESTResponseDataSetAdapter.GetStringFieldSize: Integer;
begin
  if Assigned(FAdapter) then
    Result := FAdapter.StringFieldSize
  else
    Result := 5000;
end;

procedure TCustomRESTResponseDataSetAdapter.InvalidateJSONValue;
begin
  FreeAndNil(FJSONValue);
end;

procedure TCustomRESTResponseDataSetAdapter.Loaded;
begin
  inherited;
  if FDeferActivate then
  begin
    if (GetResponseComponent <> nil) and (GetResponseComponent.HasResponseContent) then
    begin
      FDeferActivate := False;
      Active := True;
    end;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.SetDataSet(const Value: TDataSet);
begin
  if Assigned(FAdapter) then
    FAdapter.Dataset := Value;
end;

procedure TCustomRESTResponseDataSetAdapter.SetFieldDefs(const Value: TFieldDefs);
begin
  if Assigned(FAdapter) then
    FAdapter.FieldDefs := Value;
end;

procedure TCustomRESTResponseDataSetAdapter.SetResponse(const AValue: TCustomRESTResponse);
begin
  if AValue <> FResponse then
  begin
    if Assigned(FResponse) then
    begin
      FResponse.RemoveFreeNotification(self);
      if FResponse.NotifyList <> nil then
        FResponse.NotifyList.RemoveNotify(FNotify);
      FResponse.RemoveFreeNotification(self);
    end;

    FResponse := AValue;

    if Assigned(FResponse) then
    begin
      ResponseJSON := nil;
      FResponse.FreeNotification(self);
      if FResponse.NotifyList <> nil then
        FResponse.NotifyList.AddNotify(FNotify);
      FResponse.RemoveFreeNotification(self);
    end;
    if AutoUpdate then
      DoJSONValueChanged;
  end;

end;

procedure TCustomRESTResponseDataSetAdapter.ResponseJSONChanged(Sender: TObject);
begin
  DoJSONValueChanged;
end;

procedure TCustomRESTResponseDataSetAdapter.SetResponseJSONIntf(
  const Value: IRESTResponseJSON);
var
  LDoChange: Boolean;
begin
  if FResponseJSONIntf <> Value then
  begin
    LDoChange := True;
    if FResponseJSONIntf <> nil then
    begin
      if FResponseJSONIntf is TComponent then
        TComponent(FResponseJSONIntf).RemoveFreeNotification(Self);
      FResponseJSONIntf.RemoveJSONChangedEvent(ResponseJSONChanged);
    end;
    FResponseJSONIntf := Value;
    if FResponseJSONIntf <> nil then
    begin
      LDoChange := Response = nil; // Following line will DoChange if Response <> nil
      Response := nil;
      if FResponseJSONIntf is TComponent then
        TComponent(FResponseJSONIntf).FreeNotification(Self);
      FResponseJSONIntf.AddJSONChangedEvent(ResponseJSONChanged);
    end;
    if LDoChange then
      DoJSONValueChanged;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.SetRootElement(const AValue: string);
begin
  if FRootElement <> AValue then
  begin
    FRootElement := AValue;
    DoJSONValueChanged;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.SetNestedElements(
  const Value: Boolean);
begin
  if FNestedElements <> Value then
  begin
    FNestedElements := Value;
    DoJSONValueChanged;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.SetNestedElementsDepth(const Value: Integer);
begin
  if FNestedElementsDepth <> Value then
  begin
    FNestedElementsDepth := Value;
    if FNestedElements then
      DoJSONValueChanged;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.SetStringFieldSize(const Value: Integer);
begin
  if StringFieldSize <> Value then
  begin
    if Assigned(FAdapter) then
      FAdapter.StringFieldSize := Value;
    DoJSONValueChanged;
  end;
end;

procedure TCustomRESTResponseDataSetAdapter.UpdateDataSet(AJSONValue: TJSONValue);
begin
  try
    if Assigned(FAdapter) then
    begin
      if AJSONValue = nil then
        AJSONValue := GetJSONValue;
      FAdapter.UpdateDataSet(AJSONValue);
    end;
  except
    on E: EJSONValueError do
      if Assigned(FOnUpdateError) then
        FOnUpdateError(Self, E.Error, E.Message)
      else
        raise;
    else
      raise;
  end;
end;

{ TCustomRESTResponseDataSetAdapter.TAdapter }

procedure TCustomRESTResponseDataSetAdapter.TAdapter.DoBeforeOpenDataSet;
begin
  FOwner.DoBeforeOpenDataSet;
end;

function TCustomRESTResponseDataSetAdapter.TAdapter.GetDefaultFieldName(const AJSON: TJSONValue): string;
begin
  Result := FOwner.GetRootFieldName;
  if Result = '' then
    Result := inherited;

end;

function TCustomRESTResponseDataSetAdapter.TAdapter.GetScanDepth: Integer;
begin
  if FOwner.NestedElements then
  begin
    Result := FOwner.NestedElementsDepth;
    if Result <= 0 then
      Result := MaxInt;  // No limit
  end
  else
    Result := 1;
end;

{ TRESTAdapterDataSet }

{$IFDEF NEXTGEN}

function TRESTAdapterDataSet.GetRecord(Buffer: TRecBuf; GetMode: TGetMode; DoCheck: boolean): TGetResult;
begin
  result := grError;
end;
{$ENDIF}

procedure TRESTAdapterDataSet.InternalClose;
begin
  // nothing to do here, implementation just to avoid
  // abstract methods
end;

procedure TRESTAdapterDataSet.InternalHandleException;
begin
  // nothing to do here, implementation just to avoid
  // abstract methods
end;

procedure TRESTAdapterDataSet.InternalInitFieldDefs;
begin
  // nothing to do here, implementation just to avoid
  // abstract methods
end;

procedure TRESTAdapterDataSet.InternalOpen;
begin
  // nothing to do here, implementation just to avoid
  // abstract methods
end;

function TRESTAdapterDataSet.IsCursorOpen: boolean;
begin
  result := FALSE;
end;

{ TCustomRESTResponseDataSetAdapter.TNotify }

constructor TCustomRESTResponseDataSetAdapter.TNotify.Create(const AOwner: TCustomRESTResponseDataSetAdapter);
begin
  FOwner := AOwner;
end;

procedure TCustomRESTResponseDataSetAdapter.TNotify.JSONValueChanged(ASender: TObject);
begin
  FOwner.DoJSONValueChanged;
end;

{ TCustomRESTResponseDataSetAdapter.EJSONValueError }

constructor TCustomRESTResponseDataSetAdapter.EJSONValueError.Create(
  AError: TJSONValueError; const AMessage: string);
begin
  inherited Create(AMessage);
end;

{ TRESTResponseJSON }

procedure TRESTResponseJSON.AddJSONChangedEvent(const ANotify: TNotifyEvent);
begin
  Assert(not FJSONNotifyList.Contains(ANotify));
  if not FJSONNotifyList.Contains(ANotify) then
    FJSONNotifyList.Add(ANotify);
end;

constructor TRESTResponseJSON.Create(AOwner: TComponent);
begin
  inherited;
  FJSONNotifyList := TList<TNotifyEvent>.Create;
end;

constructor TRESTResponseJSON.Create(AOwner: TComponent; const AValue: TJSONValue; AOwnsValue: Boolean);
begin
  Create(AOwner);
  FValue := AValue;
  FOwnsValue := AOwnsValue;
end;

destructor TRESTResponseJSON.Destroy;
begin
  // We own the JSONValue, so free it.
  if FOwnsValue then
    FValue.Free;
  FJSONNotifyList.Free;
  inherited;
end;

procedure TRESTResponseJSON.GetJSONResponse(out AValue: TJSONValue;
  out AHasOwner: Boolean);
begin
  AValue := FValue;
  AHasOwner := FOwnsValue; // We own this object
end;

function TRESTResponseJSON.HasJSONResponse: Boolean;
begin
  Result := FValue <> nil;
end;

function TRESTResponseJSON.HasResponseContent: Boolean;
begin
  Result := FValue <> nil;
end;

procedure TRESTResponseJSON.RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
begin
  Assert(FJSONNotifyList.Contains(ANotify));
  FJSONNotifyList.Remove(ANotify);
end;

procedure TRESTResponseJSON.SetJSONValue(const AValue: TJSONValue;
  AOwnsValue: Boolean);
begin
  if FOwnsValue then
    FreeAndNil(FValue);
  FValue := AValue;
  FOwnsValue := AOwnsValue;
  ValueChanged(self);
end;

procedure TRESTResponseJSON.ValueChanged(Sender: TObject);
var
  LNotifyEvent: TNotifyEvent;
begin
  for LNotifyEvent in  FJSONNotifyList do
    LNotifyEvent(Self);
end;

end.
