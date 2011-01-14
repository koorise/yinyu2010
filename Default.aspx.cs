using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using OntologyAccessHelper;
using Ext.Net;
using OntologyAccessHelper.OwlHepler;

public partial class _Default : System.Web.UI.Page
{
    private IOwlParser Parser = new OwlXmlParser();//全局变量：节点分析器
    private IOwlGraph graph; //全局变量：节点描绘集合
    private string TargetNode;//全局变量：目标节点
    private string TargetModule;//全局变量：目标模块
    public double Coordinate_X1 = 0;
    public double Coordinate_X2 = 0;
    public double Coordinate_Y1 = 0;
    public double Coordinate_Y2 = 0;
    public double Coordinate_Z1 = 0;
    public double Coordinate_Z2 = 0;
    private string OwlPath = "~/owl/Testdaten.owl";//文件存储位置
    
    protected void Page_Load(object sender, EventArgs e)
    {
        graph = Parser.ParseOwl(Server.MapPath(OwlPath));
        SesameAccessHelper s_Controler = new SesameAccessHelper();
        s_Controler.LoadRDFXMLFile(Server.MapPath(OwlPath));
        s_Controler.GetNamespaces();
        List<ComponentID> componentIds = new List<ComponentID>();
        foreach (string str in s_Controler.Execute("Select ?m Where { ?m a base:PhysicalComponent }"))
        {
            IOwlNode owlNode = (IOwlNode) graph.Nodes[str];
            OwlEdgeCollection owlEdgeCollection = (OwlEdgeCollection) owlNode.ChildEdges;
            foreach (OwlEdge edge in owlEdgeCollection)
            {
                CoordnateCheck("Coordinate_X", edge);
                CoordnateCheck("Coordinate_Y", edge);
                CoordnateCheck("Coordinate_Z", edge);
            }
            string isPartOfstr = IsPartOf(str);
            if(isPartOfstr==null)
            {
                isPartOfstr = "";
            }
            else
            {
                isPartOfstr = isPartOfstr.Split('#')[1].ToString();
            }
            //OLEDB.Execute(
            //    "insert into owl_searchindex (ID,Coordinate_X1,Coordinate_X2,Coordinate_Y1,Coordinate_Y2,Coordinate_Z1,Coordinate_Z2,isPartOf)values('" +
            //    str.Split('#')[1].ToString() + "'," + Coordinate_X1 + "," + Coordinate_X2 + "," + Coordinate_Y1 + "," +
            //    Coordinate_Y2 + "," + Coordinate_Z1 + "," + Coordinate_Z2 + ",'" + isPartOfstr + "')");
            ComponentID componentId = new ComponentID { ID = str.Split('#')[1].ToString(), Coordinate_X1 = Coordinate_X1, Coordinate_X2 = Coordinate_X2, Coordinate_Y1 = Coordinate_Y1, Coordinate_Y2 = Coordinate_Y2, Coordinate_Z1 = Coordinate_Z1, Coordinate_Z2 = Coordinate_Z2 };
            componentIds.Add(componentId);
            Coordinate_X1 = 0;
            Coordinate_X2 = 0;
            Coordinate_Y1 = 0;
            Coordinate_Y2 = 0;
            Coordinate_Z1 = 0;
            Coordinate_Z2 = 0;

        }

        this.StoreAll.DataSource = componentIds;
        this.StoreAll.DataBind();
    }

    [DirectMethod]
    protected void Search_Click(object s,DirectEventArgs e)
    { 
        GetTargetModule(NodeId(TextField1.Text)); 
        this.Store0.DataSource = GetTargetModuleAregs(TargetModule);
        this.Store0.DataBind();
        this.Store1.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_X1");
        this.Store1.DataBind();
        this.Store2.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_X2");
        this.Store2.DataBind();
        this.Store3.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Y1");
        this.Store3.DataBind();
        this.Store4.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Y2");
        this.Store4.DataBind();
        this.Store5.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Z1");
        this.Store5.DataBind();
        this.Store6.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Z2");
        this.Store6.DataBind();
    }

    protected void Removing(object s,DirectEventArgs e)
    {
        string axis = e.ExtraParams["axis"].ToString();
        Window1.Title = "目标模块：" + TextField1.Text + "，从" + axis + "轴方向拆卸";

        GetTargetModule(NodeId(TextField1.Text)); 
        switch (axis)
        {
            case "-X":
                StoreCom.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_X1");
                StoreCom.DataBind();
                break;
            case "X":
                StoreCom.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_X2");
                StoreCom.DataBind();
                break;
            case "-Y":
                StoreCom.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Y1");
                StoreCom.DataBind();
                break;
            case "Y":
                StoreCom.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Y2");
                StoreCom.DataBind();
                break;
            case "-Z":
                StoreCom.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Z1");
                StoreCom.DataBind();
                break;
            case "Z":
                StoreCom.DataSource = GetMaskOrder(TargetModule.Split('#')[1], "Coordinate_Z2");
                StoreCom.DataBind();
                break;
                
        }
        Window1.Show();
        
    }
    protected void StoreConnections_OnRefreshData(object s, StoreRefreshDataEventArgs e)
    {
        string ComID = e.Parameters["ID"].ToString();
        StoreConnections.DataSource = GetConnections(ComID, "CableConnectionToExternal");
        StoreConnections.DataBind();
    }
    protected  List<Connections> GetConnections(string com,string TypeName)
    {
        graph = Parser.ParseOwl(Server.MapPath(OwlPath));
        IOwlNode owlNode = (IOwlNode)graph.Nodes["http://www.owl-ontologies.com/Ontology1286184178.owl#"+com];
        OwlEdgeCollection owlEdgeCollection = (OwlEdgeCollection)owlNode.ChildEdges;
        List<Connections> list = new List<Connections>();
        foreach (OwlEdge edge in owlEdgeCollection)
        {
            if (edge.ID == TypeName)
            {
                IOwlNode o = (IOwlNode) graph.Nodes[edge.ChildNode.ID];
                OwlEdgeCollection oc = (OwlEdgeCollection) o.ChildEdges;
                foreach (OwlEdge _o in oc)
                {
                    Connections connections = new Connections{ComID = com,ConnectionsID = _o.ChildNode.ID,TypeName = TypeName,TypeNameChild = _o.ID};
                    list.Add(connections);
                }
            }
        }
        return list;

    }
    #region CoordnateCheck(string coordinate,OwlEdge owlEdge) 取出模块坐标
    /// <summary>
    /// 取出模块坐标
    /// </summary>
    /// <param name="coordinate"></param>
    /// <param name="owlEdge"></param>
    protected void CoordnateCheck(string coordinate,OwlEdge owlEdge)
    {
        switch (coordinate)
        {
            case "Coordinate_X":
                if (owlEdge.ID.IndexOf(coordinate) != -1)
                {
                    if (Coordinate_X1 == 0)
                    {
                        Coordinate_X1 = Convert.ToDouble(owlEdge.ChildNode.ID.Split('^')[0].ToString());
                    }
                    else
                    {
                        Coordinate_X2 = Convert.ToDouble(owlEdge.ChildNode.ID.Split('^')[0].ToString());
                        if (Coordinate_X1 > Coordinate_X2)
                        {
                            double t = Coordinate_X1;
                            Coordinate_X1 = Coordinate_X2;
                            Coordinate_X2 = t;
                        }
                    }
                } 
                break;
            case "Coordinate_Y":
                if (owlEdge.ID.IndexOf(coordinate) != -1)
                {
                    if (Coordinate_Y1 == 0)
                    {
                        Coordinate_Y1 = Convert.ToDouble(owlEdge.ChildNode.ID.Split('^')[0].ToString());
                    }
                    else
                    {
                        Coordinate_Y2 = Convert.ToDouble(owlEdge.ChildNode.ID.Split('^')[0].ToString());
                        if (Coordinate_Y1 > Coordinate_Y2)
                        {
                            double t = Coordinate_Y1;
                            Coordinate_Y1 = Coordinate_Y2;
                            Coordinate_Y2 = t;
                        }
                    }
                }
                break;
            case "Coordinate_Z":
                if (owlEdge.ID.IndexOf(coordinate) != -1)
                {
                    if (Coordinate_Z1 == 0)
                    {
                        Coordinate_Z1 = Convert.ToDouble(owlEdge.ChildNode.ID.Split('^')[0].ToString());
                    }
                    else
                    {
                        Coordinate_Z2 = Convert.ToDouble(owlEdge.ChildNode.ID.Split('^')[0].ToString());
                        if (Coordinate_Z1 > Coordinate_Z2)
                        {
                            double t = Coordinate_Z1;
                            Coordinate_Z1 = Coordinate_Z2;
                            Coordinate_Z2 = t;
                        }
                    }
                }
                break;
        }
    }
    #endregion 

    #region string NodeId(string _node) 取出零件ID
    /// <summary>
    /// 取出零件ID
    /// </summary>
    /// <param name="_node"></param>
    /// <returns></returns>
    protected  string NodeId(string _node)
    {
        string _target = _node;
        SesameAccessHelper s_Controler= new SesameAccessHelper();
        s_Controler.LoadRDFXMLFile(Server.MapPath(OwlPath));
        s_Controler.GetNamespaces();
        List<ComponentID> componentIds = new List<ComponentID>();
        foreach (string str in s_Controler.Execute("Select ?m Where { ?m a base:PhysicalComponent }"))
        {
            if(str.IndexOf(_target)!=-1)
            {
                TargetNode = str;
            } 
        }

        graph = Parser.ParseOwl(Server.MapPath(OwlPath));
        return TargetNode;
    }
    #endregion

    #region string IsPartOf(string nodeid) 返回一个节点的IsPartOf 的ID
    /// <summary>
    /// 返回一个节点的IsPartOf 的ID
    /// </summary>
    /// <param name="nodeid"></param>
    /// <returns></returns>
    private string IsPartOf(string nodeid)
    {
        IOwlNode owlNode = (IOwlNode)graph.Nodes[nodeid];
        OwlEdgeCollection owlEdgeCollection = (OwlEdgeCollection)owlNode.ChildEdges;
        foreach (OwlEdge owlEdge in owlEdgeCollection)
        {
            if (owlEdge.ID.IndexOf("isPartOf") != -1)
            {
                return owlEdge.ChildNode.ID;
            }
        }
        return null;
    }
    #endregion

    #region  bool IsCoordinate(string nodeid) 判断一个节点是否包含Coordinate，即，如果包含则为模块
    private bool IsCoordinate(string nodeid)
    {
        IOwlNode owlNode = (IOwlNode)graph.Nodes[nodeid];
        OwlEdgeCollection owlEdgeCollection = (OwlEdgeCollection)owlNode.ChildEdges;
        foreach (OwlEdge owlEdge in owlEdgeCollection)
        {
            if (owlEdge.ID.IndexOf("Coordinate") != -1)
            {
                return true;
            }
        }
        return false;
    }
    #endregion

    #region bool IsRemove(string nodeid)判断一个父节点是否可以被拆卸
    private bool IsRemove(string nodeid)
    {
        IOwlNode owlNode = (IOwlNode)graph.Nodes[nodeid];
        OwlEdgeCollection edges = (OwlEdgeCollection)owlNode.ChildEdges;
        foreach (OwlEdge ed in edges)
        {
            if (ed.ID.IndexOf("isPartOf") != -1)
            {
                IOwlNode owlnode1 = (IOwlNode)graph.Nodes[ed.ChildNode.ID];
                OwlEdgeCollection edgeCollection1 = (OwlEdgeCollection)owlnode1.ChildEdges;
                int m = 0;
                int n = 0;
                foreach (OwlEdge e1 in edgeCollection1)
                {
                    if (e1.ID.IndexOf("consistsOf") != -1)
                    {
                        m++;
                        IOwlNode owlNode2 = (IOwlNode)graph.Nodes[e1.ChildNode.ID];
                        OwlEdgeCollection edgeCollection2 = (OwlEdgeCollection)owlNode2.ChildEdges;
                        bool ppp = false;
                        foreach (OwlEdge owlEdge in edgeCollection2)
                        {
                            if (owlEdge.ID.IndexOf("Coordinate") != -1)
                            {
                                ppp = true;
                            }
                        }
                        if (ppp)
                        {
                            n++;
                        }
                    }
                }
                if (m == n)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        return false;
    }
    #endregion

    #region void GetTargetModule(string nodeid) 获得目标模块
    /// <summary>
    /// 获得目标模块
    /// </summary>
    /// <param name="nodeid"></param>
    private void GetTargetModule(string nodeid)
    {
        if (IsRemove(nodeid))
        {
            TargetModule = IsPartOf(nodeid);
        }
        else
        {
            GetTargetModule(IsPartOf(nodeid));
        }
    }
    #endregion

    #region GetMaskOrder(string module, string Coordinate)遮挡比对

    protected List<ComponentID> GetMaskOrder(string module, string Coordinate)
    { 
        List<ComponentID> com=new List<ComponentID>();
        graph = Parser.ParseOwl(Server.MapPath(OwlPath));
        SesameAccessHelper s_Controler = new SesameAccessHelper();
        s_Controler.LoadRDFXMLFile(Server.MapPath(OwlPath));
        s_Controler.GetNamespaces();
        List<ComponentID> componentIds = new List<ComponentID>();
        foreach (string str in s_Controler.Execute("Select ?m Where { ?m a base:PhysicalComponent }"))
        {
            IOwlNode owlNode = (IOwlNode)graph.Nodes[str];
            OwlEdgeCollection owlEdgeCollection = (OwlEdgeCollection)owlNode.ChildEdges;
            foreach (OwlEdge edge in owlEdgeCollection)
            {
                CoordnateCheck("Coordinate_X", edge);
                CoordnateCheck("Coordinate_Y", edge);
                CoordnateCheck("Coordinate_Z", edge);

            }
            ComponentID componentId = new ComponentID { ID = str.Split('#')[1].ToString(), Coordinate_X1 = Coordinate_X1, Coordinate_X2 = Coordinate_X2, Coordinate_Y1 = Coordinate_Y1, Coordinate_Y2 = Coordinate_Y2, Coordinate_Z1 = Coordinate_Z1, Coordinate_Z2 = Coordinate_Z2 };
            componentIds.Add(componentId);
            Coordinate_X1 = 0;
            Coordinate_X2 = 0;
            Coordinate_Y1 = 0;
            Coordinate_Y2 = 0;
            Coordinate_Z1 = 0;
            Coordinate_Z2 = 0;

        }
        CoordinateCompare.CompareType c = CoordinateCompare.CompareType.Coordinate_X1;
        switch (Coordinate)
        {
            case "Coordinate_X1":
                c = CoordinateCompare.CompareType.Coordinate_X1;
                break;
            case "Coordinate_X2":
                c = CoordinateCompare.CompareType.Coordinate_X2;
                break;
            case "Coordinate_Y1":
                c = CoordinateCompare.CompareType.Coordinate_Y1;
                break;
            case "Coordinate_Y2":
                c = CoordinateCompare.CompareType.Coordinate_Y2;
                break;
            case "Coordinate_Z1":
                c = CoordinateCompare.CompareType.Coordinate_Z1;
                break;
            case "Coordinate_Z2":
                c = CoordinateCompare.CompareType.Coordinate_Z2;
                break;
 
        }
        componentIds.Sort(new CoordinateCompare(c));
        bool start = false;
        foreach (ComponentID id in componentIds)
        {
            if(id.ID == module)
            {
                start = true;  
            }
            if(start)
            {
                if ((id.Coordinate_X1 != 0) || (id.Coordinate_X2 != 0) || (id.Coordinate_Y1 != 0) || (id.Coordinate_Y2 != 0) || (id.Coordinate_Z1 != 0) || (id.Coordinate_Z2 != 0))
                {
                    com.Add(id);
                }
            }
        } 
        return com;
    }

    #endregion

    #region 获取目标模块坐标
    protected List<ComponentID> GetTargetModuleAregs(string s)
    {
        graph = Parser.ParseOwl(Server.MapPath(OwlPath));
        SesameAccessHelper s_Controler = new SesameAccessHelper();
        s_Controler.LoadRDFXMLFile(Server.MapPath(OwlPath));
        s_Controler.GetNamespaces();
        List<ComponentID> componentIds = new List<ComponentID>();
        foreach (string str in s_Controler.Execute("Select ?m Where { ?m a base:PhysicalComponent }"))
        {
            IOwlNode owlNode = (IOwlNode)graph.Nodes[str];
            OwlEdgeCollection owlEdgeCollection = (OwlEdgeCollection)owlNode.ChildEdges;
            foreach (OwlEdge edge in owlEdgeCollection)
            {
                CoordnateCheck("Coordinate_X", edge);
                CoordnateCheck("Coordinate_Y", edge);
                CoordnateCheck("Coordinate_Z", edge);

            }
            if (str == s)
            {
                ComponentID componentId = new ComponentID
                                              {
                                                  ID = str.Split('#')[1].ToString(),
                                                  Coordinate_X1 = Coordinate_X1,
                                                  Coordinate_X2 = Coordinate_X2,
                                                  Coordinate_Y1 = Coordinate_Y1,
                                                  Coordinate_Y2 = Coordinate_Y2,
                                                  Coordinate_Z1 = Coordinate_Z1,
                                                  Coordinate_Z2 = Coordinate_Z2
                                              };
                componentIds.Add(componentId);
            }
            Coordinate_X1 = 0;
            Coordinate_X2 = 0;
            Coordinate_Y1 = 0;
            Coordinate_Y2 = 0;
            Coordinate_Z1 = 0;
            Coordinate_Z2 = 0;

        }
        return componentIds;
    }
    #endregion
}
#region Connections类
/// <summary>
/// Connections类
/// </summary>
public class Connections
{

    public String ComID { get; set; }
    public String TypeName { get; set; }
    public String TypeNameChild { get; set; }
    public String ConnectionsID { get; set; }
}
#endregion
#region PhysicalComponent类
/// <summary>
/// PhysicalComponent类
/// </summary>
public class ComponentID
{
    public String ID { get; set; }
    public String Name{get; set;}
    public double Coordinate_X1{get; set;}
    public double Coordinate_X2 { get; set; }
    public double Coordinate_Y1 { get; set; }
    public double Coordinate_Y2 { get; set; }
    public double Coordinate_Z1 { get; set; }
    public double Coordinate_Z2 { get; set; }
     
}
public class CoordinateCompare:IComparer<ComponentID>
{
    public enum CompareType
    {
        Coordinate_X1,
        Coordinate_X2,
        Coordinate_Y1,
        Coordinate_Y2,
        Coordinate_Z1,
        Coordinate_Z2
    }
    private CompareType compareType;
    public CoordinateCompare(CompareType compareType)
    {
        this.compareType = compareType;
    }
    public int Compare(ComponentID a,ComponentID b)
    {
        int result = 0;
        switch (compareType)
        {
            case CompareType.Coordinate_X1:
                result = -a.Coordinate_X1.CompareTo(b.Coordinate_X1);
                break;
            case CompareType.Coordinate_X2:
                result = a.Coordinate_X2.CompareTo(b.Coordinate_X2);
                break;
            case CompareType.Coordinate_Y1:
                result = -a.Coordinate_Y1.CompareTo(b.Coordinate_Y1);
                break;
            case CompareType.Coordinate_Y2:
                result = a.Coordinate_Y2.CompareTo(b.Coordinate_Y2);
                break;
            case CompareType.Coordinate_Z1:
                result = -a.Coordinate_Z1.CompareTo(b.Coordinate_Z1);
                break;
            case CompareType.Coordinate_Z2:
                result = a.Coordinate_Z2.CompareTo(b.Coordinate_Z2);
                break;

        }
        return result;
    }

}
#endregion