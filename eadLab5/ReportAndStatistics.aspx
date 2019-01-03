<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ReportAndStatistics.aspx.cs" Inherits="eadLab5.ReportAndStatistics" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
            width: 127px;
        }
        .auto-style4 {
            width: 127px;
        }
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            width: 600px;
        }
        .auto-style7 {
            width: 770px;
        }
        .auto-style8 {
            width: 127px;
            height: 29px;
        }
        .auto-style9 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table class="auto-style5">
            <tr>
                <td class="auto-style6">
        <table class="auto-style5">
            <tr>
                <td class="auto-style3">Country:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="CountryDropDown" runat="server">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Beijing</asp:ListItem>
                        <asp:ListItem>Dubai</asp:ListItem>
                        <asp:ListItem>China</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Type:</td>
                <td>
                    <asp:DropDownList ID="TypeDropDown" runat="server">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Immersion</asp:ListItem>
                        <asp:ListItem>Study</asp:ListItem>
                        <asp:ListItem>OSEP</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Year Start:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="DateStartRange" runat="server" type="date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Year End:</td>
                <td>
                    <asp:TextBox ID="DateEndRange" runat="server" type="date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td>
                    
                    <asp:Button ID="FilterButton" runat="server" Text="Filter" OnClick="FilterButton_Click" />
                    
                </td>
            </tr>
        </table>
                </td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
        <asp:Chart ID="Chart2" runat="server" Width="598px">
            <series>
                <asp:Series Name="Series1" XValueMember="Location" YValueMembers="Cost">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
       
                </td>
                <td class="auto-style7">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="AZURE" Width="600px">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="TripId" YValueMembers="Cost">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
       
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
        </table>
       
        <asp:SqlDataSource ID="AZURE" runat="server" ConnectionString="<%$ ConnectionStrings:EADPConnectionString %>" SelectCommand="SELECT [Cost], [TripId] FROM [Trip]"></asp:SqlDataSource>
    </form>
</asp:Content>
