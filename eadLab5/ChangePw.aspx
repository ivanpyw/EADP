<%@ Page Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ChangePw.aspx.cs" Inherits="eadLab5.ChangePw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <h2>Change</h2>
        <table class="table">
            <tr>
                <td class="auto-style1">Admin Number :</td>
                <td>
                    <asp:Label ID="LblAdminNo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">New Password :</td>
                <td>
                    <asp:TextBox ID="TbNewPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Confirm New Password:</td>
                <td>
                    <asp:TextBox ID="TbCfmNewPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                   <asp:Button ID="Update" runat="server" Text="Update" OnClick="BtnUpdate"  />&nbsp;&nbsp;
                   <asp:Button ID="Button2" runat="server" OnClick="BtnBack_Click" Text="Back" />
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