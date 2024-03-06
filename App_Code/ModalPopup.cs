using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

using System.Configuration;
/// <summary>
/// Summary description for ModalPopup
/// </summary>
public class ModalPopup
{
    string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection con;
	public ModalPopup()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string DisplayService(int ServiceId)
    {
        con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("ModalPopup", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@ServiceId", ServiceId);
        //con.Open();
        //int a = Convert.ToInt16(cmd.ExecuteScalar());
        //con.Close();
        //return Convert.ToString(a);

       
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ServiceId", ServiceId);
        SqlDataAdapter adapt = new SqlDataAdapter();
        //SqlCommand cmd = new SqlCommand("ModalPopup ", con);
        DataSet ds = new DataSet();
        con.Open();
        adapt.SelectCommand = cmd;
        adapt.Fill(ds, "ServiceDetail");
        con.Close();
        return ds.GetXml();
    }
}