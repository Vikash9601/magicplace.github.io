

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="log.aspx.cs" Inherits="log" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
     </style>
    
      <script src="jquery-3.4.1.js"></script>
    <script src="bootstrap.min.js"></script>
    
    <script src="https://kit.fontawesome.com/6d17d89b76.js"></script>
    <link rel="stylesheet"  href="w3.css"/>

    <link rel="stylesheet" href="bootstrap.css" />
        <style>
body {
  font-family:Garamond;
   
      background-image:url("laginbackground.jpg"); 
      background-size:cover;
     
        
    background-attachment:fixed;
    
        
    
}



           .login_design {
          border-style:groove;
          border-radius:2ch;
         border-width:1ch;
         margin-left:10ch;
         margin-right:50ch;
         margin-top:4ch;
         margin-bottom:2ch;
         padding-left:12ch;
         padding-right:8ch;
         padding-bottom:5ch;
         padding-top:7ch;
         border-color:skyblue;
        position:fixed;
        background-color:white;
        
          
           }
            
            .logo {
            font-size:5ch;
            font-family:Gabriola;
           color:white;
            
            }
            .pa {
            font-family:Gabriola;
            font-size:4ch;
            
            }
            .setlink:hover {
            color:blue;
            }
           
 

    </style>

     <meta name="google-signin-client_id" content="780404107371-f6ak1r4g4s93q76uc8mnvaho52hu9u0g.apps.googleusercontent.com" />
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
  </script>
  <script src="https://apis.google.com/js/client:platform.js?onload=start" async="async" defer="defer">
  </script>

     <script>
         function start() {
             gapi.load('auth2', function () {
                 auth2 = gapi.auth2.init({
                     client_id: '780404107371-f6ak1r4g4s93q76uc8mnvaho52hu9u0g.apps.googleusercontent.com'
                 });
             });
         }
  </script>

  
</head>
<body>
    <form id="form1" runat="server">
        <div class="logo">  

            <nav>

                <div class="w3-hover-text-blue">&nbsp&nbsp&nbsp&nbsp<u>Magicplace</u></div>
            </nav>
             <label id="lblexcep" runat="server" style="margin-left:5ch;color:azure;"></label>
        </div>
        
       


        <div class="w3-card-4 login_design">
            
        <asp:Label ID="lberror" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large"></asp:Label>
           <asp:Label ID="lbstatus" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="white" ></asp:Label>
            
           <p class="w3-center w3-hover-text-blue pa"><u>Sign in</u></p>
      
         <%-- <label><b><i>Mobile no.</i></b></label>--%>
            <asp:scriptmanager ID="Scriptmanager1" runat="server"></asp:scriptmanager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                     <asp:TextBox ID="txtid" CssClass="w3-input w3-border w3-round-xxlarge" AutoCompleteType="Disabled"  runat="server" placeholder="Enter your Mobile No. or Email" required="required" Height="35px" Width="320" OnTextChanged="txtid_TextChanged" AutoPostBack="True"></asp:TextBox>
                  
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:Label ID="lbltxt" runat="server" Font-Bold="True" ForeColor="red"></asp:Label>
                </ContentTemplate>
                 <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="txtid" EventName="TextChanged" />

             </Triggers>

            </asp:UpdatePanel>
           
            <br />
      
            <div class="w3-cell">
            <%--<label><b><i>Password</i></b></label>--%><asp:TextBox ID="txtpwd" ClientIDMode="Static" CssClass="w3-input w3-border w3-round-xxlarge pass" runat="server" required="required" placeholder="Enter your password" Height="35px" Width="320" TextMode="Password"> </asp:TextBox>
               </div>
            <div class="w3-cell">
               
                <%--<asp:UpdatePanel ID="upd" runat="server">
                    <ContentTemplate>--%>
 <button id="sh" class="w3-hover-red" style="font-size:24px;border-radius:20px;background-color:white;color:red;" onclick="return false" ><i id="icon" class="fa fa-eye" aria-hidden="true"></i></button>
               
                  <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>
              </div>
           
         
            <br />
            <br />
            &nbsp
            &nbsp
            <asp:CheckBox ID="chkrem" CssClass="w3-hover-text-blue" runat="server" Text="Remember me" Font-Bold="True" Font-Size="Large"/>
            &nbsp
            &nbsp
            &nbsp
        
            <asp:LinkButton ID="LinkButton1" CssClass="w3-hover-text-blue" runat="server" Text="Forgot password" Font-Size="Large" OnClick="LinkButton1_Click"></asp:LinkButton>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="w3-hover-text-blue" Text="LOGIN" BackColor="Red" ForeColor="White" BorderStyle="Groove" Height="40px" Width="300px" OnClick="Button1_Click" />
         <br />
            <br />
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:LinkButton ID="lk" CssClass="setlink" runat="server" Text="Are you new here?Sign up" Font-Bold="True" Font-Italic="False" Font-Names="Gabriola" Font-Size="X-Large" OnClick="lk_Click" PostBackUrl="~/registration.aspx">Are you new here?Sign up</asp:LinkButton>
            <br />
            <br />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  <%-- <button id="signinButton">Sign in with Google</button>--%>

          
             <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
       

    </form>
  <script>
      //$(document).ready(function () {
      //    $('#sh').click(function show() {
      //        //Change the attribute to text  
      //        $('.pass').attr('type', 'password');
      //        $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
      //    },
      //    function () {
      //        //Change the attribute back to password  
      //        $('.pass').attr('type', 'text');
      //        $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
      //    });
       
      //    });


      $("#sh").click(function() {

          var s = document.getElementById("txtpwd");
          var k=document.querySelector("#icon");
          if (s.type === "password") {
              s.type = "text";
              //k.classList.remove("fa fa-eye-slash");
              //k.classList.add("fa fa-eye");
           
              $('#icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
             // alert("yes");
          }
          else{
              s.type = "password";
              //k.classList.remove("fa fa-eye");
              //k.classList.add("fa fa-eye-slash");
             $('#icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
             // alert("no");
          }
         

      });

      $('#signinButton').click(function () {
          // signInCallback defined in step 6.
          auth2.grantOfflineAccess().then(signInCallback);
      });

      function signInCallback(authResult) {

          if (authResult['code']) {

              // Hide the sign-in button now that the user is authorized, for example:
              $('#signinButton').attr('style', 'display: none');

              $.ajax({
                  type: 'post',
                  url: 'log.aspx/checklog',
                  headers: {
                      'X-Requested-With': 'XMLHttpRequest'
                  },
                  contentType: 'application/octet-stream; charset=utf-8',

                  processData: false,
                  data: JSON.stringify({ 'datas': authResult['code'] }),


                  success: function (response) {
                      console.log(response.d);
                      console.log(authResult['code']);
                  },
                  error: function (response) {
                      alert(response.d + "dsvsvsd");

                  }

              });

          }
          else {

              alert("sorry");
          }
      }
         
 

  </script>
</body>
</html>
