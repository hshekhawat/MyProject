using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.IO;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Shubham Jain\Documents\Project.mdf;Integrated Security=True;Connect Timeout=30");
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            lbfacId.Text = Request.QueryString["id"];
        }

        if (!IsPostBack)
        {
            Show_facfeedback();

            show_overallfeedback();
        }

    }
    protected void Show_facfeedback()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Shubham Jain\Documents\Project.mdf;Integrated Security=True;Connect Timeout=30;MultipleActiveResultSets=True");
        con.Open();
        SqlCommand cmd;
        SqlDataReader rdr;
        string sql;
        string fname = null;
        sql = "select FName from Faculty where FId= '" + lbfacId.Text + "'";
        cmd = new SqlCommand(sql, con);
        rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            fname = Convert.ToString(rdr[0].ToString());
        }
        SqlCommand cmd1 = new SqlCommand("select Sname from Subjects where FacultyName= '" + fname + "'", con);
        DataTable dt = new DataTable();
        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd1;
        ad.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.Items.Clear();
        DropDownList1.Items.Insert(0, "....Please select Subject....");
        DropDownList1.DataTextField = "Sname";
        DropDownList1.DataBind();
        con.Close();

    }

    protected void show_overallfeedback()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Shubham Jain\Documents\Project.mdf;Integrated Security=True;Connect Timeout=30;MultipleActiveResultSets=True");
        con.Open();
        SqlCommand cmd4;
        SqlDataReader rdr4;
        string sql3;
        string facname = null;
        sql3 = "select FName from Faculty where FId= '" + lbfacId.Text + "'";
        cmd4 = new SqlCommand(sql3, con);
        rdr4 = cmd4.ExecuteReader();
        while (rdr4.Read())
        {
            facname = Convert.ToString(rdr4[0].ToString());
            SqlCommand cmd5;
            string sql4;
            sql4 = "select Sname,Total from Form where FacultyName= '" + facname + "'";

            IList<Subject1> subject = new List<Subject1> { };

            cmd5 = new SqlCommand(sql4, con);
            SqlDataReader rdr5 = cmd5.ExecuteReader();
            Series series = Chart1.Series["Series1"];
            // Loop thru each Student record
            while (rdr5.Read())
            {
                string str = rdr5["Sname"].ToString();
                var data = subject.FirstOrDefault(x => x.subjectname == str);

                if (data == null)
                {
                    subject.Add(new Subject1 { subjectname = rdr5["Sname"].ToString(), subjecttotal = rdr5["Total"].ToString() });
                }
                else
                {
                    double total = (Double.Parse(data.subjecttotal) + Double.Parse(rdr5["Total"].ToString()));
                    data.subjecttotal = total.ToString();
                }
            }


            foreach (var item in subject)
            {
                double Total = Math.Round(double.Parse(item.subjecttotal), 2);

                series.Points.AddXY(item.subjectname, Total.ToString());
            }

        }
    }
   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        show_overallfeedback();
        string SubName = DropDownList1.Text;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Shubham Jain\Documents\Project.mdf;Integrated Security=True;Connect Timeout=30;MultipleActiveResultSets=True");
        con.Open();

        IList<Category> subject = new List<Category> { };


        SqlCommand cmd = new SqlCommand("Select FormId from Form where SName='" + SubName + "'" , con);

        SqlDataReader rdr;

        rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            int FormID = Convert.ToInt32(rdr[0].ToString());
            SqlCommand cmd3;
            string sql2;

            sql2 = "select * from ResultData where FormId= '" + FormID + "'";
            cmd3 = new SqlCommand(sql2, con);
            SqlDataReader rdr3 = cmd3.ExecuteReader();

            while (rdr3.Read())
            {
                string cat = rdr3["Category"].ToString();

                var data = subject.FirstOrDefault(x => x.CategoryName == cat);

                if (data == null)
                {
                    subject.Add(new Category { CategoryName = rdr3["Category"].ToString(), Average = rdr3["QMarks"].ToString() , Count = 1 });
                }
                else
                {
                    double TotalMarks = (Double.Parse(data.Average) + Double.Parse(rdr3["QMarks"].ToString()));
                    data.Average = TotalMarks.ToString();
                    data.Count++;
                }
            }
        }

        Series series = Chart2.Series["Series2"];


        foreach (var item in subject)
        {
            double Average = Math.Round(Double.Parse(item.Average) / item.Count , 2);

            series.Points.AddXY(item.CategoryName, Average.ToString());
        }


     }
}

