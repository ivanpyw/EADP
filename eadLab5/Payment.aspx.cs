using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminNo"] == null)
            {
                Response.Redirect("loginStudent.aspx");
            }
        }

        protected void btn_Payment_Click(object sender, EventArgs e)
        {
            Response.Redirect("paymentFurther.aspx");
        }
    }
}