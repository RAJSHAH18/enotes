<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shownotes.aspx.cs" Inherits="ENOTES.shownotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div clas="container">
        <h1 class="text-center" style="font-weight:900;color: #F54952">ALL NOTES</h1>
        <div class="row">
            <div class="col-md-12">
             <asp:Repeater ID="rptNotes" runat="server">
    <ItemTemplate>
        <div class="card mt-3">
            <asp:Image ID="Image1" runat="server" ImageUrl="images/note.jpg" CssClass="card-img-top mt-3 mx-auto" style="max-width:100px" />
            <div class="card-body">
                <h5 class="card-title"><%#Eval("title")%></h5>
                <p><%#Eval("content")%></p>
                <p>
                    <strong class="text-success">Published By : <%= Session["name"]%></strong><br>
                    <strong class="text-primary"></strong>
                </p>
                <p>
                    <strong class="text-success">Published Date: <%#Eval("Id") %></strong><br>
                    <strong class="text-primary"></strong>
                </p>
                <div class="container text-center mt-2">
                <asp:HyperLink runat="server" CssClass="btn btn-danger" NavigateUrl='<%# "deletenotes.aspx?id="+Eval("Id") %>'>DELETE</asp:HyperLink>
                <asp:HyperLink runat="server" CssClass="btn btn-primary" NavigateUrl='<%# "updatenotes.aspx?id="+Eval("Id") %>'>EDIT</asp:HyperLink>

<%--<asp:Button ID="Button2" PostBackUrl="updatenotes.aspx?id=<%#Eval(&quot;Id&quot;) %>" OnClick="Button2_Click" CssClass="btn btn-primary" runat="server" Text="EDIT" Font-Bold="True" />--%>

                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

            </div>
        </div>
        
    </div>
</asp:Content>
