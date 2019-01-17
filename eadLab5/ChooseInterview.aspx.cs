using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OpenTokSDK;

namespace eadLab5
{
    public partial class ChooseInterview : System.Web.UI.Page
    {
        protected int apiKey = 46243942;
        protected string apiSecret = "f12c7bc2592d9b613b3e2fadae2cbbf0bc32cb2d";
        protected string sessionId = "";
        protected string token = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            var OpenTok = new OpenTok(apiKey, apiSecret);
            var session = OpenTok.CreateSession();
            sessionId = session.Id;

            token = session.GenerateToken();
            System.Diagnostics.Debug.WriteLine(sessionId);
            System.Diagnostics.Debug.WriteLine(token);
        }
    }
}