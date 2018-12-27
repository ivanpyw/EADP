<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="EditTripDetails.aspx.cs" Inherits="eadLab5.EditTripDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container">
            <table class="table table-bordered">
                <tr>
                    <td>Trip title:<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Trip title is required" ControlToValidate="tbUpdateTitle" Text="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="tbUpdateTitle" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Trip location:<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Location is required" Text="*" ControlToValidate="ddlUpdateLocation" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:DropDownList ID="ddlUpdateLocation" runat="server" CssClass="form-control" Enabled="False"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Image:<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Image required" ControlToValidate="tripUploadImg" Text="*" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:FileUpload ID="tripUploadImg" runat="server" Enabled="False" />
                        <asp:Image ID="tripImage" runat="server" CssClass="img-thumbnail"/>
                </tr>
                <tr>
                    <td>From:<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Trip start date must be before trip end date" ValidationGroup="2" Text="*"></asp:CustomValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Start date required" ControlToValidate="tbUpdateStart" Text="*" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="tbUpdateStart" runat="server" ReadOnly="True" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>To:<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" Text="*" ValidationGroup="2" ErrorMessage="End date required" ControlToValidate="tbUpdateEnd"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="tbUpdateEnd" runat="server" ReadOnly="True" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Open to sign up:<asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Trip open date must be before trip start date" ValidationGroup="2" Text="*"></asp:CustomValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Trip open date required" ControlToValidate="tbUpdateOpeningDay" Text="*" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="tbUpdateOpeningday" runat="server" ReadOnly="True" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Activities:<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Activities required" ControlToValidate="tbUpdateActivities" Text="*" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="tbUpdateActivities" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Estimated cost:<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Cost required" ControlToValidate="tbUpdateCost" Text="*" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="tbUpdateCost" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Trip type:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Type of trip required" ControlToValidate="DdlUpdateType" Text="*" InitialValue="-1"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:DropDownList ID="DdlUpdateType" CssClass="form-control" runat="server" Enabled="False">
                            <asp:ListItem Selected="True" Value="-1">--Selected--</asp:ListItem>
                            <asp:ListItem Value="Study">Study</asp:ListItem>
                            <asp:ListItem Value="Immersion">Immersion</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
                <asp:Button ID="EnableBtn" runat="server" Text="Enable edit" OnClick="AllowEdit" CausesValidation="False" CssClass="btn btn-secondary" />
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Enabled="False" OnClick="UpdateTrip" CssClass="btn btn-success" />
                <%--<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteWarning">Delete</button>--%>
                <asp:Button ID="CancelBtn" runat="server" Text="Cancel trip" CssClass="btn btn-danger" data-toggle="modal" data-target="#deleteWarning" CausesValidation="False" UseSubmitBehavior="False" OnClientClick="return false;" Enabled="False" />
        </div>
        <div class="modal fade" id="deleteWarning" tabindex="-1" role="dialog" aria-labelledby="deleteWarningLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="alert alert-danger">
                                Warning <i class="fas fa-exclamation-triangle"></i>
                                <p>Cancelling this trip will notify all students who have signed up for the trip</p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="DelTrip" runat="server" Text="Cancel trip and notify" CausesValidation="False" OnClick="DelTrip_Click" CssClass="btn btn-danger"/>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</asp:Content>
