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
            TripDAO TripDAO = new TripDAO();
            List<Trip> TripList = new List<Trip>();
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            TripList = TripDAO.GetRegisteredList(tripId);
            GridViewRegistered.DataSource = TripList;
            GridViewRegistered.DataBind();
        }
    }
}