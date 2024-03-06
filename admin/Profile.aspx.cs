using System;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Profile : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Response.Write("<script> alert('Hello');</script>");
            ShowData();
        }
    }
    protected void ShowData()
    {
        string query,imgFile=null;
        con = new SqlConnection(cs);
        query = "select * from Profile";

        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
         
            Label1.Text = Convert.ToString(rdr[1].ToString());
            imgFile = Convert.ToString(rdr[2].ToString());
            Label2.Text = Convert.ToString(rdr[3].ToString());
            Name.Text = Convert.ToString(rdr[1].ToString());
            Des.Text = Convert.ToString(rdr[3].ToString());
        }
        Image1.ImageUrl = imgFile.ToString();
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Save_Click(object sender, EventArgs e)
    {
        Int16 val = 1;
         string path = Path.GetFileName(FileImgsave.PostedFile.FileName);

      if (FileImgsave.HasFile)
        {
         
           FileImgsave.SaveAs(Server.MapPath("~/admin/images/" + path));
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Profile  set Name ='" + Name.Text + "',Image='images/" + path + "',Description='" + Des.Text + "'  where Id=" + val, con);
            cmd.ExecuteNonQuery(); 
            Response.Write("<script> alert('your record is inserted successfully'); </script>");
           
            con.Close();
        }
       
        else
        {
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Profile  set Name ='" + Name.Text + "',Description='" + Des.Text + "' where Id=" + '1', con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

      ShowData();        
        
    }
}
