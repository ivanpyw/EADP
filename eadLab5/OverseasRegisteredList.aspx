<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="OverseasRegisteredList.aspx.cs" Inherits="eadLab5.OverseasRegisteredList" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content-wrapper">
        <br />

        <!-- Sidebar -->


        <form id="form1" runat="server">
            <div class="container" style="max-width: 95%">



                <!-- Area Chart Example-->
                <div class="card mb-3">
                    <div class="card-header">
                        <asp:Label ID="Label1" runat="server" Text="Registered List"></asp:Label>
                        <asp:Button ID="ExportButtonRegistered" runat="server" OnClick="ExportButtonRegistered_Click" Text="Export Registered List" class="btn btn-secondary" />
                        <br />
                        <asp:Label ID="LabelRegisterExport" runat="server" Text="[NoData]" Visible="False" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">

                        <%if (Session["role"].ToString() == "Teacher")
                            { %>
                            <asp:GridView ID="GridViewRegistered" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionRegistered" Style="table-layout: fixed;">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="RegisterId" HeaderText="ID" AccessibleHeaderText="RegisterID" />
                                    <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                                    <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnNorminate0" runat="server" CommandArgument='<%# Eval("RegisterID") %>' CommandName="Norminate" Text="Norminate" />
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
                                <EmptyDataTemplate><center>No records found!</center></EmptyDataTemplate>
                            </asp:GridView>
                        
                             <% }
                                 else if (Session["role"].ToString() == "Incharge")
                                 {%>

                            <asp:GridView ID="GridViewRegisteredIncharge" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionRegistered" Style="table-layout: fixed;">
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
                                 <EmptyDataTemplate><center>No records found!</center></EmptyDataTemplate>
                            </asp:GridView>

                      
                            <%} %>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <asp:Label ID="Label2" runat="server" Text="Norminated List"></asp:Label>
                                        <asp:Button ID="ExportButtonNorminated" runat="server" OnClick="ExportButtonNormination_Click" Text="Export Norminated List" class="btn btn-secondary"/>
                                        <br />
                                        <asp:Label ID="LabelNorminatedExport" runat="server" Text="[NoData]" ForeColor="Red"></asp:Label>
                                    </div>
                                    <div class="card-body table-responsive">
                                        <%if (Session["role"].ToString() == "Teacher")
                                            { %>
                                        <asp:GridView ID="GridViewNorminated" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionNorminate">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="RegisterId" HeaderText="ID" />
                                                <asp:BoundField AccessibleHeaderText="AdminNo" DataField="AdminNo" HeaderText="Admin number" />
                                                <asp:BoundField AccessibleHeaderText="Gender" DataField="GenderType" HeaderText="Gender" />
                                                <asp:BoundField AccessibleHeaderText="StaffID" DataField="staffName" HeaderText="Staff Name" />

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
                                            <EmptyDataTemplate><center>No records found!</center></EmptyDataTemplate>
                                        </asp:GridView>
                                       

                                        <% }
                                            else if (Session["role"].ToString() == "Incharge")
                                            {%>

                                        <asp:GridView ID="GridViewNorminatedIncharge" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionNorminate">
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
                                             <EmptyDataTemplate><center>No records found!</center></EmptyDataTemplate>
                                        </asp:GridView>
                                     
                                         <%} %>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <asp:Label ID="Label4" runat="server" Text="Waiting List"></asp:Label>
                                        <asp:Button ID="ExportButtonWaiting" runat="server" OnClick="ExportButtonWaiting_Click" Text="Export Waiting List" class="btn btn-secondary"/>
                                        <br />
                                        <asp:Label ID="LabelWaitingExport" runat="server" Text="[NoData]" ForeColor="Red"></asp:Label>
                                    </div>

                                    <div class="card-body table-responsive">
                                        <%if (Session["role"].ToString() == "Teacher")
                                            { %>
                                        <asp:GridView ID="GridViewWaitingList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionWaitingList" OnSelectedIndexChanged="GridViewWaitingList_SelectedIndexChanged">
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
                                             <EmptyDataTemplate><center>No records found!</center></EmptyDataTemplate>
                                        </asp:GridView>
                                     

                                        <% }
                                            else if (Session["role"].ToString() == "Incharge")
                                            {%>
                                        <asp:GridView ID="GridViewWaitingListIncharge" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionWaitingList" OnSelectedIndexChanged="GridViewWaitingList_SelectedIndexChanged">
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
                                            <EmptyDataTemplate><center>No records found!</center></EmptyDataTemplate>
                                        </asp:GridView>

                                     
                                         <%} %>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="card-header">
                                    <asp:Label ID="Label5" runat="server" Text="Shortlisted List"></asp:Label>
                                    <asp:Button ID="ExportButtonShortlisted" runat="server" OnClick="ExportButtonShortlisted_Click" Text="Export Shortlisted List" class="btn btn-secondary"/>
                                    <asp:Label ID="LabelShortlistExport" runat="server" Text="[NoData]" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="table-responsive">

                                    <asp:GridView ID="GridViewShortlisted" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" Height="284px" OnRowCommand="GridActionShortlist">
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
                                         <EmptyDataTemplate><center>No records found!</center></EmptyDataTemplate>
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
        </form>
    </div>

    <br />
    <br />

</asp:Content>
