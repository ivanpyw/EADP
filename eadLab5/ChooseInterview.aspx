<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage1.master" AutoEventWireup="true" CodeBehind="ChooseInterview.aspx.cs" Inherits="eadLab5.ChooseInterview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                Upcoming interviews
            </div>
            <% foreach(var interview in intSessions) { %>
            <div class="card-body">
                <a href="Interview.aspx?sessionId=<%=interview.interviewSession %>&token=<%=interview.interviewToken%>"><h5 class="card-title">Interview for Vietnam immersion program</h5></a>
                <p class="card-text">Time: Friday 1500 - 1520</p>
                <p class="card-text">Note: Rememeber to be on time</p>
                <p class="card-text">You will be interviewed by Mr Lim Wee Teck, Mr Albert chua and Ms Cynthia</p>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>
