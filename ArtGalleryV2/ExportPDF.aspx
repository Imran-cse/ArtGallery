<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExportPDF.aspx.cs" EnableEventValidation="false" Inherits="ArtGalleryV2.ExportPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
   <div class="panel col-md-12">
       <asp:Button Text="Download PDF" CssClass="btn btn-primary" ID="btnExport" OnClick="btnExport_Click" runat="server" />
       <asp:GridView runat="server" ID="gvImage" AutoGenerateColumns="false" CssClass="table table-responsive" GridLines="None">
           <Columns>
               <asp:TemplateField>
                   <HeaderTemplate>
                       <asp:Label Text="Images" runat="server" />
                   </HeaderTemplate>
                   <ItemTemplate>
                       <asp:Image ImageUrl='<%# Eval("Image") %>' runat="server" Height="500px" Width="500px" />
                   </ItemTemplate>
               </asp:TemplateField>
              
           </Columns>
       </asp:GridView>
   </div>
</asp:Content>
