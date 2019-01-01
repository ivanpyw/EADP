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
    public partial class EditTripDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                TripDAO tripDao = new TripDAO();
                List<String> countryList = tripDao.getCountry();
                ddlUpdateLocation.DataSource = countryList;
                ddlUpdateLocation.DataBind();
                int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
                Trip tripObj = tripDao.getTripById(tripId);
                if (tripObj == null)
                {
                    Response.Redirect("asd.aspx");
                }
                else
                {
                    tbUpdateTitle.Text = tripObj.tripTitle.ToString();
                    ddlUpdateLocation.SelectedValue = tripObj.tripLocation.ToString();
                    tripImage.ImageUrl = tripObj.tripImg.ToString();
                    tbUpdateStart.Text = tripObj.tripStart.ToString("yyyy-MM-dd");
                    tbUpdateEnd.Text = tripObj.tripEnd.ToString("yyyy-MM-dd");
                    tbUpdateOpeningday.Text = tripObj.tripOpen.ToString("yyyy-MM-dd");
                    tbUpdateActivities.Text = tripObj.tripActivities;
                    tbUpdateCost.Text = tripObj.tripCost.ToString();
                    DdlUpdateType.SelectedValue = tripObj.tripType.ToString();
                }
            }
        }

        protected void AllowEdit(object sender, EventArgs e)
        {
            tbUpdateActivities.ReadOnly = false;
            tbUpdateCost.ReadOnly = false;
            tbUpdateOpeningday.ReadOnly = false;
            tbUpdateStart.ReadOnly = false;
            tbUpdateEnd.ReadOnly = false;
            tbUpdateTitle.ReadOnly = false;
            UpdateBtn.Enabled = true;
            CancelBtn.Enabled = true;
            DelTrip.Enabled = true;
            ddlUpdateLocation.Enabled = true;
            tripUploadImg.Enabled = true;
            DdlUpdateType.Enabled = true;
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

        protected void UpdateTrip(object sender, EventArgs e)
        {
            TripDAO updTd = new TripDAO();
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            System.Diagnostics.Debug.WriteLine(tripId + "this is id");
            string tripTitle = tbUpdateTitle.Text;
            string tripLocation = ddlUpdateLocation.SelectedValue;
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
            int results = updTd.updateTrip(tripId, tripTitle, tripLocation, tripImgName, tripStart, tripEnd, tripOpeningDay, tripActivities, tripCost, tripType);
            Response.Redirect("TripDetails.aspx");
        }

        protected void DelTrip_Click(object sender, EventArgs e)
        {
            TripDAO delTD = new DAL.TripDAO();
            int id = 0;
            int results = delTD.delTrip(id);
            System.Diagnostics.Debug.WriteLine(id + "this is id");
            Response.Redirect("TripDetails.aspx");
        }
    }
}