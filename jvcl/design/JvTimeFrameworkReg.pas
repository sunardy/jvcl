{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvTimeFrameworkReg.PAS, released on 2003-08-01.

The Initial Developer of the Original Code is Unlimited Intelligence Limited.
Portions created by Unlimited Intelligence Limited are Copyright (C) 1999-2002 Unlimited Intelligence Limited.
All Rights Reserved.

Contributor(s):
Mike Kolter (original code)

Last Modified: 2003-08-01

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}
unit JvTimeFrameworkReg;

// WARNING!!
// THIS FILE CANNOT BE INCLUDED IN A RUNTIME PACKAGE.  IF YOU INCLUDE
// THIS FILE IN A RUNTIME PACKAGE THE CODE FROM DsgnIntf WILL BE COMPILED
// INTO THE PACKAGE.  DsgnIntf IS *NOT* DESIGNATED AS REDISTRIBUTABLE BY
// BORLAND.

interface

{$IFDEF COMPILER6_UP}
uses 
  DesignIntf, DesignEditors, ColnEdit;
{$ELSE}
uses
  DsgnIntf, ColnEdit;
{$ENDIF}

Type
{$IFDEF COMPILER5}
  TJvTFGridLayoutCategory = class(TLayoutCategory)
  public
    class function Name: String; override;
  end;

  TJvTFCustomDrawCategory = class(TVisualCategory)
  public
    class function Name : String; override;
  end;
{$ENDIF}
  TJvTFGlanceCellsProperty = class(TCollectionProperty)
  public
    function GetColOptions: TColOptions; override;
  end;



procedure Register;

implementation
uses
  Classes,
  JvTFGlance, JvTFGlanceTextViewer, JvTFMonths, JvTFWeeks, JvTFDays, JvTFAlarm, JvTFManager;


{$IFDEF COMPILER5}
{ TJvTFGridLayoutCategory }
class function TJvTFGridLayoutCategory.Name: String;
begin
  Result := 'Grid Layout';
end;
{$ENDIF}

{ TJvTFCustomDrawCategory }
{$IFDEF COMPILER5}
class function TJvTFCustomDrawCategory.Name: String;
begin
  Result := 'Custom Draw';
end;
{$ENDIF}

{ TJvTFGlanceCellsProperty }

function TJvTFGlanceCellsProperty.GetColOptions: TColOptions;
begin
  Result := [];
end;
const
  cTimePalette = 'Jv TimeFrameWork';
procedure Register;
begin
  RegisterComponents(cTimePalette, [TJvTFScheduleManager, TJvTFUniversalPrinter]);
//  RegisterPropertyEditor(TypeInfo(string), TJvTFControl, 'Version', TutfVersionEditor);
//  RegisterPropertyEditor(TypeInfo(string), TJvTFScheduleManager, 'Version', TutfVersionEditor);

  RegisterComponents(cTimePalette, [TJvTFGlanceTextViewer, TJvTFMonths,
    TJvTFWeeks,TJvTFAlarm]);
//  RegisterPropertyEditor(TypeInfo(TJvTFGlanceCells), '', 'Cells',
//    TJvTFGlanceCellsProperty);

  // register a nil property editor for now, so cells cannot be added,
  // deleted, or moved at design time... BAD THINGS HAPPEN
  RegisterPropertyEditor(TypeInfo(TJvTFGlanceCells), TJvTFMonths, 'Cells', nil);
  RegisterComponents(cTimePalette, [TJvTFDays, TJvTFDaysPrinter]);
  {$IFDEF COMPILER5}
  RegisterPropertiesInCategory(TVisualCategory, ['StateImages', 'CustomImages',
    'StateImageMap']);
  RegisterPropertiesInCategory(TDatabaseCategory, ['OnNeedAppts', 'OnPostAppt',
    'OnDeleteAppt', 'OnRefreshAppt', 'OnRefreshSched', 'OnRefreshAll',
    'OnPostApptQuery']);
  RegisterPropertiesInCategory(TJvTFCustomDrawCategory, ['OnDrawHeader',
    'OnDrawBody', 'OnDrawFooter']);
  RegisterPropertiesInCategory(TVisualCategory, ['ApptAttr', 'ApptBar',
    'ApptBuffer', 'ColTitleStyle', 'DateFormat', 'FancyRowHdrAttr',
    'GrabHandles', 'Granularity', 'HdrAttr', 'Options', 'RowHdrType',
    'SelApptAttr', 'SelCellAttr', 'SelFancyRowHdrAttr', 'SelHdrAttr',
    'Thresholds', 'TimeFormat', 'FormattedDesc', 'Grouping',
    'utfHintProps', 'GroupHdrAttr', 'SelGroupHdrAttr']);
  RegisterPropertiesInCategory(TJvTFGridLayoutCategory, ['AutoSizeCols',
    'ColHdrHeight', 'Cols', 'DefColWidth', 'Granularity', 'LeftCol',
    'MinColWidth', 'MinRowHeight', 'RowHdrWidth', 'RowHeight', 'Template',
    'TopRow', 'Grouping', 'GroupHdrHeight']);
  RegisterPropertiesInCategory(TLocaleCategory, ['DateFormat', 'TimeFormat']);
  RegisterPropertiesInCategory(TInputCategory, ['FocusedCol', 'FocusedRow',
    'Options']);
  RegisterPropertiesInCategory(TDragNDropCategory, ['GrabHandles', 'Options']);
  RegisterPropertiesInCategory(TJvTFGridLayoutCategory, ['OnDateChanged',
    'OnDateChanging', 'OnDeleteAppt', 'OnDeleteSchedule', 'OnGranularityChanged',
    'OnGranularityChanging', 'OnInsertAppt', 'OnInsertSchedule', 'OnMoveCol',
    'OnSizeCol', 'OnSizeColHdr', 'OnSizeRow', 'OnSizeRowHdr',
    'OnFocusedColChanged', 'OnFocusedRowChanged']);
  RegisterPropertiesInCategory(TInputCategory, ['OnDeleteAppt',
    'OnDeleteSchedule', 'OnFailEditor', 'OnInsertAppt', 'OnInsertSchedule',
    'OnQuickEntry', 'OnFocusedColChanged', 'OnFocusedRowChanged',
    'OnCreateQuickEntry']);
  RegisterPropertiesInCategory(TJvTFCustomDrawCategory, ['OnDrawAppt',
    'OnDrawColHdr', 'OnDrawCorner', 'OnDrawDataCell', 'OnDrawGrabHandle',
    'OnDrawMajorRowHdr', 'OnDrawMinorRowHdr', 'OnDrawRow', 'OnDrawRowHdr',
    'OnDrawApptBar', 'OnDrawGroupHdr', 'OnShadeCell']);
  RegisterPropertiesInCategory(TDragNDropCategory, ['OnSizeAppt', 'OnDropAppt']);
  RegisterPropertiesInCategory(TMiscellaneousCategory, ['OnSelectAppt',
    'OnSelectedAppt', 'OnSelectingAppt', 'OnSizeAppt', 'OnUpdateColTitles']);
  {$ENDIF}
end;



end.
