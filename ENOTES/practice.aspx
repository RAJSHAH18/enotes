<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="practice.aspx.cs" Inherits="ENOTES.practice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-tAPi3r3Z9aP5f5ueW7kR/zNN+jpV7KjYlnm1WkwR8DNBxMh9XZttTZ/YO2G6C3q6zFrU6h+Y6zgFFTRd+yKfsg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .password-field {
            position: relative;
        }

        .password-field:after {
            content: "\f06e";
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            font-size: 16px;
            color: #999999;
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="password-field"></asp:TextBox>
        </div>
    </form>
</body>
</html>
