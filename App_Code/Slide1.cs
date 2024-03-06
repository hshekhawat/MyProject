using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Slide1
/// </summary>
public class Slide1
{
	public Slide1()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string GetSlider1()
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter adapt = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("Select ServiceImage from Services", con);
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "imgslide");
        con.Close();
        return ds.GetXml();

    }
}