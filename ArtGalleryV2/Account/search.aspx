<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="ArtGalleryV2.Account.auction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-heading">
        <h2>Search Image</h2>
    </div>
    <hr />
    <div class="panel panel-body">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlSearchBy" CssClass="col-md-2 control-label text-right">Search By</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchBy_SelectedIndexChanged" ID="ddlSearchBy" CssClass="form-control" Width="280px">
                    <asp:ListItem Text="Select" Value="-1" />
                    <asp:ListItem Text="Catagory" Value="Catagory" />
                    <asp:ListItem Text="Price" Value="Price" />
                    <asp:ListItem Text="Rating" Value="Rating" />
                    <asp:ListItem Text="Artist" Value="Artist" />
                </asp:DropDownList>

            </div>
        </div>
        
        <div id="divCatagory" runat="server">
            <br />
            <br />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlCatagory" CssClass="col-md-2 control-label text-right">Choose Catagory</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="ddlCatagory" CssClass="form-control" Width="280px">
                        
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div id="divprice" runat="server">
            <br />
            <br />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlprice" CssClass="col-md-2 control-label text-right">Choose Price($)</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="ddlprice" CssClass="form-control" Width="280px">
                        <asp:ListItem Text="Select" Value="-1" />
                        <asp:ListItem Text="10 - 100" Value="1" />
                        <asp:ListItem Text="101 - 500" Value="2" />
                        <asp:ListItem Text="501 - 1000" Value="3" />
                        <asp:ListItem Text="Above 1000 " Value="4" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div id="divrating" runat="server">
            <br />
            <br />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlrating" CssClass="col-md-2 control-label text-right">Choose Rating</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="ddlrating" CssClass="form-control" Width="280px">
                        <asp:ListItem Text="Select" Value="-1" />
                        <asp:ListItem Text="1*" Value="1" />
                        <asp:ListItem Text="2*" Value="2" />
                        <asp:ListItem Text="3*" Value="3" />
                        <asp:ListItem Text="4*" Value="4" />
                        <asp:ListItem Text="5*" Value="5" />

                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div id="divArtist" runat="server">
            <br />
            <br />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlArtist" CssClass="col-md-2 control-label text-right">Choose Artist</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="ddlArtist" CssClass="form-control" Width="280px">
                        
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <%-- <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="search" CssClass="col-md-2 control-label text-right">Search</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="search" CssClass="form-control" Width="280px" placeholder="Type Catagory" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="search"
                    CssClass="text-danger" ErrorMessage="The search field is required." />
            </div>
        </div>--%>
        <br />
        <br />
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="searchbtn_Click" Text="GO" CssClass="btn btn-primary" />
            </div>
        </div>
        <br />
        <br />
        
        <asp:Repeater ID="RepeaterImage" runat="server">
            <ItemTemplate>

                <asp:HiddenField ID="imgId" runat="server" Value='<%# Eval("Id") %>' />
                <asp:ImageButton CssClass="container" ImageUrl='<%# Eval("Image") %>' Width="33%" Height="300px" runat="server" ID="imageButton" OnClick="imageButton_Click" />

            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
