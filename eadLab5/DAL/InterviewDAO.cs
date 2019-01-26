﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace eadLab5.DAL
{
    public class InterviewDAO
    {
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public List<Interview> retrieveInterview()
        {
            List<Interview> interviews = new List<Interview>();

            SqlDataAdapter da;
            DataSet ds = new DataSet();
            StringBuilder tripCommand = new StringBuilder();
            tripCommand.AppendLine("Select * from Interview i");
            tripCommand.AppendLine("INNER JOIN Trip t on t.TripId = i.TripId");
            tripCommand.AppendLine("INNER JOIN Student s on s.AdminNo = i.AdminNo ");
            tripCommand.AppendLine("WHERE StudentStatus = 'Pending'");
            SqlConnection myConn = new SqlConnection(DBConnect);
            da = new SqlDataAdapter(tripCommand.ToString(), myConn);
            da.Fill(ds, "interviewTable");

            int rec_cnt = ds.Tables["interviewTable"].Rows.Count;
            if (rec_cnt > 0)
            {
                foreach (DataRow row in ds.Tables["interviewTable"].Rows)
                {
                    Interview myInt = new Interview();
                    myInt.studentName = row["StudentName"].ToString();
                    myInt.studentPic = row["ProfilePicture"].ToString();
                    myInt.tripName = row["TripTitle"].ToString();
                    myInt.tripEnd = Convert.ToDateTime(row["TripEnd"]);
                    myInt.tripStart = Convert.ToDateTime(row["TripStart"]);
                    myInt.tripLocation = row["Location"].ToString();
                    myInt.interviewId = Convert.ToInt32(row["InterviewId"]);
                    myInt.interviewDate = row["interviewDate"].ToString();
                    myInt.interviewTime = row["interviewTime"].ToString();
                    interviews.Add(myInt);
                }
            }
            else
            {
                interviews = null;
            }
            return interviews;
        }

        public int selectForInterview(string adminNo,int staffId,int tripId)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("INSERT INTO Interview(StaffId,AdminNo,TripId,StudentStatus)");
            sqlStr.AppendLine("VALUES (@pStaffId,@pAdminNo,@pTripId,'Pending')");
            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);
            sqlCmd.Parameters.AddWithValue("@pAdminNo", adminNo);
            sqlCmd.Parameters.AddWithValue("@pStaffId", staffId);
            sqlCmd.Parameters.AddWithValue("@pTripId", tripId);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public string exchangeRegIdForAdminNo(string RegId)
        {
            SqlConnection myConn = new SqlConnection(DBConnect);
            StringBuilder tripCommand = new StringBuilder();
            tripCommand.AppendLine("Select AdminNo from Register");
            tripCommand.AppendLine("WHERE RegisterId = @pRegisterId");

            SqlDataAdapter da = new SqlDataAdapter(tripCommand.ToString(), myConn);
            da.SelectCommand.Parameters.AddWithValue("@pRegisterId", RegId);
            DataSet ds = new DataSet();
            da.Fill(ds, "Trip");
            string adminNo = ds.Tables["Trip"].Rows[0][0].ToString();
            return adminNo;
        }

        public int insertDateTime(string intId,string date, string time)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("UPDATE Interview");
            sqlStr.AppendLine("SET interviewDate=@pDate,interviewTime=@pTime");
            sqlStr.AppendLine("WHERE InterviewId = @pIntId");
            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);
            sqlCmd.Parameters.AddWithValue("@pIntId", intId);
            sqlCmd.Parameters.AddWithValue("@pDate", date);
            sqlCmd.Parameters.AddWithValue("@pTime", time);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public int createSession(string session,string token, int intId)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();

            sqlStr.AppendLine("UPDATE Interview");
            sqlStr.AppendLine("SET interviewToken=@pIntToken,interviewSession=@pIntSession");
            sqlStr.AppendLine("WHERE InterviewId = @pIntId");
            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);
            sqlCmd.Parameters.AddWithValue("@pIntId", intId);
            sqlCmd.Parameters.AddWithValue("@pIntSession", session);
            sqlCmd.Parameters.AddWithValue("@pIntToken", token);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public List<Interview> fetchSession(string adminNo)
        {
            List<Interview> intSession = new List<Interview>();

            SqlConnection myConn = new SqlConnection(DBConnect);
            StringBuilder tripCommand = new StringBuilder();
            tripCommand.AppendLine("Select interviewSession,interviewToken from Interview");
            tripCommand.AppendLine("WHERE AdminNo = @pAdminNo");

            SqlDataAdapter da = new SqlDataAdapter(tripCommand.ToString(), myConn);
            da.SelectCommand.Parameters.AddWithValue("@pAdminNo", adminNo);
            DataSet ds = new DataSet();
            da.Fill(ds, "interviewTable");
            int rec_cnt = ds.Tables["interviewTable"].Rows.Count;
            if (rec_cnt > 0)
            {
                foreach (DataRow row in ds.Tables["interviewTable"].Rows)
                {
                    Interview myInt = new Interview();
                    myInt.interviewSession = row["interviewSession"].ToString();
                    myInt.interviewToken = row["interviewToken"].ToString();
                    intSession.Add(myInt);
                }
            }
            else
            {
                intSession = null;
            }
            return intSession;
        }
    }
}