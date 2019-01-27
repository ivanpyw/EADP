<%@ Page Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="EventPage.aspx.cs" Inherits="eadLab5.EventPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <form runat="server">
        <asp:Label ID="LblAdminNo" runat="server" Text="Admin No:"></asp:Label>
        <asp:GridView ID="GridView_Event" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_Students_RowCommand" CellPadding="4" ForeColor="#333333" margin-left="auto" margin-right="auto" Width="200px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="EventID" HeaderText="ID" />
                <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                <asp:BoundField DataField="EyearTaken" HeaderText="Year Taken" />
                <asp:BoundField DataField="EsemTaken" HeaderText="SEM Taken" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("EventID") %>' CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("EventID") %>' CommandName="Edit" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="BtnAdd"  />
        <asp:Button ID="Button2" runat="server" OnClick="BtnBack_Click" Text="Back" />
        </form>
        </div>
</asp:Content>

