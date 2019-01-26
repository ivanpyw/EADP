﻿using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class ManageInterviews : System.Web.UI.Page
    {
        protected List<Interview> interviewList = new List<Interview>();
        Interview interview = new Interview();
        InterviewDAO interviewDao = new InterviewDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            interviewList = interviewDao.retrieveInterview();
        }

        [WebMethod]
        public static string emailStudent(string emailDate, string emailTime,string intId)
        {
            System.Diagnostics.Debug.WriteLine(emailDate + " this is tripId@@@ ");
            System.Diagnostics.Debug.WriteLine(emailTime + " this is adminNo@@@ ");
            InterviewDAO interviewDao = new InterviewDAO();
            interviewDao.insertDateTime(intId,emailDate, emailTime);
            string adminNo = interviewDao.exchangeRegIdForAdminNo(intId);
            SmtpClient client = new SmtpClient();
            client.Port = 25;
            client.Host = "smtp-mail.outlook.com";
            client.EnableSsl = true;
            client.Timeout = 10000;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("sarasaeadp@outlook.com", "msJasmine1");
            string recipient = adminNo + "@mymail.nyp.edu.sg";
            MailMessage mail = new MailMessage("sarasaeadp@outlook.com", recipient);
            mail.Subject = "You are scheduled for an interview!";
            mail.Body = "The interview will be on "+emailDate+", "+emailTime;
            client.Send(mail);

            return emailDate;
        }
    }
}