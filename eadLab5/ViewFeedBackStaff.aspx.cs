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

        protected void FilterBtn_Click(object sender, EventArgs e)
        {
            if (CountryFilterDropDown.SelectedIndex > 0 && AffordabilityFilterDropDown.SelectedIndex > 0)
            {
                FeedbackFormDAO tdDAO = new FeedbackFormDAO();
                List<FeedbackForm> tdList = new List<FeedbackForm>();
                tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), txtDateCheckStart.Text, txtDateCheckEnd.Text);
                GridView_GetFB.DataSource = tdList;
                GridView_GetFB.DataBind();
            }
            else if (CountryFilterDropDown.SelectedIndex < 0 && AffordabilityFilterDropDown.SelectedIndex > 0)
            {
                FeedbackFormDAO tdDAO = new FeedbackFormDAO();
                List<FeedbackForm> tdList = new List<FeedbackForm>();
                tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), txtDateCheckStart.Text, txtDateCheckEnd.Text);
                GridView_GetFB.DataSource = tdList;
                GridView_GetFB.DataBind();
            }
            else if (CountryFilterDropDown.SelectedIndex > 0 && AffordabilityFilterDropDown.SelectedIndex < 0)
            {
                FeedbackFormDAO tdDAO = new FeedbackFormDAO();
                List<FeedbackForm> tdList = new List<FeedbackForm>();
                tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), txtDateCheckStart.Text, txtDateCheckEnd.Text);
                GridView_GetFB.DataSource = tdList;
                GridView_GetFB.DataBind();
            }
            else
            {
                FeedbackFormDAO tdDAO = new FeedbackFormDAO();
                List<FeedbackForm> tdList = new List<FeedbackForm>();
                tdList = tdDAO.GetAllFeedBack();
                GridView_GetFB.DataSource = tdList;
                GridView_GetFB.DataBind();
                LabelFilter.Visible = true;
                LabelFilter.Text = "Please select a valid index in the dropdown above";
            }

        }

       
    }
}