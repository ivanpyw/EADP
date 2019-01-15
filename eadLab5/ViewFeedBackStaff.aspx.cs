using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class ViewFeedBackStaff : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            FeedbackFormDAO tdDAO = new FeedbackFormDAO();
            List<FeedbackForm> tdList = new List<FeedbackForm>();
            tdList = tdDAO.GetAllFeedBack();
            GridView_GetFB.DataSource = tdList;
            GridView_GetFB.DataBind();
        }

        protected void GridView_GetFB_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView_GetFB.SelectedRow;
            // In this grid, the first cell (index 0) contains
            // the TD Account.

            Session["FeedBackId"] = row.Cells[0].Text;
            Response.Redirect("StaffViewSpecificFeedBack.aspx");
        }

        public string flipDate(string originalD)
        {
            string nodate = " ";
            if (!originalD.Equals("")) {
                string year = originalD.Substring(0, 4);
                string month = originalD.Substring(5, 2);
                string day = originalD.Substring(8, 2);
                string newdate = day + "-" + month + "-" + year;
                return newdate;
            }
           
            return nodate;
        }
        protected void FilterBtn_Click(object sender, EventArgs e)
        {
           
                FeedbackFormDAO tdDAO = new FeedbackFormDAO();
                List<FeedbackForm> tdList = new List<FeedbackForm>();
                string startD = flipDate( txtDateCheckStart.Text);
                string endD = flipDate(txtDateCheckEnd.Text);                
                tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), startD, endD);
                GridView_GetFB.DataSource = tdList;
                GridView_GetFB.DataBind();
            
           

        }

       
    }
}