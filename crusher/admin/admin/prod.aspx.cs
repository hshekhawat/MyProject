using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Drawing;

using System.Text;
using System.Configuration;

public partial class admin_prod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }

    }
    protected void Save_Click(object sender, EventArgs e)
    {
        if (FileImgsave.PostedFile != null)
        {
            string imgfile = Path.GetFileName(FileImgsave.PostedFile.FileName);
            FileImgsave.SaveAs(Server.MapPath("~/images/" + imgfile));
            string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(maincon);
            sqlconn.Open();
            string sqlquery = "insert into Product([ProductName],[ProductImage],[ProductDesc]) values (@ProductName, @ProductImage, @ProductDesc)";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlcomm.Parameters.AddWithValue("@ProductName", ProductName.Text);
            sqlcomm.Parameters.AddWithValue("@ProductImage", "admin/images/" + imgfile);
            sqlcomm.Parameters.AddWithValue("@ProductDesc", ProductDesc.Text);
            sqlcomm.ExecuteNonQuery();
            Response.Write("<script> alert('your record is inserted successfully'); </script>");
            sqlconn.Close();
        }
    }

    
}