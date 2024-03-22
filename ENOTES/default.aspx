<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ENOTES._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .back-video
                {
                    position: absolute;
                    right:0;
                    bottom:0;
                    z-index:-1;
                }
                @media(min-aspect-ratio:16/9)
                {
                    .back-video
                    {
                        width:100%;
                        height:auto;       
                    }
                }
                 @media(max-aspect-ratio: 16/9)
                {
                    .back-video
                    {
                        width:auto;
                        height:100%;       
                    }
                }
                .content
                {
                    text-align: center;
                    font-family: 'Poppins',sans-serif;
                    margin-top:10%;
                }
                .content h1{
                    font-size: 4rem;
                    font-weight: 600;
                    /*color:;*/
                     background: linear-gradient(to right, #f32170,
                    #ff6b08, #cf23cf, #eedd44);
                    -webkit-text-fill-color: transparent;
                    -webkit-background-clip: text;
                    transition: 0.5s;
                    
                }
                .content h1:hover
                {
                    -webkit-text-stroke: 2px #fff;
                    color:transparent;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  <video autoplay loop muted plays-inline class="back-video">
        <source src="video1.mp4" type="video/mp4">
        
    </video>--%>
    <div class="content" >
        <h1>E-NOTES SAVE YOUR NOTES</h1>
    </div>
</asp:Content>
