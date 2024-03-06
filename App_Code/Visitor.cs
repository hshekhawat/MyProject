using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Visitor
/// </summary>
public class Visitor
{
	public Visitor()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int StoreVisitorsInfo()
    {
        string ipAddress;
        
        ipAddress =  HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipAddress == "" || ipAddress == null)
            ipAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];


        string strConnString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);

        SqlCommand cmd = new SqlCommand("VisitorsDetails");
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@IPAddress", ipAddress);

        cmd.Connection = con;
        con.Open();

     int a=   cmd.ExecuteNonQuery();

        con.Close();
        con.Dispose();
        return a;
    }

}