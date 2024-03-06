using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
public partial class admin_Default : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
            BindImageRepeater();
        }
    }
    private void BindGridView()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Showslider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected string GetActiveClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }
    private void BindImageRepeater()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Showslider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbid = (Label)row.FindControl("Label2");
        SqlConnection con = new SqlConnection(CS);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM Gallery where PicId='" + lbid.Text + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGridView();


    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridView();
    }
    protected void btnUpload_Click1(object sender, EventArgs e)
    {
        try
        {
            if (SliderFileUpload.PostedFile != null)
            {
                string FileName = Path.GetFileName(SliderFileUpload.PostedFile.FileName);
                //Save files to disk  
                SliderFileUpload.SaveAs(Server.MapPath("company/" + FileName));
                //Add Entry to DataBase  
                string CS = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("InsertSliderImages", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@ImageName", FileName);
                    cmd.Parameters.AddWithValue("@ImagePath", "company/" + FileName);
                    cmd.ExecuteNonQuery();
                    BindGridView();
                    BindImageRepeater();
                }
            }

        }
        catch (Exception)
        {

        }
    }
}