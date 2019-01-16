<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="OverseasRegisteredList.aspx.cs" Inherits="eadLab5.OverseasRegisteredList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridViewRegistered" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionRegistered">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />
                <asp:ButtonField CommandName="Shortlist" Text="Shortlist" />
                <asp:ButtonField CommandName="Norminate" Text="Norminate" />
                <asp:ButtonField CommandName="Move to waiting list" Text="Move to waiting list" />
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
        <br />
        <asp:GridView ID="GridViewNorminated" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped"  Height="284px" OnRowCommand="GridActionNorminate">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />
                <asp:ButtonField CommandName="UnNorminate" Text="UnNorminate" />
                <asp:ButtonField CommandName="Shortlist" Text="Shortlist" />
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
        <br />
        <asp:GridView ID="GridViewShortlisted" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped"  Height="284px" OnRowCommand="GridActionShortlist">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />
                <asp:ButtonField CommandName="Move to waiting list" Text="Move to waiting list" />
                <asp:ButtonField CommandName="Move to pending"  Text="Move to pending" />
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
        <br />
        <asp:GridView ID="GridViewWaitingList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped"  Height="284px" OnRowCommand="GridActionWaitingList">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />
                <asp:ButtonField CommandName="Shortlist" Text="Shortlist" />
                <asp:ButtonField CommandName="Move to pending"  Text="Move to pending" />
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
        <br />
    </form>
    <br />
</asp:Content>
