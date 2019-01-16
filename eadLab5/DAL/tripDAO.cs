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
        public List<Trip> getTrip(string tripType)
        {
            List<Trip> tdList = new List<Trip>();

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            StringBuilder tripCommand = new StringBuilder();
            tripCommand.AppendLine("Select * from Trip t");
            tripCommand.AppendLine("INNER JOIN Staff s on s.StaffId = t.StaffId ");
            if(tripType == null)
                tripCommand.AppendLine("WHERE TripType = '' OR 1=1 AND Status <> 'Cancelled'");
            else
                tripCommand.AppendLine("WHERE TripType = '" + tripType + "' AND Status <> 'Cancelled'");
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
                    myTd.tripType = row["TripType"].ToString();
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
            sqlStr.AppendLine("SET TripTitle = @pTitle,Location = @pLocation,Activities = @pActivities, OpeningDay =@pOpeningday, Cost = @pCost, TripStart = @pStart, TripEnd = @pEnd, TripType = @pType ");
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

        public List<int> getSignedUpTrip(string AdminNo)
        {
            List<int> listId = new List<int>();
            listId.Add(0);
            if(AdminNo == null)
            {
                return listId;
            }else
            {
                SqlConnection myConn = new SqlConnection(DBConnect);
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine("SELECT TripId from Register");
                sqlCommand.AppendLine("WHERE adminNo = @pAdminNo ");
                SqlDataAdapter da = new SqlDataAdapter(sqlCommand.ToString(), myConn);
                da.SelectCommand.Parameters.AddWithValue("@pAdminNo", AdminNo);
                DataSet ds = new DataSet();
                da.Fill(ds, "Trip");
                int tripRow = ds.Tables["Trip"].Rows.Count;
                for (int i = 0; i < tripRow; i++)
                {
                    DataRow row3 = ds.Tables["Trip"].Rows[i];
                    foreach (DataColumn column in ds.Tables["Trip"].Columns)
                    {
                        listId.Add(Convert.ToInt32(row3[column]));

                    }
                }
                return listId;
            }
        }

        public int insertTrip(string location, string tripImage, string title, DateTime start, DateTime end, DateTime openingDay, string activities, double cost, string triptype)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("INSERT INTO Trip(Location,Image,TripTitle,OpeningDay,TripStart,TripEnd,Activities,cost,TripType,status,staffId)");
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

        public int assignStudentToTrip(int tripId, string AdminNo)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("INSERT INTO REGISTER(TripId, AdminNo)");
            sqlStr.AppendLine("VALUES (@pTripId,@pAdminNo)");

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@pTripId",tripId);
            sqlCmd.Parameters.AddWithValue("@pAdminNo", AdminNo);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();
            return result;
        }

        public List<String> getCountry()
        {
            List<String> country = new List<string>();
            SqlConnection myConn = new SqlConnection(DBConnect);
            StringBuilder sqlCommand = new StringBuilder();
            sqlCommand.AppendLine("select CountryName from country");
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand.ToString(), myConn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Country");
            List<string> cName = new List<string>();
            int countryRow = ds.Tables["Country"].Rows.Count;
            for (int i = 0; i < countryRow; i++)
            {
                DataRow row3 = ds.Tables["Country"].Rows[i];
                foreach (DataColumn column in ds.Tables["Country"].Columns)
                {
                    country.Add(row3[column].ToString());

                }
            }
            return country;
        }

        public int delTrip(int id)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("UPDATE Trip");
            sqlStr.AppendLine("SET Status = 'Cancelled'");
            sqlStr.AppendLine("WHERE TripId = @pId");
            SqlConnection myConn = new SqlConnection(DBConnect);
            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);
            sqlCmd.Parameters.AddWithValue("@pId", id);
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public Trip getTripById(int id)
        {
            Trip tripDetails = new DAL.Trip();
            DataSet ds = new DataSet();
            DataTable tdData = new DataTable();

            StringBuilder sqlStr = new StringBuilder();
            sqlStr.AppendLine("SELECT * FROM Trip");
            sqlStr.AppendLine("where TripId = @pTripId");

            SqlConnection myConn = new SqlConnection(DBConnect);
            SqlDataAdapter da = new SqlDataAdapter(sqlStr.ToString(), myConn);

            da.SelectCommand.Parameters.AddWithValue("pTripId", id);
            da.Fill(ds, "TripTable");

            int rec_cnt = ds.Tables["TripTable"].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables["TripTable"].Rows[0];
                tripDetails.tripTitle = row["TripTitle"].ToString();
                tripDetails.tripLocation = row["Location"].ToString();
                tripDetails.tripImg = row["Image"].ToString();
                tripDetails.tripStart = Convert.ToDateTime(row["TripStart"]);
                tripDetails.tripEnd = Convert.ToDateTime(row["TripEnd"]);
                tripDetails.tripOpen = Convert.ToDateTime(row["OpeningDay"]);
                tripDetails.tripActivities = row["Activities"].ToString();
                tripDetails.tripCost = Convert.ToInt16(row["Cost"]);
                tripDetails.tripType = row["TripType"].ToString();
            }else
            {
                tripDetails = null;
            }
            return tripDetails;
        }

        public List<Trip> GetRegisteredList(int TripId)
        {
            // Step 2 : declare a list to hold collection of customer's timeDeposit
            //           DataSet instance and dataTable instance 

            List<Trip> tdList = new List<Trip>();
            DataSet ds = new DataSet();
            DataTable tdData = new DataTable();
            //
            // Step 3 :Create SQLcommand to select all columns from TDMaster by parameterised customer id
            //          where TD is not matured yet

            StringBuilder sqlStr = new StringBuilder();
            sqlStr.AppendLine("SELECT * From Register");
            sqlStr.AppendLine("where TripId = @paraTripId");



            // Step 4 :Instantiate SqlConnection instance and SqlDataAdapter instance

            SqlConnection myConn = new SqlConnection(DBConnect);
            SqlDataAdapter da = new SqlDataAdapter(sqlStr.ToString(), myConn);

            // Step 5 :add value to parameter 

            da.SelectCommand.Parameters.AddWithValue("paraTripId", TripId);

            // Step 6: fill dataset
            da.Fill(ds, "TableTD");

            // Step 7: Iterate the rows from TableTD above to create a collection of TD
            //         for this particular customer 

            int rec_cnt = ds.Tables["TableTD"].Rows.Count;
            if (rec_cnt > 0)
            {
                foreach (DataRow row in ds.Tables["TableTD"].Rows)
                {
                    Trip myTD = new Trip();

                    // Step 8 Set attribute of timeDeposit instance for each row of record in TableTD

                    myTD.RegisterId = Convert.ToInt32(row["RegisterId"]);
                    myTD.TripId = Convert.ToInt32(row["TripId"]);
                    myTD.AdminNo = row["AdminNo"].ToString();
                    myTD.Reasons = row["Reasons"].ToString();
                    myTD.StaffId = Convert.ToInt32(row["StaffId"]);
                   

                    //  Step 9: Add each timeDeposit instance to array list
                    tdList.Add(myTD);
                }
            }
            else
            {
                tdList = null;
            }

            return tdList;
        }
    }


}