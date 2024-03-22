<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ENOTES.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
     *{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body{
    background-color: #0c1022;

}
.content{
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    letter-spacing: 1px;
}
.login_form_container{
    position: relative;
    width: 450px;
    height: 500px;
    max-width: 400px;
    max-height: 700px;
    background: #040717;
    border-radius: 50px 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    margin-top: 50px;

}
.login_form_container::before{
    
    position: absolute;
    width: 170%;
    height: 170%;
    content: '';
    background-image: conic-gradient(transparent, transparent, transparent, #ee00ff);
    animation: rotate_border 6s linear infinite;

}
.login_form_container::after{
    
    position: absolute;
    width: 170%;
    height: 170%;
    content: '';
    background-image: conic-gradient(transparent, transparent, transparent, #00ccff);
    animation: rotate_border 6s linear infinite;
    animation-delay: -3s;
}
@keyframes rotate_border{
    0%{
        transform: rotate(0deg);
    }
    100%{
        transform: rotate(360deg);
    }
}
.login_form{
    position: absolute;
    content: '';
    background-color: #0c1022;
    border-radius: 50px 5px;
    inset: 5px;
    padding: 50px 40px;
    z-index: 10;
    color: #00ccff;

} 
h2{
    font-size: 40px;
    font-weight: 600;
    text-align: center;
}
.input_group{
    margin-top: 25px;
    position:relative;
    display:flex;
    align-items: center;
    justify-content: start;
}
.input_text{
    width: 95%;
    height: 30px;
    background: transparent;
    border: none;
    outline: none;
    border-bottom: 1px solid #00ccff;
    font-size: 20px;
    padding-left: 10px;
    color: #00ccff;

}
::placeholder{
    font-size: 15px;
    color: #00ccff52;
    letter-spacing: 1px;

}
.fa{
    font-size: 20px;

}
#login_button{
    position: relative;
    width: 300px;
    height: 40px;
    transition: 1s;
    margin-top: 50px;


}
#login_button .submit_login{
    position: absolute;
    width: 100%;
    height: 100%;
    text-decoration: none;
    z-index: 10;
    cursor: pointer;
    font-size: 22px;
    letter-spacing: 2px;
    border: 1px solid #00ccff;
    border-radius: 50px;
    background-color: #0c1022;
    display: flex;
    justify-content: center;
    align-items: center;
}
.fotter {
    margin-top: 10px;
    display: flex;
    justify-content: center;

}
.fotter a{
    text-decoration: none;
    cursor: pointer;
    font-size: 18px;
}
.glowIcon {
    text-shadow: 0 0 10px #00ccff;

}
.submit_login
{
    color:#00ccff;
}
.validation
{
    padding-left:20px;
    
}
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
    <div class="login_form_container">
      <div class="login_form">
          
              <%
                  if(Session["email_error"]!=null)
                  {
             %>
                         <div class="alert alert-danger" role="alert"> <%= Session["email_error"] %> </div>
                        <style>
                            .input_group 
                            {
                                margin-top:15px;
                            }
                            #login_button{
                                margin-top:30px;
                            }
                        </style>
                        
            <%
                    Session.Remove("email_error");
                  }

             %>

            <%
                  if(Session["success_register"]!=null)
                  {
             %>
                      <div class="alert alert-success " role="alert" style="font-size:x-small;font-weight:900" ><%=Session["success_register"]%>,FOR LOGIN <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">Click</asp:HyperLink></div>   

                        <style>
                            .input_group 
                            {
                                margin-top:15px;
                            }
                            #login_button{
                                margin-top:30px;
                            }
                        </style>
                        
            <%
                    Session.Remove("success_register");
                  }

             %>
            <%
                  if(Session["fail_register"]!=null)
                  {
             %>
                      <div class="alert alert-danger" role="alert"><%=Session["fail_register"]%></div>   

                        <style>
                            .input_group 
                            {
                                margin-top:15px;
                            }
                            #login_button{
                                margin-top:30px;
                            }
                        </style>
                        
            <%
                    Session.Remove("fail_register");
                  }

             %>

          
        <h2>SIGN-UP</h2>
          <div class="input_group">
            <i class="fa fa-user"></i>
          
            <asp:TextBox ID="txt_username" TextMode="Singleline" CssClass="input_text" runat="server" autocomplete="off" placeholder="Name"></asp:TextBox>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="validation" runat="server" ErrorMessage="* Please Enter Username" ControlToValidate="txt_username" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Font-Size="Small" ></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="validation" runat="server" ErrorMessage="* Username Only Contains(A-Za-z)" ControlToValidate="txt_username" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[A-Za-z ]*$" Font-Size="Small"></asp:RegularExpressionValidator>
 
        <div class="input_group">
            <i class="fa fa-envelope"></i>
          <%--<input
            type="text"
            placeholder="Username"
            class="input_text"
            autocomplete="off"
          />--%>
            <asp:TextBox ID="txt_email" TextMode="Email" CssClass="input_text" runat="server" autocomplete="off" placeholder="Email"></asp:TextBox>
        </div>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation" runat="server" ErrorMessage="* Please Enter Email-ID" ControlToValidate="txt_email" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Font-Size="Small" ></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="validation" runat="server" ErrorMessage="* Invalid Email Fromat" ControlToValidate="txt_email" Display="Dynamic" Font-Bold="True" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

        <div class="input_group">
          <i class="fa fa-unlock-alt"></i>
          <%--<input
            type="password"
            placeholder="Password"
            class="input_text"
            autocomplete="off"
          />--%>
            <asp:TextBox ID="txt_password" CssClass="input_text" runat="server" TextMode="Password" autocomplete="off" placeholder="Password" ToolTip="Password Sholuld Only Contains ('A-Z','a-zy','_')"></asp:TextBox>
            <span onclick="togglePassword()" style="cursor: pointer;">
                <i id="showPasswordIcon" class="fa fa-eye"></i>
            </span>
        </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation" runat="server" ErrorMessage="* Please Enter Password" ControlToValidate="txt_password" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Font-Size="Small" ></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" CssClass="validation" runat="server" ErrorMessage="* Password must be of 6 or more chars" ControlToValidate="txt_password" Display="Dynamic" Font-Bold="True"  ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[A-Za-z0-9_]{6,}$" Font-Size="Small" ToolTip="Password Sholuld Only Contains ('A-Z','a-z','0-9')"></asp:RegularExpressionValidator>

        <div class="button_group" id="login_button">
            <asp:Button ID="submit" runat="server" OnClick="submit_click" CssClass="submit_login"  Text="REGISTER" />
        </div>
        <div class="fotter">
          <a  href="login.aspx">ALREADY HAVE AN ACCOUNT?</a>
        </div>
      </div>
    </div>
</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">
        function togglePassword() {
            var passwordTextbox = document.getElementById("<%=txt_password.ClientID%>");
            var passwordIcon = document.getElementById("showPasswordIcon");
            if (passwordTextbox.type === "password") {
                passwordTextbox.type = "text";
                passwordIcon.classList.remove("fa-eye");
                passwordIcon.classList.add("fa-eye-slash");
            } else {
                passwordTextbox.type = "password";
                passwordIcon.classList.remove("fa-eye-slash");
                passwordIcon.classList.add("fa-eye");
            }
        }
    </script>

    <script>
        $(".input_text").focus(function () {
            $(this).prev('.fa').add('glowIcon')
        })
        $(".input_text").focusout(function () {
            $(this).prev('.fa').removeClass('glowIcon')
        })
    </script>
</asp:Content>
