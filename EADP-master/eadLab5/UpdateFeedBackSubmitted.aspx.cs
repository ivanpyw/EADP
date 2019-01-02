using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class UpdateFeedBackSubmitted : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            FeedbackForm selTD = new FeedbackForm();
            FeedbackFormDAO updTD = new FeedbackFormDAO();
            int updCnt;
            
            updCnt = updTD.updateOwnFB(AffordabilityDropDownUpdate.SelectedValue.ToString(), EnjoymentDropDownUpdate.SelectedValue.ToString(), FreedomDropBoxUpdate.SelectedValue.ToString()
            , HighlightTbUpdate.Text, DownsidesTbUpdate.Text, ImprovementTbUpdate.Text,"Ivan", "Australia","171058L", "1", "4");
            if (updCnt == 1)
            {
                LblResult.Text = "Feedback has been changed!";
                LblResult.ForeColor = System.Drawing.Color.Black;
            }

        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewFeedBackSubmitted.aspx");
        }
    }
}