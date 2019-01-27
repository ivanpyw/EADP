using eadLab5.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;


namespace eadLab5
{
    public partial class OverseasRegisteredList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TripDAO TripDAO = new TripDAO();
                List<Trip> TripList = new List<Trip>();
                int tripId = Convert.ToInt32(Request.QueryString["tripId"]);

                TripList = TripDAO.GetShortlisted(tripId);
                GridViewShortlisted.DataSource = TripList;
                GridViewShortlisted.DataBind();

                TripList = TripDAO.GetRegisteredList(tripId);
                GridViewRegistered.DataSource = TripList;
                GridViewRegistered.DataBind();

                TripList = TripDAO.GetWaitingList(tripId);
                GridViewWaitingList.DataSource = TripList;
                GridViewWaitingList.DataBind();

                TripList = TripDAO.GetNorminated(tripId);
                GridViewNorminated.DataSource = TripList;
 
                TripList = TripDAO.GetRegisteredList(tripId);
                GridViewRegisteredIncharge.DataSource = TripList;
                GridViewRegisteredIncharge.DataBind();

                TripList = TripDAO.GetNorminated(tripId);
                GridViewNorminatedIncharge.DataSource = TripList;
                GridViewNorminatedIncharge.DataBind();

                TripList = TripDAO.GetWaitingList(tripId);
                GridViewWaitingListIncharge.DataSource = TripList;
                GridViewWaitingListIncharge.DataBind();

               
            }

            LabelNorminatedExport.Visible = false;
            LabelWaitingExport.Visible = false;
            LabelShortlistExport.Visible = false;
            LabelRegisterExport.Visible = false;

        }

        //protected void GridActionRegistered(object sender, GridViewCommandEventArgs e)
        //{
        //    int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
        //    GridViewRow row = GridViewRegistered.SelectedRow;
        //    string IDOFPAGE = row.Cells[0].Text;
        //    if (e.CommandName == "Shortlist")
        //    {
        //        TripDAO TripDAO = new TripDAO();
        //        Trip TripList = new Trip();
        //        int TRIPPYLIST;
        //        TRIPPYLIST = TripDAO.updateShortlisted(IDOFPAGE, tripId);
                

        //    }
        //    else if (e.CommandName == "Norminate")
        //    {

        //    }
        //    else if (e.CommandName == "WaitingList")
        //    {

        //    }
        //}

        protected void GridActionRegistered(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();
            int staffId = Convert.ToInt32(Session["StaffId"]);

            if (e.CommandName == "Shortlist")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateShortlisted(RegisterID, tripId);
                InterviewDAO intDao = new InterviewDAO();
                string adminNo = intDao.exchangeRegIdForAdminNo(RegisterID);
                int updateStuds = intDao.selectForInterview(adminNo, staffId, tripId );
                Response.Redirect(Request.RawUrl);

            }
            else if (e.CommandName == "Norminate")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateNorminate(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else if (e.CommandName == "Move to waiting list")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateWaitingList(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                return;
            }
        }




        protected void GridActionNorminate(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();


            if (e.CommandName == "UnNorminate")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateRegistered(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);

            }
            else if (e.CommandName == "Shortlist")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateShortlisted(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
           
            else
            {
                return;
            }

        }
        protected void GridActionShortlist(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();

            if (e.CommandName == "Move to waiting list")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateWaitingList(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else if (e.CommandName == "Move to pending")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateRegistered(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
           
        }
        protected void GridActionWaitingList(object sender, GridViewCommandEventArgs e)
        {
            int tripId = Convert.ToInt32(Request.QueryString["tripId"]);
            GridViewRow row = GridViewRegistered.SelectedRow;
            string RegisterID = e.CommandArgument.ToString();
            if (e.CommandName == "Shortlist")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateShortlisted(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }
            else if (e.CommandName == "Move to pending")
            {
                TripDAO TripDAO = new TripDAO();
                Trip TripList = new Trip();
                int TRIPPYLIST;
                TRIPPYLIST = TripDAO.updateRegistered(RegisterID, tripId);
                Response.Redirect(Request.RawUrl);
            }

        }

        protected void Chart3_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewWaitingList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void ExportButtonRegistered_Click(object sender, EventArgs e)
        {
            if ((GridViewRegistered.Rows.Count == 0) || (GridViewRegisteredIncharge.Rows.Count == 0))
            {
                LabelRegisterExport.Text = "No data to export!";
                LabelRegisterExport.Visible = true;
            }
            else
            {
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "Registered.xls"));
                Response.ContentType = "application/ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                if (Session["role"].ToString() == "Teacher")
                {
                    GridViewRegistered.AllowPaging = false;
                    GridViewRegistered.HeaderRow.Style.Add("background-color", "#ffffff");
                    for (int i = 0; i < GridViewRegistered.HeaderRow.Cells.Count; i++)
                    {
                        GridViewRegistered.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
                    }
                    GridViewRegistered.RenderControl(hw);
                }
                else if (Session["role"].ToString() == "Incharge")
                {
                    GridViewRegisteredIncharge.AllowPaging = false;
                    GridViewRegisteredIncharge.HeaderRow.Style.Add("background-color", "#ffffff");
                    for (int i = 0; i < GridViewRegisteredIncharge.HeaderRow.Cells.Count; i++)
                    {
                        GridViewRegisteredIncharge.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
                    }
                    GridViewRegisteredIncharge.RenderControl(hw);
                }
                Response.Write(sw.ToString());
                Response.End();
            }
          
        }

        protected void ExportButtonNormination_Click(object sender, EventArgs e)
        {
            if ((GridViewNorminated.Rows.Count == 0) || (GridViewNorminatedIncharge.Rows.Count == 0))
            {
                LabelNorminatedExport.Text = "No data to export!";
                LabelNorminatedExport.Visible = true;
            }
            else
            {
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "Norminated.xls"));
                Response.ContentType = "application/ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                if (Session["role"].ToString() == "Teacher")
                {
                    GridViewNorminated.AllowPaging = false;
                    GridViewNorminated.HeaderRow.Style.Add("background-color", "#ffffff");
                    for (int i = 0; i < GridViewNorminated.HeaderRow.Cells.Count; i++)
                    {
                        GridViewNorminated.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
                    }
                    GridViewNorminated.RenderControl(hw);
                }
                else if (Session["role"].ToString() == "Incharge")
                {
                    GridViewNorminatedIncharge.AllowPaging = false;
                    GridViewNorminatedIncharge.HeaderRow.Style.Add("background-color", "#ffffff");
                    for (int i = 0; i < GridViewNorminated.HeaderRow.Cells.Count; i++)
                    {
                        GridViewNorminatedIncharge.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
                    }
                    GridViewNorminatedIncharge.RenderControl(hw);
                }

                Response.Write(sw.ToString());
                Response.End();
            }
           
        }

        protected void ExportButtonWaiting_Click(object sender, EventArgs e)
        {
            if ((GridViewWaitingList.Rows.Count == 0) || (GridViewWaitingListIncharge.Rows.Count == 0))
            {
                LabelWaitingExport.Visible = true;
                LabelWaitingExport.Text = "No data to export!";
            }
            else
            {
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "WaitingList.xls"));
                Response.ContentType = "application/ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                if (Session["role"].ToString() == "Teacher")
                {
                    GridViewWaitingList.AllowPaging = false;
                    GridViewWaitingList.HeaderRow.Style.Add("background-color", "#ffffff");
                    for (int i = 0; i < GridViewWaitingList.HeaderRow.Cells.Count; i++)
                    {
                        GridViewWaitingList.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
                    }
                    GridViewWaitingList.RenderControl(hw);
                }
                else if (Session["role"].ToString() == "Incharge")
                {
                    GridViewWaitingListIncharge.AllowPaging = false;
                    GridViewWaitingListIncharge.HeaderRow.Style.Add("background-color", "#ffffff");
                    for (int i = 0; i < GridViewWaitingListIncharge.HeaderRow.Cells.Count; i++)
                    {
                        GridViewWaitingListIncharge.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
                    }
                    GridViewWaitingListIncharge.RenderControl(hw);
                }
                Response.Write(sw.ToString());
                Response.End();
            }
        }

        protected void ExportButtonShortlisted_Click(object sender, EventArgs e)
        {
            if (GridViewShortlisted.Rows.Count == 0)
            {
                LabelShortlistExport.Visible = true;
                LabelShortlistExport.Text = "No data to export!";
            }
            else
            {
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "Shortlisted.xls"));
                Response.ContentType = "application/ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                GridViewShortlisted.AllowPaging = false;
                GridViewShortlisted.HeaderRow.Style.Add("background-color", "#ffffff");
                for (int i = 0; i < GridViewShortlisted.HeaderRow.Cells.Count; i++)
                {
                    GridViewShortlisted.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
                }
                GridViewShortlisted.RenderControl(hw);
                Response.Write(sw.ToString());
                Response.End();
            }
        }
    }
}