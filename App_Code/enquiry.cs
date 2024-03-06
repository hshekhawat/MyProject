using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

using System.Configuration;
/// <summary>
/// Summary description for enquiry
/// </summary>
public class enquiry
{
    string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection con;
	public enquiry()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string RecordInsert(string CustomerName, string CustomerMailId, string CustomerPhoneNo, string CustomerQuery)
    {
        con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("insertEnquiry", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CustomerName", CustomerName);
        cmd.Parameters.AddWithValue("@CustomerMailId", CustomerMailId);
        cmd.Parameters.AddWithValue("@CustomerPhoneNo", CustomerPhoneNo);
        cmd.Parameters.AddWithValue("@CustomerQuery", CustomerQuery);
        con.Open();
        int a = Convert.ToInt16(cmd.ExecuteScalar());
        con.Close();
        return Convert.ToString(a);
    }
}