<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="FeedBacks.aspx.cs" Inherits="eadLab5.FeedBacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
       
        .mydatagrid {
            width: 100%;
            border: solid 2px black;
            min-width: 80%;
        }

        .header {
            background-color: black;
            font-family: Roboto;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 15px;
            font-weight: bold;
        }

        .rows {
            background-color: #fff;
            font-family: Roboto;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }

        .rows:hover {
            background-color: #d7d7d7;
            font-family: Roboto;
            color: #fff;
            text-align: left;
            font-weight: bold;
        }

        .selectedrow {
            background-color: #ff8000;
            font-family: Roboto;
            color: #fff;
            font-weight: bold;
            text-align: left;
            
        }

        .mydatagrid a /* FOR THE PAGING ICONS  */ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            text-decoration: none;
            font-weight: bold;
        }

        .mydatagrid a:hover /* FOR THE PAGING ICONS  HOVER STYLES*/ {
            background-color: #000;
            color: White;
        }

        .mydatagrid span /* FOR THE PAGING ICONS CURRENT PAGE INDICATOR */ {
            /background-color: #c9c9c9;/
            color: #000;
            padding: 5px 5px 5px 5px;
        }

        .pager {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mydatagrid td {
            padding: 15px;
            color: black;
        }

        .mydatagrid th {
            padding: 15px;
        }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        Feedbacks for this student to do
        <asp:GridView ID="GridViewStudentFeedBack" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewStudentFeedBack_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin: 0 auto; ">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField AccessibleHeaderText="Trip ID" DataField="TripId" HeaderText="Trip ID" />
                <asp:BoundField AccessibleHeaderText="Title" DataField="triptitle" HeaderText="Title" />
                <asp:BoundField AccessibleHeaderText="TimeRange" DataField="TimeRange" HeaderText="Time Range" />
                <asp:BoundField AccessibleHeaderText="location" DataField="location" HeaderText="Location" />
                <asp:CommandField ShowSelectButton="True" />
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
