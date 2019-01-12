<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="Interview.aspx.cs" Inherits="eadLab5.interview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Interview.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://static.opentok.com/v2/js/opentok.min.js"></script>
    <div class="container">
        <div id="videos">
            <div id="subscriber">
                <div id="publisher"></div>
            </div>
        </div>
        <script type="text/javascript">
            var apiKey = "46243942";
            var sessionId = "2_MX40NjI0Mzk0Mn5-MTU0NzI4Mzg4NzI2NX4zTkZ1VmxhdDBzWm51UHFyNmlKQVRxUXJ-fg";
            var token = "T1==cGFydG5lcl9pZD00NjI0Mzk0MiZzaWc9ZWM0ODIwNzQ1NDA3MTM4MzM5ZDNiMjNmMWJhZjM3ZmY1Mjk4NTkxNTpzZXNzaW9uX2lkPTJfTVg0ME5qSTBNemswTW41LU1UVTBOekk0TXpnNE56STJOWDR6VGtaMVZteGhkREJ6V201MVVIRnlObWxLUVZSeFVYSi1mZyZjcmVhdGVfdGltZT0xNTQ3MjgzOTMxJm5vbmNlPTAuODMxOTg0NzYzMDc3MzEwMSZyb2xlPXB1Ymxpc2hlciZleHBpcmVfdGltZT0xNTQ3Mjg3NTMzJmluaXRpYWxfbGF5b3V0X2NsYXNzX2xpc3Q9";

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
