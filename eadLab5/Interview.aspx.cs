using System;
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
            sessionId = Request.QueryString["sessionId"];
            token = Request.QueryString["token"];
            if(sessionId == null)
            {
                sessionId = "1_MX40NjI0Mzk0Mn5-MTU0NzY5OTE3MzU2Mn56SlN1aWxtS0JHc1hVaXJoZlE3NG8wM1F-UH4";
                token = "T1==cGFydG5lcl9pZD00NjI0Mzk0MiZzaWc9MmJhOGZmZWNiMjZhZDc2NmNhZTExYjE1ZDBkMDg0Y2RjNzZkZmY4YzpzZXNzaW9uX2lkPTFfTVg0ME5qSTBNemswTW41LU1UVTBOelk1T1RFM016VTJNbjU2U2xOMWFXeHRTMEpIYzFoVmFYSm9abEUzTkc4d00xRi1VSDQmY3JlYXRlX3RpbWU9MTU0NzY5OTE3NSZub25jZT05MjE5MzUmcm9sZT1QVUJMSVNIRVI=";
            }
        }

        protected void ArchiveBtn_Click(object sender, EventArgs e)
        {

        }
    }
}