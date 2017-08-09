<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Auction.aspx.cs" Inherits="ArtGalleryV2.Account.Auction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label AssociatedControlID="dropdownlist" Visible="false" Text="Select the art for auction: " runat="server" CssClass="col-md-2 control-label" />
            <div class="col-md-10">
                <asp:DropDownList Visible="false" ID="dropdownlist" CssClass="form-control" Width="300px" runat="server">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label AssociatedControlID="start_txtBox" Text="Acution Start Time: "  CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-10">
                <asp:TextBox ID="start_txtBox" TextMode="DateTimeLocal" CssClass="form-control" Width="300px" runat="server" />
            </div>
        </div>
               <div class="form-group">
            <asp:Label AssociatedControlID="end_txtBox" Text="Auction Start Time: "  CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-10">
                <asp:TextBox ID="end_txtBox" Visible="false" TextMode="DateTimeLocal" CssClass="col-md-4 control-label" runat="server" />
            </div>
        </div>
        <asp:Image ID="im" runat="server" />


        <asp:Label ID="textLabel" runat="server" />

        <div class="form-group">
            <div class="col-md-8">
                <asp:Button Text="Set" ID="setbtn" OnClick="setbtn_Click" runat="server" />
                <asp:Label ID="lbl" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
