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

        protected void GridActionRegistered(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string IDOFPAGE = row.Cells[0].Text;
            if (e.CommandName == "Shortlist")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateShortlisted(IDOFPAGE, tripId);
                

            }
            else if (e.CommandName == "Norminate")
            {

            }
            else if (e.CommandName == "WaitingList")
            {

            }
        }

        protected void GridActionNorminate(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewNorminated.SelectedRow;
            ID = row.Cells[0].Text;
            if (e.CommandName == "UnNorminate")
            {

            }
            else if (e.CommandName == "Shortlist")
            {

            }
           
        }
        protected void GridActionShortlist(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewShortlisted.SelectedRow;
            ID = row.Cells[0].Text;
            if (e.CommandName == "Move to waiting list")
            {

            }
            else if (e.CommandName == "Move to pending")
            {

            }
           
        }
        protected void GridActionWaitingList(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewWaitingList.SelectedRow;
            ID = row.Cells[0].Text;
            if (e.CommandName == "Shortlist")
            {

            }
            else if (e.CommandName == "Move to pending")
            {

            }

        }
    }
}