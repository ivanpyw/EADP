<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="TripDetails.aspx.cs" Inherits="eadLab5.TripDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <p>Expected cost: $<%= trip.tripCost %></p>
                    </div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tripModal<%= trip.tripId %>">
                        View details
                    </button>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="tripModal<%=trip.tripId %>" tabindex="-1" role="dialog" aria-labelledby="tripModal<%=trip.tripId %>" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="text-center modal-title" id="exampleModalLabel"><%=trip.tripTitle %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="carouselTrip<%=trip.tripId %>" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="<%=trip.tripImg %>" alt="First slide"/>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2560,x_0,y_0/dpr_2.0/c_limit,w_740/fl_lossy,q_auto/v1531451526/180712-Weill--The-Creator-of-Pepe-hero_uionjj" alt="Second slide"/>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="https://i.redd.it/pd2h9flg9fmy.png" alt="Third slide"/>
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
                            <p>Estimated cost: <%=trip.tripCost %></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>
