<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="OverseasRegisteredList.aspx.cs" Inherits="eadLab5.OverseasRegisteredList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content-wrapper">

        <br />

      <!-- Sidebar -->


   <form id="form1" runat="server">
        <div class="container" style="max-width:95%">

        

          <!-- Area Chart Example-->
            <div class="card mb-3">
                <div class="card-header">
        <asp:Label ID="Label1" runat="server" Text="Registered List"></asp:Label>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                    
        <asp:GridView ID="GridViewRegistered" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionRegistered" style="table-layout:fixed;">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RegisterId" HeaderText="ID" AccessibleHeaderText="RegisterID" />
                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnShortlist0" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="Shortlist" Text="Shortlist" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnNorminate0" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="Norminate" Text="Norminate" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnMove" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="Move to waiting list" Text="Move to waiting list" />
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
                        </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card mb-3">
                                <div class="card-header">
        <asp:Label ID="Label2" runat="server" Text="Norminated List"></asp:Label>
                                </div>
                                <div class="card-body table-responsive">
        <asp:GridView ID="GridViewNorminated" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped"  Height="284px" OnRowCommand="GridActionNorminate">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnShortlist1" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="Shortlist" Text="Shortlist" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnNorminate1" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="UnNorminate" Text="UnNorminate" />
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
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-3">
                                <div class="card-header">
        <asp:Label ID="Label4" runat="server" Text="Waiting List"></asp:Label>
                                </div>

                                <div class="card-body table-responsive">
                                    <asp:GridView ID="GridViewWaitingList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped"  Height="284px" OnRowCommand="GridActionWaitingList" OnSelectedIndexChanged="GridViewWaitingList_SelectedIndexChanged">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                                            <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                                            <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                                            <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnShortlist" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="Shortlist" Text="Shortlist" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnNorminate" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="Move to pending" Text="Move to pending" />
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

                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card-header">
                                 <asp:Label ID="Label5" runat="server" Text="Shortlisted List"></asp:Label></div>
                                  <div class="table-responsive">
                    
        <asp:GridView ID="GridViewShortlisted" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped"  Height="284px" OnRowCommand="GridActionShortlist">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />
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
      
                                
                                <br />

                            </div>

                        </div>

                    </div>
            </div>
            <!-- /.container-fluid -->

            <!-- Sticky Footer -->

        </div>
          <!-- /.content-wrapper -->

      </div>
  
        <br />
        <br />
    </form>
</asp:Content>
