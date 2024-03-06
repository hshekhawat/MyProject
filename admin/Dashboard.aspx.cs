using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
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
                BindYear();
                
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

            LoadChart();
        }
    }

    private void LoadChart()
    {
        Chart1.Visible = true;
        string query = string.Format("select DATENAME(month,VisitedDate),count(id) from Visitors where ( YEAR(VisitedDate)) ='" + DropDownList1.SelectedItem.ToString() + "'  group by DATENAME(month,VisitedDate) ");
          
        DataTable dt = GetData(query);
        string[] x = new string[dt.Rows.Count];
        int[] y = new int[dt.Rows.Count];
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            x[i] = dt.Rows[i][0].ToString();
            y[i] = Convert.ToInt32(dt.Rows[i][1]);
        }
        Chart1.Series[0].Points.DataBindXY(x, y);
        Chart1.Series[0].ChartType = SeriesChartType.Column;
    }

    private void BindYear()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select distinct( YEAR(VisitedDate)) as 'yr' from Visitors", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        con.Close();
        if (dt.Rows.Count >= 0)
        {
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "yr";
            DropDownList1.DataValueField = "yr";
            DropDownList1.DataBind();
            //DropDownList1.Items.Insert(1, "2019");


            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = "yr";
            DropDownList2.DataValueField = "yr";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "Select Year");
        }
    }
    private void YearlyWise()
    {
        try
        {
            if (DropDownList1.SelectedItem.ToString() == "Select Year")
            { Chart1.Visible = false; }
            else
            {
                Chart1.Visible = true;
               string query = string.Format("select DATENAME(month,VisitedDate),count(id) from Visitors where ( YEAR(VisitedDate)) ='" + DropDownList1.SelectedItem.ToString() + "' group by DATENAME(month,VisitedDate)");
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
                //Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                Chart1.Legends[0].Enabled = true;
            }
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

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        YearlyWise();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select distinct( month(VisitedDate)) as 'months', DATENAME(month,VisitedDate) as 'mn' from Visitors where YEAR(VisitedDate)='" + DropDownList2.SelectedItem.ToString() + "'", con);
       //DATENAME(month,VisitedDate)
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        con.Close();
        if (dt.Rows.Count >= 0)
        {
            DropDownList3.DataSource = dt;
            DropDownList3.DataTextField = "mn";
            DropDownList3.DataValueField = "months";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, "Select Month");
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        MonthWise();
    }
    private void MonthWise()
    {
        try
        {
            if (DropDownList2.SelectedItem.ToString() == "Select Month")
            { Chart2.Visible = false; }
            else
            {
                Chart2.Visible = true;
                string query = string.Format("select day(VisitedDate),count(id) as 'Total' from Visitors where ( YEAR(VisitedDate) )='" + DropDownList2.SelectedItem.ToString() + "' and month(VisitedDate)='" + DropDownList3.SelectedValue.ToString() + "' group by VisitedDate order by VisitedDate");
                DataTable dt = GetData(query);
                string[] x = new string[dt.Rows.Count];
                int[] y = new int[dt.Rows.Count];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    x[i] = dt.Rows[i][0].ToString();
                    y[i] = Convert.ToInt32(dt.Rows[i][1]);
                }
                Chart2.Series[0].Points.DataBindXY(x, y);
                //Chart1.Series[0].ChartType = SeriesChartType.Doughnut;
                Chart2.Series[0].ChartType = SeriesChartType.Column;
                //Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                Chart2.Legends[0].Enabled = true;
            }
        }
        catch { }
    }
}