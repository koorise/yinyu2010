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
   
    <ext:Viewport Layout="Fit" runat="server">
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
                        <ext:TabPanel ID="TabPanel1" runat="server"   Height="300">
                            <Items>
                                <ext:Panel ID="Panel1"  runat="server" Title="目标模块">
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
                                            <TopBar>
                                                <ext:Toolbar runat="server">
                                                    <Items>
                                                        <ext:Button ID="Button2" runat="server" Text="从-X轴开始拆卸" Icon="DoorOpen">
                                                            <DirectEvents>
                                                                <Click OnEvent="Removing">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="axis" Value="-X"></ext:Parameter>
                                                                    </ExtraParams>
                                                                </Click>
                                                            </DirectEvents>
                                                        </ext:Button>
                                                    </Items>
                                                </ext:Toolbar>
                                            </TopBar>
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
                                    <TopBar>
                                                <ext:Toolbar ID="Toolbar1" runat="server">
                                                    <Items>
                                                        <ext:Button ID="Button3" runat="server" Text="从X轴开始拆卸" Icon="DoorOpen">
                                                            <DirectEvents>
                                                                <Click OnEvent="Removing">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="axis" Value="X"></ext:Parameter>
                                                                    </ExtraParams>
                                                                </Click>
                                                            </DirectEvents>
                                                        </ext:Button>
                                                    </Items>
                                                </ext:Toolbar>
                                            </TopBar>
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
                                    <TopBar>
                                                <ext:Toolbar ID="Toolbar2" runat="server">
                                                    <Items>
                                                        <ext:Button ID="Button4" runat="server" Text="从-Y轴开始拆卸" Icon="DoorOpen">
                                                            <DirectEvents>
                                                                <Click OnEvent="Removing">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="axis" Value="-Y"></ext:Parameter>
                                                                    </ExtraParams>
                                                                </Click>
                                                            </DirectEvents>
                                                        </ext:Button>
                                                    </Items>
                                                </ext:Toolbar>
                                            </TopBar>
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
                                    <TopBar>
                                                <ext:Toolbar ID="Toolbar3" runat="server">
                                                    <Items>
                                                        <ext:Button ID="Button5" runat="server" Text="从Y轴开始拆卸" Icon="DoorOpen">
                                                            <DirectEvents>
                                                                <Click OnEvent="Removing">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="axis" Value="Y"></ext:Parameter>
                                                                    </ExtraParams>
                                                                </Click>
                                                            </DirectEvents>
                                                        </ext:Button>
                                                    </Items>
                                                </ext:Toolbar>
                                            </TopBar>
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
                                    <TopBar>
                                                <ext:Toolbar ID="Toolbar4" runat="server">
                                                    <Items>
                                                        <ext:Button ID="Button6" runat="server" Text="从-Z轴开始拆卸" Icon="DoorOpen">
                                                            <DirectEvents>
                                                                <Click OnEvent="Removing">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="axis" Value="-Z"></ext:Parameter>
                                                                    </ExtraParams>
                                                                </Click>
                                                            </DirectEvents>
                                                        </ext:Button>
                                                    </Items>
                                                </ext:Toolbar>
                                            </TopBar>
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
                                    <TopBar>
                                                <ext:Toolbar ID="Toolbar5" runat="server">
                                                    <Items>
                                                        <ext:Button ID="Button7" runat="server" Text="从Z轴开始拆卸" Icon="DoorOpen">
                                                            <DirectEvents>
                                                                <Click OnEvent="Removing">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="axis" Value="Z"></ext:Parameter>
                                                                    </ExtraParams>
                                                                </Click>
                                                            </DirectEvents>
                                                        </ext:Button>
                                                    </Items>
                                                </ext:Toolbar>
                                            </TopBar>
                                    </ext:GridPanel>
                                    </Items>
                                </ext:Panel>
                            </Items>
                        </ext:TabPanel>
                    </ext:LayoutRow>
                    <ext:LayoutRow RowHeight=".4">
                        <ext:GridPanel ID="GridPanelAll"  runat="server"  Layout="Fit" Title="所有控件列表">
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
    <ext:Window ID="Window1" runat="server" Collapsible="false" Modal="true" Hidden="true" Width="800"  Height="600"  Icon="Application"  >
        <Items>
                        <ext:GridPanel ID="GridPanelCom" AutoExpandColumn="ID" Frame="true" runat="server"   AutoHeight="true" Layout="Fit" Title="模块拆卸序列">
                        <Store>
                             <ext:Store ID="StoreCom"    runat="server">
                                <Reader>
                                    <ext:JsonReader IDProperty="ID">
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
                        <SelectionModel>
                            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true">
                                <Listeners>
                                    <RowSelect Handler="{#{StoreConnections}.reload();}" Buffer="250" />
                                </Listeners>
                            </ext:RowSelectionModel>
                        </SelectionModel>  
                        </ext:GridPanel>
                        <ext:GridPanel ID="GridPanel8" runat="server" Frame="true" AutoHeight="true" Layout="Fit"  Title="模块对应连接件">
                            <Store>
                                <ext:Store ID="StoreConnections" OnRefreshData="StoreConnections_OnRefreshData" runat="server">
                                    <Reader>
                                        <ext:JsonReader>
                                            <Fields>
                                                <ext:RecordField Name="ComID"></ext:RecordField>
                                                <ext:RecordField Name="TypeName"></ext:RecordField>
                                                <ext:RecordField Name="TypeNameChild"></ext:RecordField>
                                                <ext:RecordField Name="ConnectionsID"></ext:RecordField>
                                            </Fields>
                                        </ext:JsonReader>
                                    </Reader>
                                    <BaseParams>
                                        <ext:Parameter Name="ID" 
                                        Value="#{GridPanelCom}.getSelectionModel().hasSelection() ? #{GridPanelCom}.getSelectionModel().getSelected().id : -1"
                                        Mode="Raw">
                                        </ext:Parameter>
                                    </BaseParams>
                                </ext:Store>
                            </Store>
                            <ColumnModel>
                                <Columns>
                                    <ext:Column DataIndex="TypeName" Header="类型"></ext:Column>
                                    <ext:Column DataIndex="TypeNameChild" Header="具体"></ext:Column>
                                    <ext:Column DataIndex="Connections" Header="详细"></ext:Column>
                                    
                                </Columns>
                            </ColumnModel>
                        </ext:GridPanel>
        </Items>
    </ext:Window>
    </form>
</body>
</html>
