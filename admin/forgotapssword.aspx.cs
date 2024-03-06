using System;
using System.Net;
using System.Net.Mail;
using System.Configuration;

public partial class admin_forgotapssword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string sendEmail = ConfigurationManager.AppSettings["SendEmail"];
        if (sendEmail.ToLower() == "true")
        {
            SendEmail(EmailId.Text);
        }
    }
    public static void SendEmail(string EmailId)
    {

        MailMessage mm = new MailMessage();
        string body = "<!DOCTYPE html PUBLIC \" -//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">";
        body += "<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>email</title></head>";
        body += "<body><table><tr><td style='background-color: #4ecdc4;border-color: #4c5764;border: 2px solid #45b7af;padding: 10px;text-align: center;'><a style='display: block;color: #ffffff;font-size: 12px;text-decoration: none;text-transform: uppercase;' href='http://localhost:31199/finalproject/admin/Password1.aspx'>Change Password</a></td></tr></table></body></html>";
        mm.To.Add(EmailId);
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

 
}
     