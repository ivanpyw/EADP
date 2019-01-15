<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="StaffViewSpecificFeedBack.aspx.cs" Inherits="eadLab5.StaffViewSpecificFeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 137px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table border="1" class="auto-style1">
            <tr>
                <td class="auto-style2">In-Depth Details</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Name:</td>
                <td>
        <asp:Label ID="NameLabel" runat="server" Text="[Name]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">AdminNo:</td>
                <td>
        <asp:Label ID="AdminLabel" runat="server" Text="[AdminNo]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Country Visited:</td>
                <td> <asp:Label ID="CountryLabel" runat="server" Text="[Country]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Affordability:</td>
                <td> <asp:Label ID="AffordablitityLabel" runat="server" Text="[Affordability]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Enjoyability:</td>
                <td> <asp:Label ID="EnjoymentLabel" runat="server" Text="[Enjoyment]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Freedom:</td>
                <td>
        <asp:Label ID="Freedom" runat="server" Text="[Freedom]"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table border="1" class="auto-style1">
            <tr>
                <td>Trip Highlights:</td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="HighlightsLabel" runat="server" Text="[Highlights]"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table border="1" class="auto-style1">
            <tr>
                <td>Trip Downsides:</td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="DownsidesLabel" runat="server" Text="[Downsides]"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table border="1" class="auto-style1">
            <tr>
                <td>Trip could be improved in:</td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="ImprovementsLabel" runat="server" Text="[Improvements]"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
    </form>
</asp:Content>
