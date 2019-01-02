<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="UpdateFeedBackSubmitted.aspx.cs" Inherits="eadLab5.UpdateFeedBackSubmitted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
    <table class="table">
                <td class="auto-style1">Did you enjoy your trip in
        <asp:Label ID="CountryLabel" runat="server" Text="[Country]" Visible="False"></asp:Label>
        ? :</td>
                <td>
                     <asp:DropDownList ID="EnjoymentDropDownUpdate" runat="server">
                        <asp:ListItem>-Select-</asp:ListItem>
                        <asp:ListItem>Not at all</asp:ListItem>
                        <asp:ListItem>A little bit</asp:ListItem>
                        <asp:ListItem>Average</asp:ListItem>
                        <asp:ListItem>Enjoyed it</asp:ListItem>
                        <asp:ListItem>Definitely Enjoyed it</asp:ListItem>
                     </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Do you think the trip was affordable? :</td>
                <td>
                    <asp:DropDownList ID="AffordabilityDropDownUpdate" runat="server">
                        <asp:ListItem>-Select-</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                    </asp:DropDownList>

                    &nbsp;<asp:Label ID="LblErr" Text="" ForeColor="Red" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">Are you satisfied with the freedom you were given? : </td>
                <td>
                   <asp:DropDownList ID="FreedomDropBoxUpdate" runat="server">
                    <asp:ListItem>-Select-</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"> What is your highlight of the trip? : </td>
                <td>
                    <asp:TextBox ID="HighlightTbUpdate" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style1"> What are the downsides of the trip? :</td>
                <td>
                   <asp:TextBox ID="DownsidesTbUpdate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"> What can be improved? :</td>
                <td>
                    <asp:TextBox ID="ImprovementTbUpdate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click"  />&nbsp;&nbsp;
                   <asp:Button ID="BtnBack" runat="server" OnClick="BtnBack_Click" Text="Back" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Label ID="LblResult" Text="" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
