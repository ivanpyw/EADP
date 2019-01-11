<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="Interview.aspx.cs" Inherits="eadLab5.interview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://static.opentok.com/v2/js/opentok.min.js"></script>
    <script type="text/javascript">
        var apiKey = "46243942";
        var sessionId = "2_MX40NjI0Mzk0Mn5-MTU0NzIzMzIzNTkzNH5mUndnOWpQOUNBY2FTSEdVK2hsMVViRzR-fg";
        var token = "T1==cGFydG5lcl9pZD00NjI0Mzk0MiZzaWc9OWU2NmJjYmI3OGEwMDUzNGMzOTAzM2I5MTY1Njk5ZWYyNWY1ZDUxYTpzZXNzaW9uX2lkPTJfTVg0ME5qSTBNemswTW41LU1UVTBOekl6TXpJek5Ua3pOSDVtVW5kbk9XcFFPVU5CWTJGVFNFZFZLMmhzTVZWaVJ6Ui1mZyZjcmVhdGVfdGltZT0xNTQ3MjMzMjQ5Jm5vbmNlPTAuOTEyODI2NjQyMzA1NjM1MyZyb2xlPXB1Ymxpc2hlciZleHBpcmVfdGltZT0xNTQ3MjM2ODUxJmluaXRpYWxfbGF5b3V0X2NsYXNzX2xpc3Q9";

        // (optional) add server code here
        initializeSession();

        function handleError(error) {
            if (error) {
                alert(error.message);
            }
        }

        function initializeSession() {
            var session = OT.initSession(apiKey, sessionId);

            // Subscribe to a newly created stream
            session.on('streamCreated', function (event) {
                session.subscribe(event.stream, 'subscriber', {
                    insertMode: 'append',
                    width: '100%',
                    height: '100%'
                }, handleError);
            });
            // Create a publisher
            var publisher = OT.initPublisher('publisher', {
                insertMode: 'append',
                width: '100%',
                height: '100%'
            }, handleError);

            // Connect to the session
            session.connect(token, function (error) {
                // If the connection is successful, publish to the session
                if (error) {
                    handleError(error);
                } else {
                    session.publish(publisher, handleError);
                }
            });
        }

    </script>
    <div id="videos">
        <div id="subscribers"><div id="publisher"></div></div>
    </div>
</asp:Content>
