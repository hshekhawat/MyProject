using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for Showgallery
/// </summary>
public class Showgallery
{
	public Showgallery()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string GetImages()
    {
        string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter adapt = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("Select PicImage from Gallery", con);
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "pic");
        con.Close();
        return ds.GetXml();
    }

}