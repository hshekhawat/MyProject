using System;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_prod : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection con;
    SqlDataAdapter adapt;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowData();
        }
    }
    protected void ShowData()
    {
        dt = new DataTable();
        con = new SqlConnection(cs);
        con.Open();
        adapt = new SqlDataAdapter("Select * from Products", con);
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        { ProductGridView.DataSource = dt;
            ProductGridView.DataBind();
        }
        con.Close();
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileImgsave.PostedFile != null)
            {

                string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(maincon);

                string imgfile = Path.GetFileName(FileImgsave.PostedFile.FileName);
                string docfile = Path.GetFileName(FileDocSave.PostedFile.FileName);
                FileImgsave.SaveAs(Server.MapPath("~/admin/products/" + imgfile));
                if (FileDocSave.HasFile)
                {
                    FileDocSave.SaveAs(Server.MapPath("~/admin/docs/" + docfile));
                    sqlconn.Open();
                    string sqlquery = "insert into Products([ProductName],[ProductImage],[ProductDesc],[Productdoc],[ProductKey]) values (@ProductName, @ProductImage, @ProductDesc, @ProductDoc,@ProductKey)";
                    SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
                    sqlcomm.Parameters.AddWithValue("@ProductName", ProductName.Text);
                    sqlcomm.Parameters.AddWithValue("@ProductImage", "products/" + imgfile);
                    sqlcomm.Parameters.AddWithValue("@ProductDesc", ProductDesc.Text);
                    sqlcomm.Parameters.AddWithValue("@ProductDoc", "docs/" + docfile);
                    sqlcomm.Parameters.AddWithValue("@ProductKey", ProductKey.Text);
                    sqlcomm.ExecuteNonQuery();
                    Response.Write("<script> alert('your record is inserted successfully'); </script>");
                    sqlconn.Close();
                }

                else
                {
                    sqlconn.Open();
                    string sqlquery = "insert into Products([ProductName],[ProductImage],[ProductDesc],[ProductKey]) values (@ProductName, @ProductImage, @ProductDesc,@ProductKey)";
                    SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
                    sqlcomm.Parameters.AddWithValue("@ProductName", ProductName.Text);
                    sqlcomm.Parameters.AddWithValue("@ProductImage", "products/" + imgfile);
                    sqlcomm.Parameters.AddWithValue("@ProductDesc", ProductDesc.Text);
                    sqlcomm.Parameters.AddWithValue("@ProductKey", ProductKey.Text);
                    sqlcomm.ExecuteNonQuery();
                    Response.Write("<script> alert('your record is inserted successfully'); </script>");
                    sqlconn.Close();
                }
            }
        }
        catch
        {
            Response.Write("<script> alert('Oops Error...please fill all the fields properly'); </script>");
        }
    }


    
    protected void ProductGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = ProductGridView.Rows[e.RowIndex].FindControl("ProductId") as Label;
        TextBox ProductName = (TextBox)ProductGridView.Rows[e.RowIndex].FindControl("TextBox1");
        FileUpload FileUpload1 = (FileUpload)ProductGridView.Rows[e.RowIndex].FindControl("FileUpload1");
        TextBox ProductDesc = (TextBox)ProductGridView.Rows[e.RowIndex].FindControl("TextBox3");
        FileUpload FileUpload2 = (FileUpload)ProductGridView.Rows[e.RowIndex].FindControl("FileUpload2");
        TextBox ProductKey = (TextBox)ProductGridView.Rows[e.RowIndex].FindControl("txtproductkey");
        
        string path = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string path1 = Path.GetFileName(FileUpload2.PostedFile.FileName);
        if (FileUpload1.HasFile && FileUpload2.HasFile)
        {

            FileUpload1.SaveAs(Server.MapPath("~/admin/products/" + path));
            FileUpload2.SaveAs(Server.MapPath("~/admin/docs/" + path1));
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Products  set ProductName ='" + ProductName.Text + "',ProductImage='products/" + path + "',ProductDesc='" + ProductDesc.Text + "',ProductKey='" + ProductKey.Text + "',ProductDoc='docs/" + path1 + "'  where ProductId=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        else if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/admin/products/" + path));
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Products  set ProductName ='" + ProductName.Text + "',ProductImage='products/" + path + "',ProductDesc='" + ProductDesc.Text + "',ProductKey='" + ProductKey.Text + "'  where ProductId=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        else if (FileUpload2.HasFile)
        {
            FileUpload2.SaveAs(Server.MapPath("~/admin/docs/" + path1));
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Products  set ProductName ='" + ProductName.Text + "',ProductDesc='" + ProductDesc.Text + "',ProductKey='" + ProductKey.Text + "',ProductDoc='docs/" + path1 + "'  where ProductId=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Products  set ProductName ='" + ProductName.Text + "',ProductDesc='" + ProductDesc.Text + "',ProductKey='" + ProductKey.Text +"' where ProductId=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

                ProductGridView.EditIndex = -1;
                ShowData();
        
    }
    protected void ProductGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ProductGridView.EditIndex = e.NewEditIndex;
        ShowData();  

    }
    protected void ProductGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ProductGridView.EditIndex = -1;
        ShowData(); 
    }
    protected void ProductGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)ProductGridView.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("ProductId");
        con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from SubProduct where ProductId='" + Convert.ToInt32(lbldeleteid.Text) + "'", con);
        SqlCommand cmd1 = new SqlCommand("delete FROM Products where ProductId='" + Convert.ToInt32(lbldeleteid.Text) + "'", con);
        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();
        ShowData();
    }
    protected void ProductGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ProductGridView.PageIndex = e.NewPageIndex;
        ShowData();
    }
}