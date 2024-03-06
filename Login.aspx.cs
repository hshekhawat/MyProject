using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
   string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            
    DataSet ds = new DataSet();
    String query;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            Response.Redirect("admin/Dashboard.aspx");
     
        }
        SqlConnection con = new SqlConnection(maincon);
        con.Open();
        if (!IsPostBack)
        {

            if (Request.Cookies["username"] != null)

                Email.Text = Request.Cookies["username"].Value;

            if (Request.Cookies["password"] != null)
                Password.Attributes.Add("value", Request.Cookies["password"].Value);
            if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
                rememberme.Checked = true;
        }
    }
protected void submit_Click(object sender, EventArgs e)
{
    SqlConnection con = new SqlConnection(maincon);
    con.Open();
         String username = Email.Text.Trim();
    query = "AdminLogin";
    SqlCommand cmd = new SqlCommand(query,con);
    cmd.CommandType = CommandType.StoredProcedure;
    cmd.Parameters.AddWithValue("@username", Email.Text.ToString());
    cmd.Parameters.AddWithValue("@password", Password.Text.ToString());
    int usercount = (Int32)cmd.ExecuteScalar();
    if (usercount == 1)
    {
        if (rememberme.Checked == true)
        {
            Response.Cookies["username"].Value = Email.Text;
            Response.Cookies["password"].Value = Password.Text;
            Response.Cookies["username"].Expires = DateTime.Now.AddDays(15);
            Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
        }

        else
        {

            Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);

            Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);

        }
        Session["username"] = username;
        Response.Redirect("admin/Dashboard.aspx");
    }
    else
    {
        con.Close();
        Response.Write("<script> alert('Username & password is incorrect'); </script>");

    }

    
}
}