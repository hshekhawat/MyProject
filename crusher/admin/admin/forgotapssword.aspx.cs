using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Web.UI.HtmlControls;

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
    
    public static void SendEmail(string emailText)
    {
        // Specify the from and to email address
        MailMessage mailMessage = new MailMessage("shekhawatharsh1914@gmail.com", emailText);
        // Specify the email body
        mailMessage.Body = "<html><body><table><tr><td style='background-color: #4ecdc4;border-color: #4c5764;border: 2px solid #45b7af;padding: 10px;text-align: center;'><a style='display: block;color: #ffffff;font-size: 12px;text-decoration: none;text-transform: uppercase;' href='http://localhost:31199/finalproject/admin/Password.aspx'>Change Password</a></td></tr></table></body></html>";
        mailMessage.IsBodyHtml = true;
        // Specify the email Subject
        mailMessage.Subject = "Change Password";

        // Specify the SMTP server name and post number
        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
        // Specify your gmail address and password
        smtpClient.Credentials = new System.Net.NetworkCredential("shekhawatharsh1914@gmail.com","im*#9,66,777");
        smtpClient.UseDefaultCredentials = true;
        // Gmail works on SSL, so set this property to true
        smtpClient.EnableSsl = true;

        smtpClient.Send(mailMessage);

    }
}
        // Finall send the email message using Send() method
        //try
        //{
          



        //}


        //catch (Exception ex)
        //{
        //    Console.WriteLine("Exception caught in CreateCopyMessage(): {0}",
        //                ex.ToString());
        //}
   
   
    //    string username = "";
    //    string password = "";
    //    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\hp\\Documents\\nationalcrusher.mdf;Integrated Security=True;Connect Timeout=30");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("select Username, Password from login ", con);
    //    cmd.Parameters.AddWithValue("username", EmailId.Text);
     
    //    using (SqlDataReader sdr = cmd.ExecuteReader())
    //    {

    //        if (sdr.Read())
    //        {
    //            username = sdr["username"].ToString();
    //            password = sdr["password"].ToString();

    //        }

    //    }
    //    con.Close();

    //    if (!string.IsNullOrEmpty(password))
    //    {
    //        MailMessage msg = new MailMessage();
    //        msg.From = new MailAddress("shekhawatharsh1914@gmail.com");
    //        msg.To.Add(EmailId.Text);
    //        msg.Subject = " Recover your Password";
    //        msg.Body = ("Your Username is:" + username + "<br/><br/>" + "Your Password is:" + password);
    //        msg.IsBodyHtml = true;

    //        SmtpClient smt = new SmtpClient();
    //        smt.Host = "smtp.gmail.com";
    //        System.Net.NetworkCredential ntwd = new NetworkCredential();
    //        ntwd.UserName = "shekhawatharsh1914@gmail@gmail.com"; //Your Email ID  
    //        ntwd.Password = "im*#9,66,777"; // Your Password  
    //        smt.UseDefaultCredentials = true;
    //        smt.Credentials = ntwd;
    //        smt.Port = 587;
    //        smt.EnableSsl = true;
    //        smt.Send(msg);
    //        lbmsg.Text = "Username and Password Sent Successfully";
    //        lbmsg.ForeColor = System.Drawing.Color.ForestGreen;
    //    }
    //}

    //protected void LinkButton1_Click(object sender, EventArgs e) {  
    //    Response.Redirect("Default.aspx");  
    //}  
//Redirectform.aspx.cs
//using System;  
//using System.Collections.Generic;  
//using System.Linq;  
//using System.Web;  
//using System.Web.UI;  
//using System.Web.UI.WebControls;  
  
//publicpartialclassRedirectform: System.Web.UI.Page {  
//    protectedvoid Page_Load(object sender, EventArgs e) {  
  
//    }  
//    protectedvoid Button2_Click(object sender, EventArgs e) {  
//        Response.Redirect("Default.aspx");  
//    }  
//}  