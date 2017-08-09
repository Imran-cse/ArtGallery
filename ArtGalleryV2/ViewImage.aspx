<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewImage.aspx.cs" Inherits="ArtGalleryV2.ViewImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>

        <link href="Content/bootstrap.min.css" rel="stylesheet" />
        <link href="Content/star-rating.css" rel="stylesheet" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="Content/star-rating.js"></script>

        <script>  
            $(document).ready(function () {
                $("#rating").on("rating.change", function (event, value, caption) {

                    var ratingValue = $('#<%=hdfRatingValue.ClientID%>').val();
                    ratingValue = value;
                    alert(ratingValue);
                    alert("Your rating has been saved.");
                    
                   
                });
            });
        </script>
    </div>

    <div class="col-md-12">
        <div class="panel col-md-6">
            <asp:Image ID="image" ImageUrl='<%# Eval("Image") %>' runat="server" Height="500px" Width="600px" />
        </div>
        <div class="panel col-md-5 col-md-offset-1">
            <div class="form-group">
                <asp:Label Text="Name" runat="server" CssClass="col-md-4 control-label" />
                <div class="col-md-6">
                    <asp:Label ID="Name" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="Catagory" runat="server" CssClass="col-md-4 control-label" />
                <div class="col-md-6">
                    <asp:Label ID="Catagory" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="Creation Date" runat="server" CssClass="col-md-4 control-label" />
                <div class="col-md-6">
                    <asp:Label ID="creationDate" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="Creation Place" runat="server" CssClass="col-md-4 control-label" />
                <div class="col-md-6">
                    <asp:Label ID="creationPlace" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="Price($)" runat="server" CssClass="col-md-4 control-label" />
                <div class="col-md-6">
                    <asp:Label ID="Price" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="Avg Rating" runat="server" CssClass="col-md-4 control-label" />
                <div class="col-md-6">
                    <asp:Label ID="AvgRating" runat="server" />
                </div>
            </div>
            <div class="form-group">
                
                <div class="col-md-6">

                    
                    <input id="rating" value="0" AutoPostBack="true" runat="server" type="number" class="rating" min="0" max="5" step="0.5" data-size="xs" />
                    <hr>
                     <asp:HiddenField  ID="hdfRatingValue" runat="server"/>
                    <asp:button runat="server" ID="submitRating" Text="submit" OnClick="submitRating_Click" CssClass="btn btn-primary"></asp:button>
                </div>
            </div>

           <%--<div class="form-group">
               <asp:Label Text="Rating" runat="server"  CssClass="col-md-4 control-label"/>
               <div class="col-md-6">
                   <h1>Star Rating</h1>
                   
                       <fieldset>
                           <span class="star-cb-group">
                               <input type="radio" id="rating-5" name="rating" value="5" /><label for="rating-5">5</label>
                               <input type="radio" id="rating-4" name="rating" value="4" checked="checked" /><label for="rating-4">4</label>
                               <input type="radio" id="rating-3" name="rating" value="3" /><label for="rating-3">3</label>
                               <input type="radio" id="rating-2" name="rating" value="2" /><label for="rating-2">2</label>
                               <input type="radio" id="rating-1" name="rating" value="1" /><label for="rating-1">1</label>
                               <input type="radio" id="rating-0" name="rating" value="0" class="star-cb-clear" /><label for="rating-0">0</label>
                           </span>
                       </fieldset>
                   
               </div>
           </div>--%>
           
            
        </div>
    </div>


</asp:Content>
