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
        int apiKey = 46243942;
        string apiSecret = "f12c7bc2592d9b613b3e2fadae2cbbf0bc32cb2d";
        protected void Page_Load(object sender, EventArgs e)
        {

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            var OpenTok = new OpenTok(apiKey, apiSecret);
            var session = OpenTok.CreateSession();
            string sessionId = session.Id;

            string token = session.GenerateToken();
            //var archive = OpenTok.StartArchive(sessionId);
            //Guid archiveId = archive.Id;
            //var getArchive = OpenTok.GetArchive(archiveId.ToString());
        }
    }
}