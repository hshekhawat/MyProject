﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
   // SqlConnection sqlconn;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["username"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        else
        {
           // string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
          //sqlconn = new SqlConnection(maincon);
          //  sqlconn.Open();

        }

    }
    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        Session.Abandon();
       // Session.Clear();
        //sqlconn.Close();
        Response.Redirect("../Login.aspx");
    }
}