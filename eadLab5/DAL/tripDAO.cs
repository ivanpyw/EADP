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
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public List<Trip> getTrip()
        {
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
            if (rec_cnt > 0)
            {
                foreach (DataRow row in ds.Tables["tripTable"].Rows)
                {
                    Trip myTd = new Trip();

                    myTd.tripId = Convert.ToInt32(row["TripId"]);
                    myTd.tripTitle = row["TripTitle"].ToString();
                    myTd.tripLocation = row["Location"].ToString();
                    myTd.tripActivities = row["Activities"].ToString();
                    myTd.tripDays = Convert.ToInt32((Convert.ToDateTime(row["TripEnd"]).Subtract(Convert.ToDateTime(row["TripStart"])).TotalDays));
                    myTd.tripCost = Convert.ToInt16(row["Cost"]);
                    myTd.tripImg = row["Image"].ToString();
                    myTd.tripType = row["Trip type"].ToString();
                    myTd.tripStart = Convert.ToDateTime(row["TripStart"]);
                    myTd.tripEnd = Convert.ToDateTime(row["TripEnd"]);
                    myTd.tripStatus = row["Status"].ToString();
                    myTd.staffName = row["Name"].ToString();
                    myTd.staffHonorifics = row["Honorifics"].ToString();
                    myTd.tripOpen = Convert.ToDateTime(row["OpeningDay"]);
                    tdList.Add(myTd);
                }
            }
            else
            {
                tdList = null;
            }

            return tdList;
        }

        public int updateTrip(int id, string title,string location,string imgname, DateTime start, DateTime end, DateTime openingday, string activities, double cost,string type)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("UPDATE Trip");
            sqlStr.AppendLine("SET TripTitle = @pTitle,Location = @pLocation,Activities = @pActivities, OpeningDay =@pOpeningday, Cost = @pCost, TripStart = @pStart, TripEnd = @pEnd, [trip type] = @pType ");
            sqlStr.AppendLine("WHERE TripId = @pId");
            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);
            sqlCmd.Parameters.AddWithValue("@pId", id);
            sqlCmd.Parameters.AddWithValue("@pTitle", title);
            sqlCmd.Parameters.AddWithValue("@pLocation", location);
            sqlCmd.Parameters.AddWithValue("@pImg", imgname);
            sqlCmd.Parameters.AddWithValue("@pStart", start);
            sqlCmd.Parameters.AddWithValue("@pEnd", end);
            sqlCmd.Parameters.AddWithValue("@pOpeningday", openingday);
            sqlCmd.Parameters.AddWithValue("@pActivities", activities);
            sqlCmd.Parameters.AddWithValue("@pCost", cost);
            sqlCmd.Parameters.AddWithValue("@pType", type);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public int insertTrip(string location, string tripImage, string title, DateTime start, DateTime end, DateTime openingDay, string activities, double cost, string triptype)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("INSERT INTO Trip(Location,Image,TripTitle,OpeningDay,TripStart,TripEnd,Activities,cost,[Trip type],status,staffId)");
            sqlStr.AppendLine("VALUES (@pLocation,@pImage,@pTitle,@pOpeningDay,@pStart,@pEnd,@pActivities,@pCost,@pType,'pending',1)");

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@pTitle", title);
            sqlCmd.Parameters.AddWithValue("@pOpeningDay", openingDay);
            sqlCmd.Parameters.AddWithValue("@pStart", start);
            sqlCmd.Parameters.AddWithValue("@pEnd", end);
            sqlCmd.Parameters.AddWithValue("@pActivities", activities);
            sqlCmd.Parameters.AddWithValue("@pCost", cost);
            sqlCmd.Parameters.AddWithValue("@pLocation", location);
            sqlCmd.Parameters.AddWithValue("@pType", triptype);
            sqlCmd.Parameters.AddWithValue("@pImage", tripImage);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();
            return result;
        }
    }
}