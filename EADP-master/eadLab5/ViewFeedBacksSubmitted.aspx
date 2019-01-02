<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ViewFeedBacksSubmitted.aspx.cs" Inherits="eadLab5.ViewFeedBacksSubmitted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
     <asp:GridView ID="GridView_GetOwnFB" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" Height="74px" OnSelectedIndexChanged="GridView_GetOwnFB_SelectedIndexChanged" Width="348px" >
        <Columns>
            <%--<asp:BoundField AccessibleHeaderText="Student Name" DataField="StudentName" HeaderText="Student Name" />--%>
            <asp:BoundField AccessibleHeaderText="FeedBackId" DataField="FeedBackId" HeaderText="FeedBackId" />
            <asp:BoundField AccessibleHeaderText="StudentName" DataField="StudentName" HeaderText="StudentName" />
            <asp:BoundField AccessibleHeaderText="Country" DataField="Country" HeaderText="Country" />
            <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="AdminNo" />
            <asp:BoundField AccessibleHeaderText="Affordable?" DataField="Affordability" HeaderText="Affordable?" />
            <asp:BoundField AccessibleHeaderText="Enjoyable?" DataField="Enjoyment" HeaderText="Enjoyable?" />
            <asp:BoundField AccessibleHeaderText="Freedom" DataField="Freedom" HeaderText="Freedom" />
            <asp:BoundField AccessibleHeaderText="Pros" DataField="ReviewPros" HeaderText="Pros" />
            <asp:BoundField AccessibleHeaderText="Cons" DataField="ReviewCons" HeaderText="Cons" />
            <asp:BoundField AccessibleHeaderText="Improvement" DataField="ReviewImprovement" HeaderText="Improvement" />
            <asp:CommandField HeaderText="View Feedback" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
        </form>
</asp:Content>
