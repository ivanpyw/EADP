<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ViewFeedBackStaff.aspx.cs" Inherits="eadLab5.ViewFeedBackStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 21%;
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

    <form runat="server">
        <br />
        &nbsp;<br />
        &nbsp;&nbsp;&nbsp;<br />
        &nbsp;<br />
        &nbsp;&nbsp;<br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><asp:Label ID="CountryFilter0" runat="server" Text="Country Filter"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:DropDownList ID="CountryFilterDropDown" runat="server">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>Australia</asp:ListItem>
            <asp:ListItem>Beijing</asp:ListItem>
        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><asp:Label ID="AffordableFilter" runat="server" Text="Affordability"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:DropDownList ID="AffordabilityFilterDropDown" runat="server">
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
                <td class="auto-style3"><asp:DropDownList ID="FreedomFilterDropDown" runat="server">
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
                <td class="auto-style3"><asp:TextBox runat="server" ID="txtDateCheckStart" Format="dd/MMMM/yyyy" placeholder="DD-MMMM-YYYY"  type="date"/>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Date End"></asp:Label>
                    :</td>
                <td class="auto-style3"><asp:TextBox runat="server" ID="txtDateCheckEnd" Format="dd/MMMM/yyyy" placeholder="DD-MMMM-YYYY" type="date" Width="190px"/>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
        <asp:Button ID="FilterBtn" runat="server" OnClick="FilterBtn_Click" Text="Filter" />
                </td>
            </tr>
        </table>

        <br />

        <br />
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

 