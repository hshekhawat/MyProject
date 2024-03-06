using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.IO;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;


public partial class admin_Default : System.Web.UI.Page
{
    SqlConnection sqlconn;
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    StringBuilder table = new StringBuilder();
    string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Product();
        }
        if (Session["username"] == null)
        {
            Response.Redirect("http://localhost:31199/finalproject/Login.aspx");
        }
        else
        {
            sqlconn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\hp\Documents\Project.mdf;Integrated Security=True;Connect Timeout=30";
            sqlconn.Open();
           // showdata();

        }
    }
    public void Product()
    {
        sqlconn = new SqlConnection(maincon);
        sqlconn.Open();
        SqlCommand cmd = new SqlCommand("Select ProductId,ProductName from Product", sqlconn);
        SqlDataReader rdr = cmd.ExecuteReader();
        ddlproduct.DataSource = rdr;
        ddlproduct.Items.Clear();
        ddlproduct.Items.Insert(0, "....Please select Products....");
        ddlproduct.DataTextField = "ProductName";
        ddlproduct.DataValueField = "ProductId";
        ddlproduct.DataBind();
        sqlconn.Close();
    }


    protected void ddlproduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        Product();
    }
    protected void ButSave_Click(object sender, EventArgs e)
    {
        string product = ddlproduct.SelectedItem.Value;

        if (FileImgsave.PostedFile != null)
        {
            string imgfile = Path.GetFileName(FileImgsave.PostedFile.FileName);
            FileImgsave.SaveAs(Server.MapPath("~/admin/images/" + imgfile));
            sqlconn = new SqlConnection(maincon);
            sqlconn.Open();
            string sqlquery = "insert into SubProduct([ProductId],[SubPimage],[SubPname],[SubPdesc]) values (@ProductId,@SubPimage,@SubPname, @SubPdesc)";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlcomm.Parameters.AddWithValue("@ProductId", ddlproduct.SelectedItem.Value);
            sqlcomm.Parameters.AddWithValue("@SubPimage", "admin/images/" + imgfile);
            sqlcomm.Parameters.AddWithValue("@SubPName", subpname.Text);
            sqlcomm.Parameters.AddWithValue("@SubPdesc", subpdesc.Text);
            sqlcomm.ExecuteNonQuery();
            Response.Write("<script> alert('your record is inserted successfully'); </script>");
            sqlconn.Close();
        }
    }
    //public void showdata()
    //{
    //    cmd.CommandText = "Select * from SubProduct  where Username='" + Session["username"] + "'";
    //    cmd.Connection = sqlconn;
    //    sda.SelectCommand = cmd;
    //    sda.Fill(ds, "SubProduct");
    //    SqlDataReader rdr = cmd.ExecuteReader();
    //    table.Append("<table class='table table-striped table-border table-hover' id='my'>");
    //    table.Append("<tbody>");
    //    while (rdr.Read())
    //    {

    //        table.Append("<tr>");
    //        table.Append("<td colspan='2'><img height='100px' width='80px' class='img-responsive img-thumbnail' src='" + rdr[2] + "'></td>");
    //        table.Append("</tr>");

    //        table.Append("<tr>");
    //        table.Append("<td> Sub Product Name</td>");
    //        table.Append("<td>" + rdr[3] + "</td>");
    //        table.Append("</tr>");

    //        table.Append("<tr>");
    //        table.Append("<td> Sub Product Description</td>");
    //        table.Append("<td>" + rdr[4] + "</td>");
    //        table.Append("</tr>");

            
    //    }
    //    table.Append("</tbody>");
    //    table.Append("</table>");
    //   PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
    //    rdr.Close();
    //}

    protected void SubProductGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void SubProductGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void SubProductGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void SubProductGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}