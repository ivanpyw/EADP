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
                    <img src="<%=trip.tripImg %>" class="trip-image"/>
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
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%=trip.tripTitle %>
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
