using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Password1 : System.Web.UI.Page
{
    string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

    SqlCommand cmd = new SqlCommand();
    SqlConnection con;
    SqlDataAdapter sda;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(maincon);
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String Email = name.Text;
        String pass = myInput.Text;
        String str = "Select * from login";
        sda = new SqlDataAdapter(str, con);
        //sda.UpdateCommand = cmd;
        sda.Fill(ds, "login");

        //sda.Update(ds,"Faculty");
        DataTable dt = ds.Tables["login"];
        dt.Rows[0]["Password"] = pass;
        string sql = "update login set Password='" + pass + "'where Username='" + Email + "'";
        try
        {
            con = new SqlConnection(maincon);
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