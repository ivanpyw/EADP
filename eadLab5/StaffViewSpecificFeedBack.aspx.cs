using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace eadLab5
{
    public partial class StaffViewSpecificFeedBack : System.Web.UI.Page
    {
        string str = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            FeedbackForm cusObj = new FeedbackForm();
            FeedbackFormDAO cusDao = new FeedbackFormDAO();
            str = Convert.ToString(Session["FeedBackId"].ToString());
            cusObj = cusDao.GetSpecificFeedBack(str);
            if (cusObj != null)
            {  
                AffordablitityLabel.Text = cusObj.Affordability;
                CountryLabel.Text = cusObj.Enjoyment;
                DownsidesLabel.Text = cusObj.ReviewCons;
                NameLabel.Text = cusObj.StudentName;
                HighlightsLabel.Text = cusObj.ReviewPros;
                AdminLabel.Text = cusObj.AdminNo;
                EnjoymentLabel.Text = cusObj.Enjoyment;
                Freedom.Text = cusObj.Freedom;
                ImprovementsLabel.Text = cusObj.ReviewImprovement;
            }
        }
    }
}