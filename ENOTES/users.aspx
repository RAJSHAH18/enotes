<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="ENOTES.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" DataKeyNames="user_id" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </EditItemTemplate>
                <HeaderTemplate>
                    SELECT
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NAME">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EMAIL">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PASSWORD">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            NO RECORDS WERE FOUND
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
    <asp:Button ID="Button1" CssClass="btn btn-danger" OnClientClick="return confirm('Are You Sure Do You Want To Delete This?')" style="margin-right:355px" Onclick="Button1_Click" runat="server" Text="DELETE" />
        </center>
</asp:Content>
