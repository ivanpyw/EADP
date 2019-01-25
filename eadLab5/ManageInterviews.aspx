<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ManageInterviews.aspx.cs" Inherits="eadLab5.ManageInterviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">Scheduling interviews</div>
                <% foreach (var interview in interviewList)
                    { %>
                <div class="card-body">
                    <div class="media">
                        <img class="align-self-center mr-3" src="<%=interview.studentPic%>" alt="studentPicture"  style="height:193px;width:193px;"/>
                        <div class="media-body">
                            <h5 class="mt-0"><%=interview.studentName %></h5>
                            <p>Signing up for <%=interview.tripName %></p>
                            <p>From <%=interview.tripStart.ToString("dd/MM/yyyy") %> to <%=interview.tripEnd.ToString("dd/MM/yyyy") %></p>
                            <p>Location: <%=interview.tripLocation %></p>
                        </div>
                        <input type="datetime" id="datetimeTrip<%=interview.interviewId %>"/>
                        <button type="button" class="align-middle btn btn-primary" onclick="testing(<%=interview.interviewId %>)">Schedule interview</button>
                    </div>
                </div>
                <script type="text/javascript">
                    function testing(id) {
                        var datetimeId = "datetimeTrip" + id;
                        var value = document.getElementById(datetimeId).value;
                        console.log(value);
                    }
                </script>
                <%} %>
        </div>
    </div>
</asp:Content>
