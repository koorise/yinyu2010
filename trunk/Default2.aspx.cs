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
public partial class Default2 : System.Web.UI.Page
{
    private IOwlParser Parser = new OwlXmlParser();//全局变量：节点分析器
    private IOwlGraph graph; //全局变量：节点描绘集合
    
    private string OwlPath = "~/owl/Testdaten.owl";//文件存储位置
    protected void Page_Load(object sender, EventArgs e)
    {
        graph = Parser.ParseOwl(Server.MapPath(OwlPath));
        SesameAccessHelper s_Controler = new SesameAccessHelper();
        s_Controler.LoadRDFXMLFile(Server.MapPath(OwlPath));
        s_Controler.GetNamespaces();
         
        foreach (string str in s_Controler.Execute("Select ?m Where { ?m a base:PhysicalComponent }"))
        {
            IOwlNode owlNode = (IOwlNode)graph.Nodes[str];
            OwlEdgeCollection owlEdgeCollection = (OwlEdgeCollection)owlNode.ChildEdges;
            foreach (OwlEdge edge in owlEdgeCollection)
            {
                 Response.Write(edge.ChildNode.ID+"<br>");
            }
             
             
        }
    }
}
