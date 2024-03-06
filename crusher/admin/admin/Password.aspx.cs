using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
public partial class admin_Password : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter sda;
    SqlCommandBuilder cb;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = @"Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\hp\\Documents\\nationalcrusher.mdf;Integrated Security=True;Connect Timeout=30";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String Email = username.Text;
        String pass = tbrepeat.Text;
        String str = "Select * from login";
        sda = new SqlDataAdapter(str, con);
        //sda.UpdateCommand = cmd;
        sda.Fill(ds,"login");
        //sda.Update(ds,"Faculty");
        DataTable dt = ds.Tables["login"];
        dt.Rows[1]["Password"] = pass;
        string sql = "update login set Password='" + pass + "'where Username='" + Email + "'";
        try
        {
            con.Open();
            cmd = new SqlCommand(sql, con);
            sda.UpdateCommand = cmd;
            sda.Update(ds, "login");
            Response.Write("<script> alert('Password Created');</script>");
        }
        catch (Exception)
        {
            con.Close();
        }
    }
}