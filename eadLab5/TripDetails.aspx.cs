using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.IO;
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


        string SaveFile(HttpPostedFile file)
        {
            string savePath = "../Images/";
            //string filename = file.FileName + DateTime.Now.ToString("ddmmyyyyfffffff");
            string filename = Path.GetFileNameWithoutExtension(file.FileName);
            string ext = Path.GetExtension(file.FileName);
            savePath += filename + DateTime.Now.ToString("ddmmyyyyfffffff") + ext;
            string fullPath = Path.Combine(Server.MapPath("~/Images"), savePath);
            file.SaveAs(fullPath);
            return savePath;
        }

        protected void AllowEdit(object sender, EventArgs e)
        {
            tbActivities.ReadOnly = false;
            tbCost.ReadOnly = false;
            tbDays.ReadOnly = false;
            tbStart.ReadOnly = false;
            tbEnd.ReadOnly = false;
            tbTitle.ReadOnly = false;
            tbId.ReadOnly = false;
            UpdateBtn.Enabled = true;
        }

        protected void UpdateTrip(object sender, EventArgs e)
        {
            TripDAO updTd = new TripDAO();
            int id = Convert.ToInt32(tbId.Text);
            System.Diagnostics.Debug.WriteLine(id+"this is id");
            string tripTitle = tbTitle.Text;
            System.Diagnostics.Debug.WriteLine(tripTitle + "this is title");
            DateTime tripStart = Convert.ToDateTime(tbStart.Text);
            //LOOK AT THIS SHIT, TRIPSTART WORKS BUT END DOESNT
            System.Diagnostics.Debug.WriteLine(tbStart.Text);
            DateTime tripEnd = Convert.ToDateTime(tbEnd.Text);
            System.Diagnostics.Debug.WriteLine(tripEnd);
            int tripDays = Convert.ToInt32(tbDays.Text);
            string tripActivities = tbActivities.Text;
            double tripCost = Convert.ToInt16(tbCost.Text);
            System.Diagnostics.Debug.WriteLine(tbCost.Text+"This is cost");
            int results = updTd.updateTrip(id,tripTitle,tripStart,tripEnd,tripDays,tripActivities,tripCost);
        }

        protected void addTrip(object sender, EventArgs e)
        {
            TripDAO addTD = new DAL.TripDAO();
            if (tripImageUpload.HasFile)
            {
                
                int results = addTD.insertTrip(tbAddLocation.Text, SaveFile(tripImageUpload.PostedFile).ToString(), tbAddTitle.Text, Convert.ToDateTime(tbAddStart.Text), Convert.ToDateTime(tbAddEnd.Text), Convert.ToDateTime(tbOpenDay.Text), tbAddActivities.Text, Convert.ToInt16(tbAddCost.Text), DdlAddTripType.SelectedItem.Text);
                Response.Redirect("TripDetails.aspx");
            }
            else
            {
                //add validations? later la
            }
        }
    }
}