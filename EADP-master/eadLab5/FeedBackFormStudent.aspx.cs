using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eadLab5.DAL;

namespace eadLab5
{
    public partial class FeedBackFormStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            String Affordability = AffordabilityDropDown.SelectedValue.ToString();
            String Enjoyment = EnjoymentDropDown.SelectedValue.ToString();
            String Freedom = FreedomDropBox.SelectedValue.ToString();
            String ReviewPros = HighlightTb.Text.ToString();
            String ReviewCons = DownsidesTb.Text.ToString();
            String ReviewImprovement = ImprovementTb.Text.ToString();
            int TripId = 1;
            String StudName = "Ivan";
            String AdminNo = "171058L";
            String Country = "Beijing";
        
         try
            {
                
        FeedbackFormDAO FBF = new FeedbackFormDAO();
        int insCnt = FBF.InsertTD(Affordability, Enjoyment, Freedom, ReviewPros, ReviewCons, ReviewCons, StudName, Country, AdminNo, TripId);
                if (insCnt == 1)
                {
                    LblResult.Text = "Feedback Submitted! Thank you!";
                }
                else
                {
                    LblResult.Text = "Unable to submit feedback, please inform system administrator!";

                }
            BtnConfirm.Enabled = false;

            }
            catch (FormatException)
            {
               
            }

        }
    }
}