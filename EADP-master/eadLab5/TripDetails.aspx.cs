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