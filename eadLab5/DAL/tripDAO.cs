using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace eadLab5.DAL
{
    public class TripDAO
    {
        public int count = 0;

        public List<Trip> getTrip()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            List<Trip> tdList = new List<Trip>();

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            StringBuilder tripCommand = new StringBuilder();
            tripCommand.AppendLine("Select * from Trip t");
            tripCommand.AppendLine("INNER JOIN Staff s on s.StaffId = t.StaffId ");
            Trip obj = new Trip();

            SqlConnection myConn = new SqlConnection(DBConnect);
            da = new SqlDataAdapter(tripCommand.ToString(), myConn);
            da.Fill(ds, "tripTable");

            int rec_cnt = ds.Tables["tripTable"].Rows.Count;
            count = rec_cnt;
            if (rec_cnt > 0){
                foreach (DataRow row in ds.Tables["tripTable"].Rows)
                {
                    Trip myTd = new Trip();

                    myTd.tripId = Convert.ToInt32(row["TripId"]);
                    myTd.tripTitle = row["TripTitle"].ToString();
                    myTd.tripLocation = row["Location"].ToString();
                    myTd.tripActivities = row["Activities"].ToString();
                    myTd.tripDays = Convert.ToInt32(row["Days"]);
                    myTd.tripCost = Convert.ToInt16(row["Cost"]);
                    myTd.tripImg = row["Image"].ToString();
                    myTd.tripType = row["Trip type"].ToString();
                    myTd.tripStart = Convert.ToDateTime(row["TripStart"]);
                    myTd.tripEnd = Convert.ToDateTime(row["TripEnd"]);
                    myTd.tripStatus = row["Status"].ToString();
                    myTd.staffName = row["Name"].ToString();
                    myTd.staffHonorifics = row["Honorifics"].ToString();
                    tdList.Add(myTd);
                }
            }else
            {
                tdList = null;
            }

            return tdList;
        }

        public 
    }
}