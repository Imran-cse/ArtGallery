<%@ Page Title="Image Upload" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadArt.aspx.cs" Inherits="ArtGalleryV2.Account.UploadArt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <hr />
        <div class="form-group">
            <asp:Label Text="Choose Image"  CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-3">
                <asp:FileUpload ID="FileUpload" CssClass="form-control" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label Text="Category" AssociatedControlID="category" CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-3">
                <asp:TextBox CssClass="form-control" ID="category" TextMode="SingleLine" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="category"
                    CssClass="text-danger" ErrorMessage="The category field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label Text="Creation Date" AssociatedControlID="creationDate" CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-3">
                <asp:TextBox CssClass="form-control" ID="creationDate" TextMode="Date" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="creationDate"
                    CssClass="text-danger" ErrorMessage="The date is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label Text="Creation Place" AssociatedControlID="creationPlace"  CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-3">
                <asp:TextBox CssClass="form-control" ID="creationPlace" TextMode="SingleLine" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="creationPlace"
                    CssClass="text-danger" ErrorMessage="The creation place field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label Text="Price" AssociatedControlID="price"  CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-3">
                <asp:TextBox CssClass="form-control" ID="price" TextMode="Number" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="price"
                    CssClass="text-danger" ErrorMessage="The price field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" ID="uploadBtn" Text="Upload" OnClick="uploadBtn_Click" CssClass="btn btn-default btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>
