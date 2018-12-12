using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class TripDetails : System.Web.UI.Page
    {

        protected int count = 0;
        protected List<Trip> tripObj = null;
        TripDAO tripDao = new TripDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            tripObj = tripDao.getTrip();
            count = tripDao.count;
        }

        protected void AllowEdit(object sender, EventArgs e)
        {
            tbActivities.ReadOnly = false;
            tbCost.ReadOnly = false;
            tbDays.ReadOnly = false;
            tbFrequency.ReadOnly = false;
            tbTitle.ReadOnly = false;
            UpdateBtn.Enabled = true;
        }

        protected void UpdateTrip(object sender, EventArgs e)
        {

        }
    }
}