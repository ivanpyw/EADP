using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eadLab5.DAL;

namespace eadLab5
{
    public partial class TermDeposit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetCustomer_Click(object sender, EventArgs e)
        {
            customer cusObj = new customer();
            customerDAO cusDao = new customerDAO();
            cusObj = cusDao.getCustomerById(tbCustId.Text);

            if(cusObj == null)
            {
                PanelErrorResult.Visible = true;
                Lbl_err.Text = "Customer not found";
                PanelCust.Visible = false;
            }
            else
            {
                PanelErrorResult.Visible = false;
                PanelCust.Visible = true;

                Lbl_custname.Text = cusObj.customerName;
                Lbl_Address.Text = cusObj.customerAddress;
                Lbl_HomePhone.Text = cusObj.customerHomePhone;
                Lbl_Mobile.Text = cusObj.customerMobile;
                Lbl_err.Text = "";
            }
        }
    }
}