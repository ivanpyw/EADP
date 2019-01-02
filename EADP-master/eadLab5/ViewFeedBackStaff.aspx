<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ViewFeedBackStaff.aspx.cs" Inherits="eadLab5.ViewFeedBackStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
     <asp:GridView ID="GridView_GetFB" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnSelectedIndexChanged="GridView_GetFB_SelectedIndexChanged" >
        <Columns>
            <asp:BoundField AccessibleHeaderText="FeedBackId" DataField="FeedBackId" HeaderText="FeedBackId" />
            <asp:BoundField AccessibleHeaderText="Student Name" DataField="StudentName" HeaderText="Student Name" />
            <asp:BoundField AccessibleHeaderText="Country" DataField="Country" HeaderText="Country" />
            <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="AdminNo" />
            <asp:BoundField AccessibleHeaderText="Affordable?" DataField="Affordability" HeaderText="Affordable?" DataFormatString="{0:n2}" />
            <asp:BoundField AccessibleHeaderText="Enjoyable?" DataField="Enjoyment" HeaderText="Enjoyable?" />
            <asp:BoundField AccessibleHeaderText="Freedom" DataField="Freedom" HeaderText="Freedom" />
            <asp:BoundField AccessibleHeaderText="Pros" DataField="ReviewPros" HeaderText="Pros" />
            <asp:BoundField AccessibleHeaderText="Cons" DataField="ReviewCons" HeaderText="Cons" />
            <asp:BoundField AccessibleHeaderText="Improvement" DataField="ReviewImprovement" HeaderText="Improvement" />
            <asp:CommandField HeaderText="View Feedback" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
        <asp:Label ID="LabelFilter" runat="server" Text="[LabelFilter]" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="CountryFilter" runat="server" Text="Country Filter"></asp:Label>
        <br />
        <asp:DropDownList ID="CountryFilterDropDown" runat="server">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Australia</asp:ListItem>
            <asp:ListItem>Beijing</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="AffordableFilter" runat="server" Text="Affordability"></asp:Label>
        <br />
        <asp:DropDownList ID="AffordabilityFilterDropDown" runat="server">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="FilterBtn" runat="server" OnClick="FilterBtn_Click" Text="Filter" />
        </form>
</asp:Content>

 