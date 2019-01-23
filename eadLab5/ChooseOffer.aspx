<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ChooseOffer.aspx.cs" Inherits="eadLab5.ChooseOffer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <asp:button runat="server" text="Accept" OnClick="Unnamed1_Click" />
        <asp:button runat="server" text="Reject" OnClick="Unnamed2_Click" />
    </form>
</asp:Content>
