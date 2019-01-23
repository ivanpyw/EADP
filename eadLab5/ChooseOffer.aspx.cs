using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace eadLab5
{
    public partial class ChooseOffer : System.Web.UI.Page
    {
        protected string tripName = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Trip tripClass = new Trip();
            TripDAO tripObj = new TripDAO();
            if (Session["AdminNo"] == null)
            {
                Response.Redirect("loginStudent.aspx");
            }else
            {
                Choice choice = tripObj.checkOffer(Session["AdminNo"].ToString());
                System.Diagnostics.Debug.WriteLine(choice.choice != null,"this is from chooseOffer");
                if(choice == null || choice.choice == "Accepted" || choice.choice =="rejected")
                {
                    Response.Redirect("~Oops.aspx");
                }
                tripName = choice.tripName;
            }

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Trip tripClass = new Trip();
            TripDAO tripObj = new TripDAO();
            tripObj.chooseOffer("Accepted",Session["AdminNo"].ToString());
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Trip tripClass = new Trip();
            TripDAO tripObj = new TripDAO();
            tripObj.chooseOffer("Rejected", Session["AdminNo"].ToString());
        }
    }
}