<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="Interview.aspx.cs" Inherits="eadLab5.interview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Interview.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://static.opentok.com/v2/js/opentok.min.js"></script>
    <div class="container">
        <div id="videos">
            <div id="subscriber">Mr Tham
            </div>
            <div class="container">
            <div id="publisher">You</div>
                </div>
        </div>
        <script type="text/javascript">
            var apiKey = "46243942";
            var sessionId = "2_MX40NjI0Mzk0Mn5-MTU0NzMwNzQwNDU2NH52aWFaYmJleTk3dnhwVk9pTWZtWlZBQXZ-UH4";
            var token = "T1==cGFydG5lcl9pZD00NjI0Mzk0MiZzaWc9NTQ4ZWYwMjAwY2JkYWRmYzIzOGZmMDQ2ZTNmZGQzYjk5NGZkMGVjYjpzZXNzaW9uX2lkPTJfTVg0ME5qSTBNemswTW41LU1UVTBOek13TnpRd05EVTJOSDUyYVdGYVltSmxlVGszZG5od1ZrOXBUV1p0V2xaQlFYWi1VSDQmY3JlYXRlX3RpbWU9MTU0NzMwNzQwNyZub25jZT00MTk4NyZyb2xlPVBVQkxJU0hFUg==";

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
        </div>
</asp:Content>
