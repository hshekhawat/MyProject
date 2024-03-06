using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Slide
/// </summary>
public class Slide
{
	public Slide()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string GetSlider()
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter adapt = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("Select SubPimage from SubProduct", con);
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "slider");
        con.Close();
        return ds.GetXml();
    
    }

}