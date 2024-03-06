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

public partial class Feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Shubham Jain\Documents\Project.mdf;Integrated Security=True;Connect Timeout=30");
    StringBuilder div = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Show_data();
        }
    }
    private void Show_data()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from [Faculty]";
        cmd.Connection = con;
        SqlDataReader rdr = cmd.ExecuteReader();
        div.Append("<div class='col-lg-12'>");
        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                string id = "" + rdr[0] + "";
                div.Append("<a href='http://localhost:4752/Admin/Feedback Faculty.aspx?id=" + id + "'  ><div class='col-lg-2'><img style='height:180px; width:150px;' class='img-responsive'  src='" + rdr[2] + "'><div align='center'> " + rdr[1] + " </div> </a></br></div>");
            }

        }
        PlaceHolder1.Controls.Add(new Literal { Text = div.ToString() });
        rdr.Close();

    }
}
