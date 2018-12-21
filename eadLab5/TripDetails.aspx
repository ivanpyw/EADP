<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="TripDetails.aspx.cs" Inherits="eadLab5.TripDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/SarasaStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="trips-tab">
        <nav class="nav nav-pills nav-justified">
            <a class="nav-item nav-link active" href="#">Immersion trips</a>
            <a class="nav-item nav-link" href="#">Study trips</a>
        </nav>
    </div>
    <form runat="server">
        <div class="container">
            <button class="btn btn-secondary btn-lg add-trip-btn" type="button" data-toggle="modal" data-target="#addModal"><i class="fa fa-plus"></i></button>
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <table class="table table-bordered">
                                <tr>
                                    <td>
                                        Trip title:
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Trip title is required" ControlToValidate="tbAddTitle" Text="*"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbAddTitle" runat="server" placeholder="Trip title" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Trip Location:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Location is required" Text="*" ControlToValidate="tbAddLocation"></asp:RequiredFieldValidator></td>
                                    
                                    <td>
                                        <asp:TextBox ID="tbAddLocation" placeholder="Trip held at" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Images:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Image required" ControlToValidate="tripImageUpload" Text="*"></asp:RequiredFieldValidator></td>
                                    <td><asp:FileUpload ID="tripImageUpload" runat="server" CssClass="form-control-file"/></td>
                                </tr>
                                <tr>
                                    <td>When:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Start date required" ControlToValidate="tbAddStart" Text="*"></asp:RequiredFieldValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="End date required" ControlToValidate="tbAddEnd" Text="*"></asp:RequiredFieldValidator></td>
                                <td><asp:TextBox ID="tbAddStart" runat="server" placeholder="Start date" CssClass="form-control"></asp:TextBox>
                                    to
                                <asp:TextBox ID="tbAddEnd" runat="server" placeholder="End date" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Open to sign up:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Trip open date required" ControlToValidate="tbOpenDay" Text="*"></asp:RequiredFieldValidator></td>
                                    <td><asp:TextBox ID="tbOpenDay" runat="server" placeholder="Students can sign up on" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Activities:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Activities required" ControlToValidate="tbAddActivities" Text="*"></asp:RequiredFieldValidator></td>
                                    <td><asp:TextBox ID="tbAddActivities" runat="server" TextMode="MultiLine" Width="100%" placeholder="Activities to do there" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Estimated cost:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Cost required" ControlToValidate="tbAddCost" Text="*"></asp:RequiredFieldValidator></td>
                                    <td><asp:TextBox ID="tbAddCost" runat="server" placeholder="Estimated Cost" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Trip type:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please select type of trip" ControlToValidate="DdlAddTripType" Text="*"></asp:RequiredFieldValidator></td>
                                    <td>
                                    <asp:DropDownList ID="DdlAddTripType" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="-1">--Selected--</asp:ListItem>
                                        <asp:ListItem Value="1">Study</asp:ListItem>
                                        <asp:ListItem Value="2">Immersion</asp:ListItem>
                                    </asp:DropDownList></td>

                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                Close
                            </button>
                            <asp:Button ID="addTripBtn" runat="server" Text="Add" OnClick="addTrip" CssClass="btn btn-primary" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <% foreach (var trip in tripObj)
                { %>
            <div class="col-md-4">
                <div class="text-center trip-panels">
                    <h4><%= trip.tripTitle %></h4>
                    <img src="<%=trip.tripImg %>" class="trip-image" />
                    <div class="trip-text">
                        <p>Program period: <%=trip.tripStart.ToString("MM/dd/yy") %> to <%= trip.tripEnd.ToString("MM/dd/yy") %></p>
                        <p>Program duration: <%= trip.tripDays %></p>
                        <p>Expected cost: <%= trip.tripCost.ToString("c") %></p>
                        <p>Location: <b><%= trip.tripLocation %></b></p>
                    </div>
                    <button type="button" class="btn btn-primary trip-btn" data-toggle="modal" data-target="#tripModal<%= trip.tripId %>">
                        View details
                    </button>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="tripModal<%=trip.tripId %>" tabindex="-1" role="dialog" aria-labelledby="tripModal<%=trip.tripId %>" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="text-center modal-title"><%=trip.tripTitle %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="carouselTrip<%=trip.tripId %>" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="img-fluid" src="<%=trip.tripImg %>" alt="First slide" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="img-fluid" src="https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2560,x_0,y_0/dpr_2.0/c_limit,w_740/fl_lossy,q_auto/v1531451526/180712-Weill--The-Creator-of-Pepe-hero_uionjj" alt="Second slide" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="img-fluid" src="https://i.redd.it/pd2h9flg9fmy.png" alt="Third slide" />
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselTrip<%=trip.tripId %>" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselTrip<%=trip.tripId %>" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <td>Frequency and duration:</td>
                                        <td><%= trip.tripStart.ToString("MM/dd/yy") %> to <%=trip.tripEnd.ToString("MM/dd/yy") %></td>
                                    </tr>
                                    <tr>
                                        <td>Duration: </td>
                                        <td><%=trip.tripDays %></td>
                                    </tr>
                                    <tr>
                                        <td>Activities: </td>
                                        <td><%=trip.tripActivities %></td>
                                    </tr>
                                    <tr>
                                        <td>Estimated cost: </td>
                                        <td><%=trip.tripCost.ToString("c") %></td>
                                    </tr>
                                    <tr>
                                        <td>In charge:</td>
                                        <td><%=trip.staffHonorifics %> <%=trip.staffName %></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="text-center trip-panels">
                    <h4><%= tripObj[0].tripTitle %></h4>
                    <img src="<%=tripObj[0].tripImg %>" class="trip-image" />
                    <div class="trip-text">
                        <p>Program period: <%=tripObj[0].tripStart.ToString("MM/dd/yy") %> to <%= tripObj[0].tripEnd.ToString("MM/dd/yy") %></p>
                        <p>Program duration: <%= tripObj[0].tripDays %></p>
                        <p>Expected cost: $<%= tripObj[0].tripCost.ToString("c") %></p>
                        <p>Location: <b><%= tripObj[0].tripLocation %></b></p>
                    </div>
                    <button type="button" class="trip-btn btn btn-primary" data-toggle="modal" data-target="#tripModal<%= tripObj[0].tripId+10 %>">
                        View details
                    </button>
                    <br />
                </div>
            </div>
            <div class="modal fade" id="tripModal<%=tripObj[0].tripId+10 %>" tabindex="-1" role="dialog" aria-labelledby="tripModal<%=tripObj[0].tripId+10%>" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="text-center modal-title">Trip title: </h5>
                            <%--<input id="tbTitle" type="text" value="<%=tripObj[0].tripTitle %>" disabled="true"/>--%>
                            <asp:TextBox ID="tbTitle" runat="server" ReadOnly="True"></asp:TextBox>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="carouselTrip<%=tripObj[0].tripId+3 %>" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="trip-modal-img" src="<%=tripObj[0].tripImg %>" alt="First slide" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2560,x_0,y_0/dpr_2.0/c_limit,w_740/fl_lossy,q_auto/v1531451526/180712-Weill--The-Creator-of-Pepe-hero_uionjj" alt="Second slide" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="https://i.redd.it/pd2h9flg9fmy.png" alt="Third slide" />
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselTrip<%=tripObj[0].tripId+3 %>" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselTrip<%=tripObj[0].tripId+3 %>" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <p>
                                When:
                                    <asp:TextBox ID="tbStart" runat="server" ReadOnly="True"></asp:TextBox>
                                to
                                    <asp:TextBox ID="tbEnd" runat="server" ReadOnly="True"></asp:TextBox>
                            </p>
                            <p>
                                Duration:
                                    <asp:TextBox ID="tbDays" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                            </p>
                            <p>
                                Activities:
                                    <asp:TextBox ID="tbActivities" runat="server" ReadOnly="True"></asp:TextBox>
                            </p>
                            <p>
                                Estimated cost:
                                    <asp:TextBox ID="tbCost" runat="server" ReadOnly="True"></asp:TextBox>
                            </p>
                            <asp:TextBox ID="tbId" runat="server" ReadOnly="True" Font-Size="10"></asp:TextBox>
                        </div>
                        <script>
                            document.getElementById("ContentPlaceHolder1_tbId").value = "<%=tripObj[0].tripId%>"
                            document.getElementById("ContentPlaceHolder1_tbTitle").value = "<%=tripObj[0].tripTitle%>";
                            document.getElementById("ContentPlaceHolder1_tbStart").value = "<%=tripObj[0].tripStart.ToString("MM/dd/yy")%>";
                            document.getElementById("ContentPlaceHolder1_tbEnd").value = "<%=tripObj[0].tripEnd.ToString("MM/dd/yy")%>";
                            document.getElementById("ContentPlaceHolder1_tbDays").value = "<%=tripObj[0].tripDays%>";
                            document.getElementById("ContentPlaceHolder1_tbActivities").value = "<%=tripObj[0].tripActivities%>";
                            document.getElementById("ContentPlaceHolder1_tbCost").value = "<%=tripObj[0].tripCost%>";
                        </script>
                        <div class="modal-footer">
                            <asp:Button ID="EnableBtn" runat="server" Text="Enable edit" OnClick="AllowEdit" CausesValidation="False" />
                            <asp:Button ID="UpdateBtn" runat="server" Text="Update" Enabled="False" OnClick="UpdateTrip" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
