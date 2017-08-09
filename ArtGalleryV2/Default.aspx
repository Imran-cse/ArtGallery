<%@ Page Title="Art Gallery" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ArtGalleryV2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Animation.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <svg viewBox="0 0 960 300">
                <symbol id="s-text">
                    <text text-anchor="middle" x="50%" y="80%"><%: Title %> </text>
                </symbol>

                <g class="g-ants">
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                </g>
            </svg>
        </div>
    </div>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <asp:Repeater ID="RepeaterImages" runat="server">
        <ItemTemplate>
            <%--<asp:HyperLink ImageUrl='<%# Container.DataItem %>' NavigateUrl="~/ViewImage.aspx?" runat="server" ID="Hyperlink1" />            --%>
            <%--<asp:Image ID="Image" runat="server" ImageUrl='<%# Container.DataItem %>' Height="300px" Width="400px" />        --%>
            <%--<asp:HiddenField ID="imgId" runat="server" Value='<%# Eval("hfImgId") %>' />--%>
            <asp:HiddenField ID="imgId" runat="server" Value='<%# Eval("Id") %>' />
            <asp:ImageButton CssClass="img-thumbnail" ImageUrl='<%# Eval("Image") %>' Width="33%" Height="300px" runat="server" ID="imageButton" OnClick="imageButton_Click"/>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>