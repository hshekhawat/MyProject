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

public partial class admin_subproduct : System.Web.UI.Page
{
    
 SqlConnection sqlconn;
    string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
 
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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Product();
        }
    }
    


    //protected void ddlproduct_SelectedIndexChanged(object sender, EventArgs e)
    //{
        
    //}
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

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
         (e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
        {
            // Here you will get the Control you need like:
            DropDownList dl = (DropDownList)e.Row.FindControl("DropDownList1");
            sqlconn = new SqlConnection(maincon);
            sqlconn.Open();
            SqlCommand cmd = new SqlCommand("Select ProductId,ProductName from Product", sqlconn);
            SqlDataReader rdr = cmd.ExecuteReader();
            dl.DataSource = rdr;
            dl.Items.Clear();
            dl.Items.Insert(0, "....Please select Products....");
            dl.DataTextField = "ProductName";
            dl.DataValueField = "ProductId";
            dl.DataBind();
            sqlconn.Close();
        }
    }
}