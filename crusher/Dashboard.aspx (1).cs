using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Web.UI.DataVisualization.Charting;
public partial class admin_Default3 : System.Web.UI.Page
{
    string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

    int productcount = 0, servicescount = 0, enquirycount = 0, visitorcount = 0;
    string product, services, enquiry, visitor;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                SqlConnection sqlconn = new SqlConnection(maincon);
                sqlconn.Open();
                product = "SELECT COUNT(*) FROM Products";
                services = "SELECT COUNT(*) FROM Services";
                enquiry = "SELECT COUNT(*) FROM Enquiry";
                visitor = "SELECT COUNT(*) FROM Visitors";
                SqlCommand prodcmd = new SqlCommand(product, sqlconn);
                SqlCommand serviecmd = new SqlCommand(services, sqlconn);
                SqlCommand enquirycmd = new SqlCommand(enquiry, sqlconn);
                SqlCommand visitorcmd = new SqlCommand(visitor, sqlconn);
                productcount = (int)prodcmd.ExecuteScalar();
                servicescount = (int)serviecmd.ExecuteScalar();
                enquirycount = (int)enquirycmd.ExecuteScalar();
                visitorcount = (int)visitorcmd.ExecuteScalar();
                lbProductCount.Text = Convert.ToString(productcount);
                lbProductServices.Text = Convert.ToString(servicescount);
                lbEnquiry.Text = Convert.ToString(enquirycount);
                lbVisitorCount.Text = Convert.ToString(visitorcount);

            }
            YearlyWise();
        }
    }

    private void YearlyWise()
    {
        try
        {
            Chart1.Visible = true;
            string query = string.Format("select VisitedDate,count(id) as 'Total' from Visitors group by VisitedDate order by VisitedDate");
            DataTable dt = GetData(query);
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart1.Series[0].Points.DataBindXY(x, y);
            //Chart1.Series[0].ChartType = SeriesChartType.Doughnut;
            Chart1.Series[0].ChartType = SeriesChartType.Column;
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            Chart1.Legends[0].Enabled = true;
        }
        catch { }
    }
    private static DataTable GetData(string query)
    {
        try
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand(query);
            String constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }
        catch
        {
            return null;
        }
    }

}