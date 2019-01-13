using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class _login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            validateLogin.Visible = false;
            validatePassword.Visible = false;
            if (string.IsNullOrEmpty(tbLogin.Text) || string.IsNullOrEmpty(tbPassword.Text))
            {
                if (string.IsNullOrEmpty(tbLogin.Text))
                { validateLogin.Visible = true; }
                if (string.IsNullOrEmpty(tbPassword.Text))
                { validatePassword.Visible = true; }
            }
            else
            {
                StudentLogin stuObj = new StudentLogin();
                StudentLoginDAO stuDao = new StudentLoginDAO();
                stuObj = stuDao.getStudentById(tbLogin.Text, tbPassword.Text);

                if (stuObj == null)
                {
                    lblErrorMessage.Visible = true;
                }
                else
                {
                    Session["AdminNo"] = stuObj.AdminNo;
                    Session["Year"] = stuObj.Year;
                    Response.Redirect("student.aspx");
                }
            }
                
            
                //using (SqlConnection sqlCon = new SqlConnection(@"Data Source = (local)\sqle2012;initial Catalog=TimeDeposit.mdf; Integrated Security =True;"))
                //{
                //    string query = "SELECT COUNT(1) FROM Staff WHERE email=@email and passowrd = @password";
                //    SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                //    sqlcmd.Parameters.AddWithValue("@email", txtLoginEmail.Text.Trim());
                //    sqlcmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                //    if (count == 1)
                //    {
                //        Session["email"] = txtLoginEmail.Text.Trim();
                //        Response.Redirect("PEMMain.aspx");
                //    }
                //    else
                //    { lblErrorMessage.Visible = true; }
                //}
            }
        }
    }
