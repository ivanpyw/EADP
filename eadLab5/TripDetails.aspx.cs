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
            List<String> countryList = tripDao.getCountry();
            ddlAddLocation.DataSource = countryList;
            ddlAddLocation.DataBind();
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
            tbUpdateActivities.ReadOnly = false;
            tbUpdateCost.ReadOnly = false;
            tbUpdateOpeningday.ReadOnly = false;
            tbUpdateStart.ReadOnly = false;
            tbUpdateEnd.ReadOnly = false;
            tbUpdateTitle.ReadOnly = false;
            tbId.ReadOnly = false;
            UpdateBtn.Enabled = true;
            tbUpdateLocation.ReadOnly = false;
            tripUploadImg.Enabled = true;
            DdlUpdateType.Enabled = true;
        }

        protected void UpdateTrip(object sender, EventArgs e)
        {
            TripDAO updTd = new TripDAO();
            int id = Convert.ToInt32(tbId.Text);
            System.Diagnostics.Debug.WriteLine(id + "this is id");
            string tripTitle = tbUpdateTitle.Text;
            string tripLocation = tbUpdateLocation.Text;
            string tripImgName = SaveFile(tripUploadImg.PostedFile).ToString();
            System.Diagnostics.Debug.WriteLine(tripTitle + "this is title");
            DateTime tripStart = Convert.ToDateTime(tbUpdateStart.Text);
            //LOOK AT THIS SHIT, TRIPSTART WORKS BUT END DOESNT
            System.Diagnostics.Debug.WriteLine(tbUpdateStart.Text);
            DateTime tripEnd = Convert.ToDateTime(tbUpdateEnd.Text);
            System.Diagnostics.Debug.WriteLine(tripEnd);
            DateTime tripOpeningDay = Convert.ToDateTime(tbUpdateOpeningday.Text);
            string tripActivities = tbUpdateActivities.Text;
            double tripCost = Convert.ToInt16(tbUpdateCost.Text);
            System.Diagnostics.Debug.WriteLine(tbUpdateCost.Text + "This is cost");
            string tripType = DdlUpdateType.SelectedValue;
            int results = updTd.updateTrip(id, tripTitle, tripLocation, tripImgName, tripStart, tripEnd, tripOpeningDay, tripActivities, tripCost, tripType);
            Response.Redirect("TripDetails.aspx");
        }

        protected void addTrip(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                TripDAO addTD = new DAL.TripDAO();
                if (tripImageUpload.HasFile)
                {

                    int results = addTD.insertTrip(ddlAddLocation.SelectedValue, SaveFile(tripImageUpload.PostedFile).ToString(), tbAddTitle.Text, Convert.ToDateTime(tbAddStart.Text), Convert.ToDateTime(tbAddEnd.Text), Convert.ToDateTime(tbOpenDay.Text), tbAddActivities.Text, Convert.ToInt16(tbAddCost.Text), DdlAddTripType.SelectedItem.Text);

                    Response.Redirect("TripDetails.aspx");
                }
                else
                {
                    //add validations? later la
                }
            }
        }
    }
}