<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ViewFeedBackStaff.aspx.cs" Inherits="eadLab5.ViewFeedBackStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <br />
        &nbsp;<asp:Label ID="CountryFilter" runat="server" Text="Country Filter"></asp:Label>
        <br />
        &nbsp;<asp:DropDownList ID="CountryFilterDropDown" runat="server">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Overall</asp:ListItem>
            <asp:ListItem>Australia</asp:ListItem>
            <asp:ListItem>Beijing</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;<br />
        &nbsp;<asp:Label ID="AffordableFilter" runat="server" Text="Affordability"></asp:Label>
        <br />
        &nbsp;<asp:DropDownList ID="AffordabilityFilterDropDown" runat="server">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:DropDownList>

        &nbsp;<br />
        &nbsp;Freedom<br />
        &nbsp;<asp:DropDownList ID="FreedomFilterDropDown" runat="server">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:DropDownList>
        <br />
        &nbsp;Date Start<br />
       
        &nbsp;<asp:TextBox runat="server" ID="txtDateCheckStart" Format="dd/MMMM/yyyy" required="" placeholder="DD-MMMM-YYYY"  type="date"/>

        <br />
        &nbsp;Date End
        <br />
         &nbsp;<asp:TextBox runat="server" ID="txtDateCheckEnd" Format="dd/MMMM/yyyy" required="" placeholder="DD-MMMM-YYYY" type="date"/>

        <br />

        <asp:Label ID="LabelFilter" runat="server" Text="[LabelFilter]" Visible="False"></asp:Label>

        <br />
        <asp:Button ID="FilterBtn" runat="server" OnClick="FilterBtn_Click" Text="Filter" />
        <br />
        <br />

     <asp:GridView ID="GridView_GetFB" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnSelectedIndexChanged="GridView_GetFB_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Height="258px" Width="572px" style="margin: 0 auto; text-align:left;">
         <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField AccessibleHeaderText="FeedBackId" DataField="FeedBackId" HeaderText="ID" />
            <asp:BoundField AccessibleHeaderText="Student Name" DataField="StudentName" HeaderText="Student Name" />
            <asp:BoundField AccessibleHeaderText="Country" DataField="Country" HeaderText="Country" />
            <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="AdminNo" />
            <asp:BoundField AccessibleHeaderText="Affordable" DataField="Affordability" HeaderText="Affordable" DataFormatString="{0:n2}" />
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

 