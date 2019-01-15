using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class ReportAndStatistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                buildBarChart("All", "All", "", "");
                buildPieChart("All");
                buildHorizontalChart("All");
                buildLineChart("All", "All");
            }
        }

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            string countryBarChart = CountryDropDown.SelectedValue.ToString();
            string type = TypeDropDown.SelectedValue.ToString();

            string dateStart = flipDate(DateStartRange.Text);
            string dateEnd = flipDate(DateEndRange.Text);

            buildBarChart(countryBarChart, type, dateStart, dateEnd);
        }

      

       public string flipDate(string originalD)
        {
            string noinput = "";
            if (originalD == "") {
                return noinput;
            }
            else
            {
                string year = originalD.Substring(0, 4);
                string month = originalD.Substring(5, 2);
                string day = originalD.Substring(8, 2);
                string newdate = day + "-" + month + "-" + year;
                return newdate;
            }

       }

        private void buildBarChart(string country, string type, string dateStart, string dateEnd)
        {
            String myConnect = ConfigurationManager.ConnectionStrings["EADPConnectionString2"].ToString();
            SqlConnection myConn = new SqlConnection(myConnect);

            DataSet ds = new DataSet();

            String strSQL = "SELECT location, avg(cost) as cost FROM [dbo].[Trip] ";

            if (!country.Equals("All"))
            {
                strSQL += "where location = @paraCountry ";
            }

            if (!type.Equals("All") && (!country.Equals("All")))
            {
                strSQL += "and triptype = @paratype ";

            }
            else if (!type.Equals("All") && (country.Equals("All")))
            {

                strSQL += "where triptype = @paratype ";
            }

            if ((!dateStart.Equals("") || (!dateEnd.Equals(""))) && (country.Equals("All")) && (type.Equals("All")))
            {
                strSQL += "where TRIPSTART BETWEEN @paradateStart and @paradateEnd ";

            }
            else if ((!dateStart.Equals("") || (!dateEnd.Equals(""))) && (!country.Equals("All")) && (type.Equals("All")))
            {
                strSQL += "and TRIPSTART BETWEEN @paradateStart and @paradateEnd ";

            }
            else if ((!dateStart.Equals("") || (!dateEnd.Equals(""))) && (country.Equals("All")) && (!type.Equals("All")))
            {
                strSQL += "and TRIPSTART BETWEEN @paradateStart and @paradateEnd ";
            }
            else if ((!dateStart.Equals("") || (!dateEnd.Equals(""))) && (!country.Equals("All")) && (!type.Equals("All")))
            {
                strSQL += "and TRIPSTART BETWEEN @paradateStart and @paradateEnd ";
            }


            strSQL += "group by location";

            SqlDataAdapter da = new SqlDataAdapter(strSQL.ToString(), myConn);

            if (!country.Equals("All"))
            {
                da.SelectCommand.Parameters.AddWithValue("@paraCountry", country);
            }

            if (!type.Equals("All"))
            {
                da.SelectCommand.Parameters.AddWithValue("@paratype", type);
            }

            if (!dateStart.Equals(""))
            {
                da.SelectCommand.Parameters.AddWithValue("@paradateStart", dateStart);
            }

            if (!dateEnd.Equals(""))
            {
                da.SelectCommand.Parameters.AddWithValue("@paradateEnd", dateEnd);
            }

            da.Fill(ds, "tripTable");

            Chart2.DataSource = ds;
            Chart2.DataBind();
        }

        private void buildPieChart(string country)
        {
            String myConnect = ConfigurationManager.ConnectionStrings["EADPConnectionString2"].ToString();
            SqlConnection myConn = new SqlConnection(myConnect);

            DataSet ds = new DataSet();
            
            String strSQL = "SELECT COUNT([Diploma]) NoOfStudents, [Diploma] FROM [Trip] o ";
            strSQL += "INNER JOIN [Student] S ON o.[TripId] = s.[TripId] ";

            if (!country.Equals("All"))
            {
                strSQL += "where location = @paraCountry ";
            }

            strSQL += "Group By [Diploma]";

            SqlDataAdapter da = new SqlDataAdapter(strSQL.ToString(), myConn);

            if (!country.Equals("All"))
            {
                da.SelectCommand.Parameters.AddWithValue("@paraCountry", country);
            }

            da.Fill(ds, "tripTable");

            Chart1.DataSource = ds;
            Chart1.DataBind();
        }

        private void buildLineChart(string Diploma, string StudentYear)
        {
            String myConnect = ConfigurationManager.ConnectionStrings["EADPConnectionString2"].ToString();
            SqlConnection myConn = new SqlConnection(myConnect);

            DataSet ds = new DataSet();

            String strSQL = "SELECT COUNT([adminno]) NoOfStudents, DATENAME(month, TripEnd) AS [Month]  FROM [Trip] o ";
            strSQL += "INNER JOIN [Student] S ON o.[TripId] = s.[TripId] ";

            if (!Diploma.Equals("All"))
            {
                strSQL += "where diploma = @paraDiploma ";
            }

            strSQL += "Group By TripEnd ";

            SqlDataAdapter da = new SqlDataAdapter(strSQL.ToString(), myConn);

            if (!Diploma.Equals("All"))
            {
                da.SelectCommand.Parameters.AddWithValue("@paraDiploma", Diploma);
            }

            da.Fill(ds, "tripTable");

            Chart3.DataSource = ds;
            Chart3.DataBind();
        }

        private void buildHorizontalChart(string StudentYear)
        {
            String myConnect = ConfigurationManager.ConnectionStrings["EADPConnectionString2"].ToString();
            SqlConnection myConn = new SqlConnection(myConnect);

            DataSet ds = new DataSet();

            String strSQL = "SELECT Count(AdminNo) NoOfStudents,Location FROM [Trip] O Inner join [Student] S on O.[TripId] = S.[TripId] ";
            strSQL += "Group By [Location] ";

            SqlDataAdapter da = new SqlDataAdapter(strSQL.ToString(), myConn);

            if (!StudentYear.Equals("All"))
            {
                da.SelectCommand.Parameters.AddWithValue("@paraStudentYear", StudentYear);
            }

            da.Fill(ds, "tripTable");

            Chart4.DataSource = ds;
            Chart4.DataBind();
        }

        protected void DropDownListCountryPieChart_SelectedIndexChanged(object sender, EventArgs e)
        {
            string countryPieChart = DropDownListCountryPieChart.SelectedValue.ToString();
            buildPieChart(countryPieChart);
        }
    }
}