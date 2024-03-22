<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="ENOTES.addnotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p-0">
             <h1 class="text-center" style="font-weight:900;color: #F54952">ADD YOUR NOTES</h1>
             <div class="container">
                  <div class="row">
                <div class="col-md-12">
                    
                    
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="TITLE" Font-Bold="True"></asp:Label>
                            <asp:TextBox ID="txt_title" CssClass="form-control" placeholder="Enter Title..." runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* PLEASE ENTER TITLE" ControlToValidate="txt_title" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group"> 
                            &nbsp;<asp:Label ID="Label2" runat="server" Text="CONTENT" Font-Bold="True"></asp:Label>
                            <asp:TextBox ID="txt_content" runat="server" TextMode="MultiLine" Rows="9" CssClass="form-control" placeholder="Enter Content...." ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* PLEASE ENTER CONTENT" ControlToValidate="txt_content" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                        </div>     
                        
                        <div class="container text-center mt-4 mb-5">
                        
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="ADD NOTES" />
                            
                        </div>
                        
                </div>
                
            </div>
                 
             </div>
            
        </div>
</asp:Content>
