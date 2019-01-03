<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ReportAndStatistics.aspx.cs" Inherits="eadLab5.ReportAndStatistics" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="AZURE">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="TripId" YValueMembers="Cost">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="AZURETEST">
            <series>
                <asp:Series Name="Series1" XValueMember="Location" YValueMembers="Cost">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="AZURETEST" runat="server" ConnectionString="<%$ ConnectionStrings:EADPConnectionString2 %>" SelectCommand="SELECT DISTINCT [Cost], [Location] FROM [Trip]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="AZURE" runat="server" ConnectionString="<%$ ConnectionStrings:EADPConnectionString %>" SelectCommand="SELECT [Cost], [TripId] FROM [Trip]"></asp:SqlDataSource>
    </form>
</asp:Content>
