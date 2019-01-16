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
            if (!IsPostBack)
            {
                FeedbackFormDAO tdDAO = new FeedbackFormDAO();
                List<FeedbackForm> tdList = new List<FeedbackForm>();
                tdList = tdDAO.GetAllFeedBack();
                GridView_GetFB.DataSource = tdList;
                GridView_GetFB.DataBind();
            }

        }

        protected void GridView_GetFB_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView_GetFB.SelectedRow;
            // In this grid, the first cell (index 0) contains
            // the TD Account.

            Session["FeedBackId"] = row.Cells[0].Text;
            Response.Redirect("StaffViewSpecificFeedBack.aspx");
        }

        protected void CountryFilterDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            FeedbackFormDAO tdDAO = new FeedbackFormDAO();
            List<FeedbackForm> tdList = new List<FeedbackForm>();
            DateTime startD = DateTime.Parse(txtDateCheckStart.Text);
            DateTime endD = DateTime.Parse(txtDateCheckEnd.Text);
            tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), startD, endD);
            GridView_GetFB.DataSource = tdList;
            GridView_GetFB.DataBind();
        }

        protected void AffordabilityFilterDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            FeedbackFormDAO tdDAO = new FeedbackFormDAO();
            List<FeedbackForm> tdList = new List<FeedbackForm>();
            DateTime startD = DateTime.Parse(txtDateCheckStart.Text);
            DateTime endD = DateTime.Parse(txtDateCheckEnd.Text);
            tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), startD, endD);
            GridView_GetFB.DataSource = tdList;
            GridView_GetFB.DataBind();
        }

        protected void FreedomFilterDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            FeedbackFormDAO tdDAO = new FeedbackFormDAO();
            List<FeedbackForm> tdList = new List<FeedbackForm>();
            DateTime startD = DateTime.Parse(txtDateCheckStart.Text);
            DateTime endD = DateTime.Parse(txtDateCheckEnd.Text);
            tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), startD, endD);
            GridView_GetFB.DataSource = tdList;
            GridView_GetFB.DataBind();
        }
        

        protected void txtDateCheckEnd_TextChanged(object sender, EventArgs e)
        {
            FeedbackFormDAO tdDAO = new FeedbackFormDAO();
            List<FeedbackForm> tdList = new List<FeedbackForm>();
            DateTime startD = DateTime.Parse(txtDateCheckStart.Text);
            DateTime endD = DateTime.Parse(txtDateCheckEnd.Text);
            tdList = tdDAO.GetFilteredFeedBacks(CountryFilterDropDown.SelectedValue.ToString(), AffordabilityFilterDropDown.SelectedValue.ToString(), FreedomFilterDropDown.SelectedValue.ToString(), startD, endD);
            GridView_GetFB.DataSource = tdList;
            GridView_GetFB.DataBind();
        }
    }
}