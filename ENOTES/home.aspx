<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ENOTES.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container-fluid p-0">
            <div class="card  py-5">
                <div class="card-body text-center">
                    <asp:Image ID="Image1" CssClass="img-fluid mx-auto" style="max-width:330px"  ImageUrl="~/images/back.png" runat="server" />
                    <h1 style="font-weight:900">START YOUR NOTES</h1>
                    <asp:HyperLink ID="HyperLink1" CssClass="btn btn-outline-primary"  NavigateUrl="~/addnotes.aspx" runat="server"> START WRITING</asp:HyperLink>
                </div>
                
            </div>
            
        </div>
</asp:Content>
