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
            width: 601px;
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
        .auto-style10 {
            width: 38px;
        }
        .auto-style11 {
            width: 109%;
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
                    <asp:DropDownList ID="CountryDropDown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDown_SelectedIndexChanged">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Beijing</asp:ListItem>
                        <asp:ListItem>Dubai</asp:ListItem>
                        <asp:ListItem>China</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Type:</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="TypeDropDown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="TypeDropDown_SelectedIndexChanged">
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
                    <asp:TextBox ID="DateStartRange" runat="server" type="date" AutoPostBack="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Year End:</td>
                <td>
                    <asp:TextBox ID="DateEndRange" runat="server" type="date" AutoPostBack="True" OnTextChanged="DateEndRange_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td>
      
                </td>
            </tr>
        </table>
                </td>
                <td class="auto-style7">
                    <table class="auto-style5">
                        <tr>
                            <td class="auto-style4">Country:</td>
                            <td>
                                <asp:DropDownList ID="DropDownListCountryPieChart" runat="server" OnSelectedIndexChanged="DropDownListCountryPieChart_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>Dubai</asp:ListItem>
                                    <asp:ListItem>China</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                    
                                
                    
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="Average Cost Spent in each country"></asp:Label>
        <asp:Chart ID="Chart2" runat="server" Width="598px" BackGradientStyle="VerticalCenter">
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
                    <asp:Label ID="Label4" runat="server" Text="Diploma Percentage In Country"></asp:Label>
        <asp:Chart ID="Chart1" runat="server" Width="600px" Palette="Fire">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="Diploma" YValueMembers="NoOfStudents">
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
                <td class="auto-style6">
                    <table class="auto-style5">
                        <tr>
                            <td class="auto-style4">Diploma:</td>
                            <td>
                                <asp:DropDownList ID="DropDownDiplomaLine" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>Diploma in insecurity</asp:ListItem>
                                    <asp:ListItem>Diploma in making ppl life hard</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Year:</td>
                            <td>
                                <asp:DropDownList ID="DropDownYearLine" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownYearLine_SelectedIndexChanged">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem Value="1">Year 1</asp:ListItem>
                                    <asp:ListItem Value="2">Year 2</asp:ListItem>
                                    <asp:ListItem Value="3">Year 3</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style7">
                    <table class="auto-style11">
                        <tr>
                            <td>
                                <table class="auto-style5">
                                    <tr>
                                        <td class="auto-style10">Year:</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" >
                                                <asp:ListItem>All</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style10">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label2" runat="server" Text="Student Oversea Per Month"></asp:Label>
                    <asp:Chart ID="Chart3" runat="server" Width="598px">
                        <Series>
                            <asp:Series ChartType="Line" Name="Series1" XValueMember="Month" YValueMembers="NoOfStudents">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label1" runat="server" Text="People Per Country"></asp:Label>
                    <asp:Chart ID="Chart4" runat="server" Palette="Berry" Width="600px">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="Location" YValueMembers="NoOfStudents">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
            </tr>
        </table>
       
        
    </form>
</asp:Content>
