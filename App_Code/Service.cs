using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public class Service
{
	public Service()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string GetServices()
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter adapt = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("Select * from Services ", con);
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "service");
        con.Close();
        return ds.GetXml();
    }
    //public string insertEnquiry(string name, string email, string message)
    //{
    //}
}