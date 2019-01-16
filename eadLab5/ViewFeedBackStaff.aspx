<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ViewFeedBackStaff.aspx.cs" Inherits="eadLab5.ViewFeedBackStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 37%;
        }
        .auto-style2 {
            width: 172px;
        }
        .auto-style3 {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style=".container-fluid">
    <form runat="server"> 
        <div style=".col-xs-."> 
        <table class="auto-style1" style=" margin: 0px auto;">
            <tr>
                <td class="auto-style2"><asp:Label ID="CountryFilter0" runat="server" Text="Country Filter"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:DropDownList ID="CountryFilterDropDown" runat="server" OnSelectedIndexChanged="CountryFilterDropDown_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>Australia</asp:ListItem>
            <asp:ListItem>Beijing</asp:ListItem>
        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><asp:Label ID="AffordableFilter" runat="server" Text="Affordability"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:DropDownList ID="AffordabilityFilterDropDown" runat="server" OnSelectedIndexChanged="AffordabilityFilterDropDown_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Freedom"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:DropDownList ID="FreedomFilterDropDown" runat="server" OnSelectedIndexChanged="FreedomFilterDropDown_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Date Start"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:TextBox runat="server" ID="txtDateCheckStart" Format="dd/MMMM/yyyy" placeholder="DD-MMMM-YYYY" min="1753-01-01" max="9999-12-31" type="date" value="1-1-1753" AutoPostBack="True"/>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Date End"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:TextBox runat="server" ID="txtDateCheckEnd" Format="dd/MMMM/yyyy" placeholder="DD-MMMM-YYYY" min="1753-01-01" max="9999-12-31" type="date" Width="190px" value="1-1-1753" OnTextChanged="txtDateCheckEnd_TextChanged" AutoPostBack="True"/>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
       
                </td>
            </tr>
        </table>
        </div>
        <div style=".col-xs-6.">
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
            </div>
        </form>
    </div>
</asp:Content>

 