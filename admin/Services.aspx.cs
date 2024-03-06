using System;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_Services : System.Web.UI.Page
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
        adapt = new SqlDataAdapter("Select * from Services ", con);
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ServiceGridView.DataSource = dt;
            ServiceGridView.DataBind();
        }
        con.Close();
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        if (FileImgsave.PostedFile != null)
        {
            string imgfile = Path.GetFileName(FileImgsave.PostedFile.FileName);
            FileImgsave.SaveAs(Server.MapPath("~/admin/products/" + imgfile));
            string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(maincon);
            sqlconn.Open();
            string sqlquery = "insert into Services([ServiceName],[ServiceImage],[ServiceDesc],[ServiceKey]) values (@ServiceName, @ServiceImage, @ServiceDesc,@ServiceKey)";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlcomm.Parameters.AddWithValue("@ServiceName", ServiceName.Text);
            sqlcomm.Parameters.AddWithValue("@ServiceImage", "products/" + imgfile);
            sqlcomm.Parameters.AddWithValue("@ServiceDesc", ServiceDesc.Text);
            sqlcomm.Parameters.AddWithValue("@servicekey",ServiceKey.Text);
            sqlcomm.ExecuteNonQuery();
            Response.Write("<script> alert('your record is inserted successfully'); </script>");
            sqlconn.Close();
        }
    }
    protected void ServiceGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ServiceGridView.EditIndex = -1;
        ShowData(); 
    }
    protected void ServiceGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = ServiceGridView.Rows[e.RowIndex].FindControl("ServiceId") as Label;
        TextBox ServiceName = (TextBox)ServiceGridView.Rows[e.RowIndex].FindControl("TextBox1");
        FileUpload FileUpload1 = (FileUpload)ServiceGridView.Rows[e.RowIndex].FindControl("FileUpload1");
        TextBox ServiceDesc = (TextBox)ServiceGridView.Rows[e.RowIndex].FindControl("TextBox3");
        TextBox ServiceKey = (TextBox)ServiceGridView.Rows[e.RowIndex].FindControl("ServiceKey");
         string path = Path.GetFileName(FileUpload1.PostedFile.FileName);
      if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/admin/products/" + path));
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Services  set ServiceName ='" + ServiceName.Text + "',ServiceImage='products/" + path + "',ServiceDesc='" + ServiceDesc.Text + "',ServiceKey='" + ServiceKey.Text + "'  where ServiceId=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
       
        else
        {
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Services  set ServiceName ='" + ServiceName.Text + "',ServiceDesc='" + ServiceDesc.Text + "',ServiceKey='" + ServiceKey.Text + "' where ServiceId=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

      ServiceGridView.EditIndex = -1;
        ShowData();
     
    }
    protected void ServiceGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ServiceGridView.EditIndex = e.NewEditIndex;
        ShowData();  
    }
    protected void ServiceGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)ServiceGridView.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("ServiceId");
        con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM Services where ServiceId='" + Convert.ToInt32(lbldeleteid.Text) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ShowData();

    }
    protected void ServiceGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        ServiceGridView.PageIndex = e.NewPageIndex;
        ShowData();
    }
}