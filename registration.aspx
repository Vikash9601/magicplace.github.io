<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="red" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
       <link rel="stylesheet" href="bootstrap.css" />

    
    <link rel="stylesheet"  href="w3.css"/>

       <style>
body {
  font-family:Garamond;
   
         background-image:url("image/registrationbackground.jpg"); 
         background-size:cover;
    background-attachment:fixed;
}
           #form1 {
          border-style:groove;
          border-radius:20px;
          border-width:3px;
          margin-left:25ch;
          margin-right:25ch;
          position:fixed;
           
           
           }

/*.split {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 10px;
}

.left {
  left: 0;
  
}

.right {
  right: 0;
}

.centered {
  position: absolute;
  top: auto;
  left: auto;
  transform: translate(-50%, -50%);
  text-align: center;
 
}

.centered img {
  width: 150px;
  border-radius: 70%;
}*/

           /*.bor {
          border:groove;
         border-width:50px;
         padding-left:15px;
         padding-right:15px;
         margin-left:5px;
         margin-right:5px;
         background-color:white;
           
           }
           .siz {
           font-size:3ch;
           display: inline-block;
          
           
           }
           .xy {
           font-size:10ch;

           
           }
           .xz {
           font-size:larger;
           list-style:square;
           font-style:italic;
           color:navy;
          
           }*/
             .logo {
            font-size:5ch;
            font-family:Gabriola;
           color:white;
            
            }
           #cd {
           font-size:3ch;
            font-family:Gabriola;
           color:white;
           }
           #cd1 {
             font-size:4ch;
            font-family:Gabriola;
           color:white;
           
           }
           
    </style>
 
   
</head>
<body>
 <div class="logo">
            <nav>
                <div class="navbar-brand">&nbsp&nbsp&nbsp<u>Magicplace</u></div>
            </nav>
        </div>
    <form id="form1" runat="server" class="w3-container">
        
         <div class="split right">
          <div class="center siz">
  <span id="cd1" class="w3-center w3-hover-text-blue"><u>Sign up</u></span>
              <br />
 
                <span id="cd">Name</span><%--<asp:TextBox id="txtname" runat="server" Height="30" Width="320" placeholder="Your name.." BorderColor="#CC99FF" BorderStyle="Ridge"></asp:TextBox>--%>
             <p><input class="w3-input w3-border w3-round-xxlarge" type="text" id="txtname" placeholder="Your full name.." size="10" runat="server"/></p>
                  <asp:RequiredFieldValidator ID="rname" runat="server" ErrorMessage="user's name is required" ControlToValidate="txtname" ForeColor="White" Font-Size="Medium"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="reaname" runat="server" ErrorMessage="invalid way of name" ControlToValidate="txtname" ValidationExpression="^[a-zA-Z ]*$" ForeColor="White" Font-Size="Medium"></asp:RegularExpressionValidator>
                <br />
                
                 <span id="cd"> E-mail:</span><%--<asp:TextBox id="txtemail" runat="server" Height="30" Width="320" placeholder="Your Email.." BorderColor="#CC99FF" BorderStyle="Ridge"></asp:TextBox>--%>
              <input class="w3-input w3-border w3-round-xxlarge" type="email" id="txtemail" placeholder="Your Email.." runat="server" required="required"/>
            <%--  <asp:RequiredFieldValidator ID="rmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtemail" ForeColor="White" Font-Size="Medium"></asp:RequiredFieldValidator>    --%>
              <asp:RegularExpressionValidator ID="remail" runat="server" ErrorMessage="Invalid email" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="White" Font-Size="Medium"></asp:RegularExpressionValidator>
          <br />
                  
                 
               <%--<label><i>Contact no:</i></label>--%><%--<asp:TextBox id="txtcontact" runat="server" Height="25" Width="320" placeholder="Your contact no.." BorderColor="#CC99FF" BorderStyle="Ridge"></asp:TextBox>--%>
             <span id="cd">contact no.</span><input class="w3-input w3-border w3-round-xxlarge" type="text"  id="txtcontact" placeholder="Your contact no.." runat="server"/>
              <asp:RequiredFieldValidator ID="rcon" runat="server" ErrorMessage="contact no. is required " ControlToValidate="txtcontact" ForeColor="White" Font-Size="Medium"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="recon" runat="server" ErrorMessage="Invalid contact no. or size could be more or less than 10 digits" ControlToValidate="txtcontact" ValidationExpression="[0-9]{10}" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="White"></asp:RegularExpressionValidator>
         
                  <br />
                 <%--<asp:TextBox id="txtpa" runat="server" Height="25" Width="320" placeholder="Enter strong password" BorderColor="#CC99FF" BorderStyle="Ridge" TextMode="Password"></asp:TextBox>--%>
          <span id="cd">Password</span><input class="w3-input w3-border w3-round-xxlarge" type="password" id="txtpa" placeholder="Enter strong password" runat="server"/>
              <asp:RequiredFieldValidator ID="rpwd" runat="server" ErrorMessage="Password is required" ControlToValidate="txtpa" ForeColor="White" Font-Size="Medium"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtpa" ControlToValidate="txtcnf" ErrorMessage="not match" ForeColor="White" Font-Size="Medium"></asp:CompareValidator>
                 <br />
          
                   <span id="cd">Confirm-password:</span><%--<asp:TextBox id="txtcnf" runat="server" Height="25" Width="320" placeholder="Enter same password as previous" BorderColor="#CC99FF" TextMode="Password" CausesValidation="True" BorderStyle="Ridge"></asp:TextBox>--%>
              <input class="w3-input w3-border w3-round-xxlarge" type="password" id="txtcnf" placeholder="Enter same password as previous" runat="server"/>
              <asp:RequiredFieldValidator ID="recnf" runat="server" ErrorMessage="confirm password is required" ControlToValidate="txtcnf" ForeColor="White" Font-Size="Medium"></asp:RequiredFieldValidator>
           
              <br />
                
                  <asp:RadioButton ID="rbtnuser" CssClass="w3-hover-text-blue" GroupName="rbtn" runat="server"  Text="Buyer/Owner" Font-Size="Large" Font-Bold="True" Font-Italic="False" ForeColor="White" OnCheckedChanged="rbtnuser_CheckedChanged" /> &nbsp   <asp:RadioButton ID="rbtnbuilder" CssClass="w3-hover-text-blue" GroupName="rbtn" runat="server" Text="Builder" Font-Size="Large" Font-Bold="True" ForeColor="White" />  &nbsp    <asp:RadioButton ID="rbtnagent" CssClass="w3-hover-text-blue" GroupName="rbtn" runat="server" Text="Agent" Font-Size="Large" Font-Bold="True" ForeColor="White" />
                <br />
               <br />
          

                <asp:Button ID="btnsubmit" runat="server" Text="Sign Up"  OnClick="btnsubmit_Click" Width="188px" Height="35" BorderStyle="Ridge" CssClass="w3-round-xxlarge w3-hover-text-blue" />
             <%--<input class="w3-input" type="button" id="btnsubmit" text="submit" runat="server" onclick="btnsubmit_Click"/>--%>
             <%-- <button class="w3-btn w3-blue w3-border w3-round-xxlarge" runat="server" id="btnsubmit" onclick="btnsubmit_Click"><span id="cd">Regiter</span></button>--%>

            

          </div>
             
      </div>
              
              
       



              
               
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:simplestring %>" SelectCommand="SELECT * FROM [simpleuserregister]"></asp:SqlDataSource>


              
        <div class="split left">
                  <%--      &nbsp &nbsp  <div class="navbar-brand logo"><u>Magicplace</u></div>
            <div class="centered bor">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                   
                        
                       <h2><b><i> Magicalplace will allow you to interact with several awesome properties</i></b></h2>
                        <h2><b><i>Things which you can do with Magicplace</i></b></h2>

                        
                        <div class="xz">
                            <ul>
                        <li><b><u>Post your property for free</u></b></li>
                            <br />
                        <li>
                           <b> <u>Showcase your property as Rental,PG or Sale</u></b>
                        </li>
                            <br />

                        <li><b><u>Add property details with multiple photos of that property</u></b></li>
                             </ul>
                            </div>
                   
                    
                
                
                </nav>

            </div>--%>

                 &nbsp &nbsp  <asp:Label ID="lberror" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="Black" Text=""></asp:Label>

        </div>


    </form>
     <script src="jquery-3.4.1.js"></script>
    <script src="bootstrap.min.js"></script>
</body>
</html>
