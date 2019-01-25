using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class OverseasRegisteredList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TripDAO TripDAO = new TripDAO();
                List<Trip> TripList = new List<Trip>();
                int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
                TripList = TripDAO.GetRegisteredList(tripId);
                GridViewRegistered.DataSource = TripList;
                GridViewRegistered.DataBind();

                TripList = TripDAO.GetShortlisted(tripId);
                GridViewShortlisted.DataSource = TripList;
                GridViewShortlisted.DataBind();

                TripList = TripDAO.GetNorminated(tripId);
                GridViewNorminated.DataSource = TripList;
                GridViewNorminated.DataBind();

                TripList = TripDAO.GetWaitingList(tripId);
                GridViewWaitingList.DataSource = TripList;
                GridViewWaitingList.DataBind();
            }
           
        }

        //protected void GridActionRegistered(object sender, GridViewCommandEventArgs e)
        //{
        //    int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
        //    GridViewRow row = GridViewRegistered.SelectedRow;
        //    string IDOFPAGE = row.Cells[0].Text;
        //    if (e.CommandName == "Shortlist")
        //    {
        //        TripDAO TripDAO = new TripDAO();
        //        Trip TripList = new Trip();
        //        int TRIPPYLIST;
        //        TRIPPYLIST = TripDAO.updateShortlisted(IDOFPAGE, tripId);
                

        //    }
        //    else if (e.CommandName == "Norminate")
        //    {

        //    }
        //    else if (e.CommandName == "WaitingList")
        //    {

        //    }
        //}

        protected void GridActionRegistered(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();
            int staffId = Convert.ToInt32(Session["StaffId"]);

            if (e.CommandName == "Shortlist")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateShortlisted(RegisterID, tripId);
                InterviewDAO intDao = new InterviewDAO();
                string adminNo = intDao.exchangeRegIdForAdminNo(RegisterID);
                int updateStuds = intDao.selectForInterview(adminNo, staffId, tripId );
                Response.Redirect(Request.RawUrl);

            }
            else if (e.CommandName == "Norminate")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateNorminate(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else if (e.CommandName == "Move to waiting list")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateWaitingList(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                return;
            }
        }




        protected void GridActionNorminate(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();


            if (e.CommandName == "UnNorminate")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateRegistered(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);

            }
            else if (e.CommandName == "Shortlist")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateShortlisted(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
           
            else
            {
                return;
            }

        }
        protected void GridActionShortlist(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();

            if (e.CommandName == "Move to waiting list")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateWaitingList(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else if (e.CommandName == "Move to pending")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateRegistered(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
           
        }
        protected void GridActionWaitingList(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();
            if (e.CommandName == "Shortlist")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateShortlisted(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else if (e.CommandName == "Move to pending")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateRegistered(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }

        }

        protected void Chart3_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewWaitingList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}