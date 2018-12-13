<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="StaffViewSpecificFeedBack.aspx.cs" Inherits="eadLab5.StaffViewSpecificFeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        Name:
        <asp:Label ID="NameLabel" runat="server" Text="[Name]"></asp:Label>
        <br />
        AdminNo:
        <asp:Label ID="AdminLabel" runat="server" Text="[AdminNo]"></asp:Label>
        <br />
        Country Visited: <asp:Label ID="CountryLabel" runat="server" Text="[Country]"></asp:Label>
        <br />
        Thinks that affordability was: <asp:Label ID="AffordablitityLabel" runat="server" Text="[Affordability]"></asp:Label>
        <br />
        Person felt that the trip was : <asp:Label ID="EnjoymentLabel" runat="server" Text="[Enjoyment]"></asp:Label>
        <br />
        He/She felt that they were given
        <asp:Label ID="Freedom" runat="server" Text="[Freedom]"></asp:Label>
&nbsp;free time to roam<br />
        Trip Highlights:<br />
        <asp:Label ID="HighlightsLabel" runat="server" Text="[Highlights]"></asp:Label>
        <br />
        Trip Downsides:<br />
        <asp:Label ID="DownsidesLabel" runat="server" Text="[Downsides]"></asp:Label>
        <br />
        Trip could be improved in:<br />
        <asp:Label ID="ImprovementsLabel" runat="server" Text="[Improvements]"></asp:Label>
    </form>
</asp:Content>
