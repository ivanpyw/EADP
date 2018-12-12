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
    <div class="container">
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
                                        <img class="d-block w-100" src="<%=trip.tripImg %>" alt="First slide" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2560,x_0,y_0/dpr_2.0/c_limit,w_740/fl_lossy,q_auto/v1531451526/180712-Weill--The-Creator-of-Pepe-hero_uionjj" alt="Second slide" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="https://i.redd.it/pd2h9flg9fmy.png" alt="Third slide" />
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
                            <p>Frequency and duration: <%= trip.tripStart.ToString("MM/dd/yy") %> to <%=trip.tripEnd.ToString("MM/dd/yy") %></p>
                            <p>Duration: <%=trip.tripDays %></p>
                            <p>Activities: <%=trip.tripActivities %></p>
                            <p>Estimated cost: <%=trip.tripCost.ToString("c") %></p>
                            <p>In charge: <%=trip.staffHonorifics %> <%=trip.staffName %></p>
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
                    </div>
                    <button type="button" class="trip-btn btn btn-primary" data-toggle="modal" data-target="#tripModal<%= tripObj[0].tripId+3 %>">
                        View details
                    </button>
                </div>
            </div>
            <div class="modal fade" id="tripModal<%=tripObj[0].tripId+3 %>" tabindex="-1" role="dialog" aria-labelledby="tripModal<%=tripObj[0].tripId+3 %>" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form runat="server">
                            <div class="modal-header">
                                <h5 class="text-center modal-title">Trip title: </h5>
                                <%--<input id="tbTitle" type="text" value="<%=tripObj[0].tripTitle %>" disabled="true"/>--%>
                                <asp:TextBox ID="tbTitle" runat="server" Text='Empty' ReadOnly="True"></asp:TextBox>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div id="carouselTrip<%=tripObj[0].tripId+3 %>" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100" src="<%=tripObj[0].tripImg %>" alt="First slide" />
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
                                <p>Frequency and duration: <asp:TextBox ID="tbFrequency" runat="server" Text='Empty' ReadOnly="True"></asp:TextBox></p>
                                <p>Duration: <asp:TextBox ID="tbDays" runat="server" Text='Empty' ReadOnly="True"></asp:TextBox></p>
                                <p>Activities: <asp:TextBox ID="tbActivities" runat="server" Text='Empty' ReadOnly="True"></asp:TextBox></p>
                                <p>Estimated cost: <asp:TextBox ID="tbCost" runat="server" Text='Empty' ReadOnly="True"></asp:TextBox></p>
                            </div>
                            <script>
                                document.getElementById("ContentPlaceHolder1_tbTitle").value = "<%=tripObj[0].tripTitle%>";
                                document.getElementById("ContentPlaceHolder1_tbFrequency").value = "<%=tripObj[0].tripStart.ToString("MM/dd/yy")%> to <%=tripObj[0].tripEnd.ToString("MM/dd/yy") %>";
                                document.getElementById("ContentPlaceHolder1_tbDays").value = "<%=tripObj[0].tripDays%>";
                                document.getElementById("ContentPlaceHolder1_tbActivities").value = "<%=tripObj[0].tripActivities%>";
                                document.getElementById("ContentPlaceHolder1_tbCost").value = "<%=tripObj[0].tripCost.ToString("c")%>";
                            </script>
                            <div class="modal-footer">
                                <asp:Button ID="EnableBtn" runat="server" Text="Enable edit" OnClick="AllowEdit" CausesValidation="False"/>
                                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Enabled="False" OnClick="UpdateTrip" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
