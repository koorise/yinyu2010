using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq; 
using System.Data;
using System.Data.OleDb;

/// <summary>
///OLEDB 的摘要说明
/// </summary>
public class OLEDB
{
	public OLEDB()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public static string ConnStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/db.accdb") + ";Persist Security Info=False";
    public static OleDbConnection Conn = new OleDbConnection(ConnStr);
    public static OleDbDataReader  DataReader (string sql)
    {
        OleDbCommand cmd = new OleDbCommand();
        cmd.CommandText = sql;
        cmd.Connection = Conn;
        Conn.Open();
        OleDbDataReader dr = cmd.ExecuteReader();
        return dr;
    }

    public static void Execute(string sql)
    {
        OleDbCommand cmd = new OleDbCommand();
        cmd.CommandText = sql;
        cmd.Connection = Conn;
        Conn.Open();
        cmd.ExecuteNonQuery();
        Conn.Close();
    }
}
