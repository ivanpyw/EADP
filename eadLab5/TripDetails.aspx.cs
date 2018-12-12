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
        protected void Page_Load(object sender, EventArgs e)
        {
            TripDAO tripDao = new TripDAO();   
            tripObj = tripDao.getTrip();
            count = tripDao.count;
        }
    }
}