using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class PEMMain : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentLogin stuObj = new StudentLogin();
            StudentLoginDAO stuDao = new StudentLoginDAO();
            //stuObj = stuDao.getStudentByPEM(Session["PEMClass"].ToString());
        }
    }
}
