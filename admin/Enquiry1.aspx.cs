using System;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

using System.Configuration;

using System.Net;
public partial class Enquiry1 : System.Web.UI.Page
{
    int productid;
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
        adapt = new SqlDataAdapter("Select * from Enquiry ", con);
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        con.Close();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Reply")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand("select * from Enquiry where EnquiryId=" + id, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new System.Data.DataTable();
            dt.Load(dr);
            con.Close();
            if (dt.Rows.Count >= 1)
            {
                ModalPopupExtender1.Show();
                EmailId.Text = dt.Rows[0]["CustomerMailId"].ToString();
            }
        }
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        MailMessage mm = new MailMessage();
        string body = "<!DOCTYPE html PUBLIC \" -//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">";
        body += "<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>email</title></head>";
        body += "<body><table><tr><td style='background-color: #4ecdc4;border-color: #4c5764;border: 2px solid #45b7af;padding: 10px;text-align: center;'>" + Reply.Text + "</td></tr></table></body></html>";
        mm.To.Add(EmailId.Text);
        mm.Body = body;
        mm.Subject = "Change Password";
        mm.From = new MailAddress("shekhawatkhushi1404@gmail.com");
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential("shekhawatkhushi1404@gmail.com", "im*#966777");
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("EnquiryId");
        con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM Enquiry where EnquiryId='" + Convert.ToInt32(lbldeleteid.Text) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ShowData();
    }
}