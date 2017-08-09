<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ArtGalleryV2.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

       <p class="page-header" style="font-size:x-large" runat="server">Your Info</p>
        <div class="form-group">
            <asp:Label Text="Name:" runat="server" CssClass="col-md-2 control-label" />
            <div class="col-md-10">
                <asp:Label ID="lblName" Text="text" runat="server" CssClass="control-label" />
            </div>          
        </div>
         <div class="form-group">
            <asp:Label Text="Email" runat="server" CssClass="col-md-2 control-label" />
             <div class="col-md-10">
                 <asp:Label ID="lblEmail" Text="text" runat="server" CssClass="control-label" />
             </div>            
        </div>
        <div class="form-group">
            <asp:Label Text="Gender" runat="server" CssClass="col-md-2 control-label" />
             <div class="col-md-10">
                 <asp:Label ID="lblsex" Text="text" runat="server" CssClass="control-label" />
             </div>            
        </div>
         <div class="form-group">
            <asp:Label Text="PhoneNo" runat="server" CssClass="col-md-2 control-label" />
             <div class="col-md-10">
                 <asp:Label ID="lblPhoneNo" Text="text" runat="server" CssClass="control-label" />
             </div>            
        </div>
        <div class="form-group">
            <asp:Label Text="BirthDate" runat="server" CssClass="col-md-2 control-label" />
             <div class="col-md-10">
                 <asp:Label ID="lblBirthDate" Text="text" runat="server" CssClass="control-label" />
             </div>            
        </div>
         <div class="form-group">
            <asp:Label Text="Address" runat="server" CssClass="col-md-2 control-label" />
             <div class="col-md-10">
                 <asp:Label ID="lblAddress" Text="text" runat="server" CssClass="control-label" />
             </div>            
        </div>
    </div>
    <hr />
         <div class="form-group">
            <div class="col-md-offset-2 col-md-6">
                <input type="button" id="btn" value="PDF" class="btn btn-primary" onclick="window.print();">

            </div>

        </div>
</asp:Content>
