using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class admin_subproducts : System.Web.UI.Page
{
    SqlConnection con;
    string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlDataAdapter da;
    DataSet ds;
    string str;
    public void Product()
    {
        con = new SqlConnection(maincon);
        con.Open();
        SqlCommand cmd = new SqlCommand("Select ProductId,ProductName from Products", con);
        SqlDataReader rdr = cmd.ExecuteReader();
        ddlproduct.DataSource = rdr;
        ddlproduct.Items.Clear();
        ddlproduct.Items.Insert(0, "....Please select Products....");
        ddlproduct.DataTextField = "ProductName";
        ddlproduct.DataValueField = "ProductId";
        ddlproduct.DataBind();
        con.Close();
        con.Open();
        str = "select t1.SubPid,t2.ProductName, t1.SubPimage,t1.SubPname,t1.subPdesc from SubProduct as t1 inner join Products as t2 on t1.ProductId=t2.ProductId";
        cmd = new SqlCommand(str, con);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Product();
        }
    }
    protected void ButSave_Click(object sender, EventArgs e)
    {
        try
        {
            string product = ddlproduct.SelectedItem.Value;

            if (FileImgsave.PostedFile != null)
            {
                string imgfile = Path.GetFileName(FileImgsave.PostedFile.FileName);
                FileImgsave.SaveAs(Server.MapPath("~/admin/products/" + imgfile));
                con = new SqlConnection(maincon);
                con.Open();
                string sqlquery = "insert into SubProduct([ProductId],[SubPimage],[SubPname],[SubPdesc]) values (@ProductId,@SubPimage,@SubPname, @SubPdesc)";
                SqlCommand sqlcomm = new SqlCommand(sqlquery, con);
                sqlcomm.Parameters.AddWithValue("@ProductId", ddlproduct.SelectedItem.Value);
                sqlcomm.Parameters.AddWithValue("@SubPimage", "products/" + imgfile);
                sqlcomm.Parameters.AddWithValue("@SubPName", subpname.Text);
                sqlcomm.Parameters.AddWithValue("@SubPdesc", subpdesc.Text);
                sqlcomm.ExecuteNonQuery();
                Response.Write("<script> alert('your record is inserted successfully'); </script>");
                con.Close();
            }
        }
        catch
        {
            Response.Write("<script> alert('Oops Error...please fill all the fields properly'); </script>");
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
         (e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
        {
            DropDownList dl = (DropDownList)e.Row.FindControl("DropDownList1");
            con = new SqlConnection(maincon);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select ProductId,ProductName from Products", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            ((DropDownList)e.Row.FindControl("DropDownList1")).Items.Clear();
            ((DropDownList)e.Row.FindControl("DropDownList1")).DataValueField = "ProductId";
            ((DropDownList)e.Row.FindControl("DropDownList1")).DataTextField = "ProductName";
            ((DropDownList)e.Row.FindControl("DropDownList1")).DataSource = rdr;
            ((DropDownList)e.Row.FindControl("DropDownList1")).DataBind();
            ((DropDownList)e.Row.FindControl("DropDownList1")).Items.Insert(0, "Select");
            con.Close();
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            GridView1.EditIndex = e.NewEditIndex;
            Product();
        }
        catch 
        {
        } 
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            FileUpload FileUpload1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            string path = Path.GetFileName(FileUpload1.PostedFile.FileName);

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
            DropDownList ddlcategory = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
            if (FileUpload1.HasFile)
            {

                FileUpload1.SaveAs(Server.MapPath("~/admin/products/" + path));
                con = new SqlConnection(maincon);
                con.Open();
                SqlCommand cmd = new SqlCommand("update subproduct set SubPimage='products/" + path + "', subpname='" + txtName.Text + "',productid=" + ddlcategory.SelectedValue + " where subpid=" + id, con);
                int a = cmd.ExecuteNonQuery();
                con.Close();
                if (a == 1)
                {
                    GridView1.EditIndex = -1;
                    Product();
                    Response.Write("<script> alert('Edited Successfully'); </script>");

                }
          
                else
                {
                    Response.Write("<script> alert('Oops Error...'); </script>");
                }
            }
            else
            {
                con = new SqlConnection(maincon);
                con.Open();
                SqlCommand cmd = new SqlCommand("update subproduct set  subpname='" + txtName.Text + "',productid=" + ddlcategory.SelectedValue + " where subpid=" + id, con);
                int a = cmd.ExecuteNonQuery();
                con.Close();
                if (a == 1)
                {
                    GridView1.EditIndex = -1;
                    Product();
                    Response.Write("<script> alert('Edited Successfully'); </script>");

                }
                else
                {
                    Response.Write("<script> alert('Oops Error...'); </script>");
                }
            }
        }
        catch
        {
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Product();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con = new SqlConnection(maincon);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM subproduct where subpid='" + Convert.ToInt32(lbldeleteid.Text) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Product();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Product();

    }
}