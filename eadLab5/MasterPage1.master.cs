using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class MasterPage1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if ((!(Session["role"]).Equals(null)) && (!(Session["role"]).Equals(""))){ 
            //string roleformasterpage = Session["role"].ToString();
         //}
        }

        protected void btnStaffLogOut_Click(object sender, EventArgs e)
        {
            Session["Staffid"] = null;
            Session["role"] = null;
        }

        protected void btnStudentLogOut_Click(object sender, EventArgs e)
        {
            Session["AdminNo"] = null;
            Session["role"] = null;
        }
    }
}
