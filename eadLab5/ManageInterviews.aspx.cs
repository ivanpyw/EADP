using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    }
}