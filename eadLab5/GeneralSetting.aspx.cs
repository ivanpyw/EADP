using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eadLab5.DAL;

namespace eadLab5
{
    public partial class GeneralSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AdminNo"] != null)
                {
                    LblAdminNo.Text = Session["AdminNo"].ToString();
                    LblStudentName.Text = Session["SSStudentName"].ToString();
                    StudentProfile selTD = new StudentProfile();
                    StudentProfileDAO updTD = new StudentProfileDAO();
                    selTD = updTD.getStudentById(LblAdminNo.Text);
                    LblMedicalCondition.Text = selTD.MedicalCondition.ToString();
                    LblMedicalHistory.Text = selTD.MedicalHistory.ToString();
                    LblSummary.Text = selTD.Summary.ToString();
                    //LblHpNumber.Text = selTD.HpNumber.ToString();
                    LblEmail.Text = selTD.Email.ToString();
                }
            }
        }

        protected void BtnUpdate(object sender, EventArgs e)
        {
            //if(String.IsNullOrEmpty(LblMedicalCondition.Text) || String.IsNullOrEmpty(LblMedicalHistory.Text) || String.IsNullOrEmpty(LblSummary.Text) || String.IsNullOrEmpty(LblEmail.Text)){

            //}
            //else
            //{
            //    LblAdminNo.Text = Session["SSAdminNo"].ToString();
            //    Student selTD = new Student();
            //    StudentDAO updTD = new StudentDAO();
            //    int updCnt;
            //    updCnt = updTD.updateTD(LblAdminNo.Text, LblStudentName.Text, LblMedicalCondition.Text, LblMedicalHistory.Text, LblSummary.Text, LblEmail.Text);
            //    if (updCnt == 1)
            //    {
            //        LblResult.Text = "Profile has been changed!";
            //        LblResult.ForeColor = System.Drawing.Color.Black;
            //    }
            //}
            LblAdminNo.Text = Session["AdminNo"].ToString();
            StudentProfile selTD = new StudentProfile();
            StudentProfileDAO updTD = new StudentProfileDAO();
            int updCnt;
            updCnt = updTD.updateTD(LblAdminNo.Text, LblStudentName.Text, LblMedicalCondition.Text, LblMedicalHistory.Text, LblSummary.Text, LblEmail.Text);
            if (updCnt == 1)
            {
                LblResult.Text = "Profile has been changed!";
                LblResult.ForeColor = System.Drawing.Color.Black;
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfilePage.aspx");
        }

        protected void BtnDetails_Click(object sender, EventArgs e)
        {
            Session["AdminNo"] = LblAdminNo.Text.ToString();
            Response.Redirect("GeneralSetting.aspx");
        }

        protected void BtnAchievement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AchievementPage.aspx");
        }

        protected void BtnEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventPage.aspx");
        }

        protected void BtnPassword_Click(object sender, EventArgs e)
        {
            Session["AdminNo"] = LblAdminNo.Text.ToString();
            Response.Redirect("ChangePw.aspx");
        }
    }
}
