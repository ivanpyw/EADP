﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OpenTokSDK;

namespace eadLab5
{
    public partial class interview : System.Web.UI.Page
    {
        protected int apiKey = 46243942;
        protected string apiSecret = "f12c7bc2592d9b613b3e2fadae2cbbf0bc32cb2d";
        protected string sessionId = "";
        protected string token = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            if(Session["role"] == null)
            {
                Response.Redirect("loginStudent.aspx");
            }
            sessionId = Request.QueryString["sessionId"];
            token = Request.QueryString["token"];
            if(sessionId == null || token == null)
            {
                Response.Redirect("loginStudent.aspx");
            }
        }

        protected void ArchiveBtn_Click(object sender, EventArgs e)
        {

        }
    }
}