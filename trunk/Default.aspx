<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OWL analysis via OntologyAccessHelper</title>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server">
    </ext:ResourceManager>
   
    <ext:Viewport runat="server">
        <Items>
            <ext:RowLayout runat="server" Split="true">
                <Rows>
                    <ext:LayoutRow RowHeight=".2">

                                <ext:FormPanel ID="FormPanel1" runat="server" ButtonAlign="Right" AutoHeight=true Padding="5"
                                    Title="查询窗体" Frame=true AutoWidth=true>
                                    <Items>
                                        <ext:TextField ID="TextField1" EmptyText="请输入零件ID，从下面列表中选择。" AllowBlank="false"  Note="例如：NU_VDZ_Geraetetafel"  runat="server" AnchorHorizontal="30%" FieldLabel="零件名称">
                                        </ext:TextField>
                                    </Items>
                                    <Buttons>
                                        <ext:Button ID="Button1" runat="server" Icon="Disk" Text="查询">
                                        <DirectEvents>
                                            <Click OnEvent="Search_Click">
                                                <EventMask Target="Page" Msg="正在查询..." MinDelay="2" ShowMask="true" />
                                            </Click>
                                        </DirectEvents>
                                        </ext:Button>
                                    </Buttons>
                                </ext:FormPanel>

                    </ext:LayoutRow>
                    <ext:LayoutRow RowHeight=".4">
                        <ext:TabPanel ID="TabPanel1" runat="server" Height="300">
                            <Items>
                                <ext:Panel ID="Panel1" runat="server" Title="目标模块">
                                    <Items>
                                   <ext:GridPanel ID="GridPanel0"  runat="server" Height="300" Title="所有控件列表">
                                        <Store>
                                             <ext:Store ID="Store0"   runat="server">
                                                <Reader>
                                                    <ext:JsonReader>
                                                        <Fields>
                                                            <ext:RecordField Name="ID"></ext:RecordField>
                                                            <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                                            <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                                            <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                                            <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                                            <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                                            <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                                        </Fields>
                                                    </ext:JsonReader>
                                                </Reader>
                                            </ext:Store>
                                        </Store>
                                        <ColumnModel>
                                            <Columns> 
                                            <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                                <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                                <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                                <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                                <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                                <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                                <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                                <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                                            </Columns>
                                        </ColumnModel>
                                        </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                                <ext:Panel ID="Panel2" runat="server" Title="-X">
                                    <Items>
                                          <ext:GridPanel ID="GridPanel1"  runat="server" Height="300">
                                            <Store>
                                                 <ext:Store ID="Store1"   runat="server">
                                                    <Reader>
                                                        <ext:JsonReader>
                                                            <Fields>
                                                                <ext:RecordField Name="ID"></ext:RecordField>
                                                                <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                                                <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                                                <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                                                <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                                                <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                                                <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                                            </Fields>
                                                        </ext:JsonReader>
                                                    </Reader>
                                                </ext:Store>
                                            </Store>
                                            <ColumnModel>
                                                <Columns> 
                                                <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                                    <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                                    <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                                    <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                                    <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                                    <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                                    <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                                    <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                                                </Columns>
                                            </ColumnModel>
                                            </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                                <ext:Panel ID="Panel3" runat="server" Title="X">
                                    <Items>
                                <ext:GridPanel ID="GridPanel2"  runat="server" Height="300" >
                                    <Store>
                                         <ext:Store ID="Store2"   runat="server">
                                            <Reader>
                                                <ext:JsonReader>
                                                    <Fields>
                                                        <ext:RecordField Name="ID"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                                    </Fields>
                                                </ext:JsonReader>
                                            </Reader>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel>
                                        <Columns> 
                                        <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                            <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                                <ext:Panel ID="Panel4" runat="server" Title="-Y">
                                    <Items>
                                    <ext:GridPanel ID="GridPanel3"  runat="server" Height="300" >
                                    <Store>
                                         <ext:Store ID="Store3"   runat="server">
                                            <Reader>
                                                <ext:JsonReader>
                                                    <Fields>
                                                        <ext:RecordField Name="ID"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                                    </Fields>
                                                </ext:JsonReader>
                                            </Reader>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel>
                                        <Columns> 
                                        <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                            <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                                <ext:Panel ID="Panel5" runat="server" Title="Y">
                                    <Items>
                                    <ext:GridPanel ID="GridPanel4"  runat="server" Height="300" >
                                    <Store>
                                         <ext:Store ID="Store4"   runat="server">
                                            <Reader>
                                                <ext:JsonReader>
                                                    <Fields>
                                                        <ext:RecordField Name="ID"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                                    </Fields>
                                                </ext:JsonReader>
                                            </Reader>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel>
                                        <Columns> 
                                        <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                            <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                                <ext:Panel ID="Panel6" runat="server" Title="-Z">
                                    <Items>
                                    <ext:GridPanel ID="GridPanel5"  runat="server" Height="300" >
                                    <Store>
                                         <ext:Store ID="Store5"   runat="server">
                                            <Reader>
                                                <ext:JsonReader>
                                                    <Fields>
                                                        <ext:RecordField Name="ID"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                                    </Fields>
                                                </ext:JsonReader>
                                            </Reader>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel>
                                        <Columns> 
                                        <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                            <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                                <ext:Panel ID="Panel7" runat="server" Title="Z">
                                    <Items>
                                    <ext:GridPanel ID="GridPanel6"  runat="server" Height="300" >
                                    <Store>
                                         <ext:Store ID="Store6"   runat="server">
                                            <Reader>
                                                <ext:JsonReader>
                                                    <Fields>
                                                        <ext:RecordField Name="ID"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                                        <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                                    </Fields>
                                                </ext:JsonReader>
                                            </Reader>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel>
                                        <Columns> 
                                        <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                            <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                            <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                            </Items>
                        </ext:TabPanel>
                    </ext:LayoutRow>
                    <ext:LayoutRow RowHeight=".4">
                        <ext:GridPanel ID="GridPanelAll"  runat="server" Height="300" Title="所有控件列表">
                        <Store>
                             <ext:Store ID="StoreAll"   runat="server">
                                <Reader>
                                    <ext:JsonReader>
                                        <Fields>
                                            <ext:RecordField Name="ID"></ext:RecordField>
                                            <ext:RecordField Name="Coordinate_X1"></ext:RecordField>
                                            <ext:RecordField Name="Coordinate_X2"></ext:RecordField>
                                            <ext:RecordField Name="Coordinate_Y1"></ext:RecordField>
                                            <ext:RecordField Name="Coordinate_Y2"></ext:RecordField>
                                            <ext:RecordField Name="Coordinate_Z1"></ext:RecordField>
                                            <ext:RecordField Name="Coordinate_Z2"></ext:RecordField>
                                        </Fields>
                                    </ext:JsonReader>
                                </Reader>
                            </ext:Store>
                        </Store>
                        <ColumnModel>
                            <Columns> 
                            <ext:RowNumbererColumn Width="50"></ext:RowNumbererColumn>
                                <ext:Column DataIndex="ID" Width="250" Header="控件ID"></ext:Column>
                                <ext:Column DataIndex="Coordinate_X1" Width="100" Header="-X"></ext:Column>
                                <ext:Column DataIndex="Coordinate_X2" Width="100" Header="X"></ext:Column>
                                <ext:Column DataIndex="Coordinate_Y1" Header="-Y"></ext:Column>
                                <ext:Column DataIndex="Coordinate_Y2" Header="Y"></ext:Column>
                                <ext:Column DataIndex="Coordinate_Z1" Header="-Z"></ext:Column>
                                <ext:Column DataIndex="Coordinate_Z2" Header="Z"></ext:Column>
                            </Columns>
                        </ColumnModel>
                        </ext:GridPanel>
                    </ext:LayoutRow>
                </Rows>
            </ext:RowLayout>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
