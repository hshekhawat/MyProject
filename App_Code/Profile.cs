using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for Profile
/// </summary>
public class Profile
{
	public Profile()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string GetProfile()
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter adapt = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("Select * from Profile ", con);
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "profile");
        con.Close();
        return ds.GetXml();
    }
}