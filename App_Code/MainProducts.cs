using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

using System.Configuration;
/// <summary>
/// Summary description for MainProducts
/// </summary>
public class MainProducts
{
    
	public MainProducts()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string DisplayMainProduct(int ProductId)
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con;
        con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("MainProduct", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ProductId", ProductId);
        SqlDataAdapter adapt = new SqlDataAdapter();
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "ProductDetail");
        con.Close();
        return ds.GetXml();
    }
    public string DisplaySubProduct(int ProductId)
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con;
        con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("Proc_SubProduct", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ProductId", ProductId);
        SqlDataAdapter adapt = new SqlDataAdapter();
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "SubProductDetail");
        con.Close();
        return ds.GetXml();
    }
    
}