using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public class Product
{
	public Product()
	{
	}

    public string GetProducts()
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter adapt = new SqlDataAdapter();
        SqlCommand cmd=new SqlCommand("Select * from Products ", con);
        DataSet ds=new DataSet();
         con.Open();
         adapt.SelectCommand = cmd;
         adapt.Fill(ds, "prod");
         con.Close();
         return ds.GetXml();
    }
}