<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ViewFeedBacksSubmitted.aspx.cs" Inherits="eadLab5.ViewFeedBacksSubmitted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
     <asp:GridView ID="GridView_GetOwnFB" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" Height="74px" OnSelectedIndexChanged="GridView_GetOwnFB_SelectedIndexChanged" Width="348px" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin: 0 auto; text-align:left;">
         <AlternatingRowStyle BackColor="White" />
        <Columns >
            <%--<asp:BoundField AccessibleHeaderText="Student Name" DataField="StudentName" HeaderText="Student Name" />--%>
            <asp:BoundField AccessibleHeaderText="ID" DataField="FeedBackId" HeaderText="ID" />
            <asp:BoundField AccessibleHeaderText="StudentName" DataField="StudentName" HeaderText="StudentName" />
            <asp:BoundField AccessibleHeaderText="Country" DataField="Country" HeaderText="Country" />
            <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="AdminNo" />
            <asp:BoundField AccessibleHeaderText="Affordable" DataField="Affordability" HeaderText="Affordable" />
            <asp:BoundField AccessibleHeaderText="Enjoyable" DataField="Enjoyment" HeaderText="Enjoyable" />
            <asp:BoundField AccessibleHeaderText="Freedom" DataField="Freedom" HeaderText="Freedom" />
            <asp:CommandField HeaderText="View Feedback" ShowSelectButton="True" />
        </Columns>
         <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#EFF3FB" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
        </form>
</asp:Content>
