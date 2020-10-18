<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
      <script src="jquery-3.4.1.js"></script>
    <script src="bootstrap.min.js"></script>
      <link rel="stylesheet" href="bootstrap.min.css" />
      <link rel="stylesheet" href="w3.css" />
    <script src="https://kit.fontawesome.com/6d17d89b76.js"></script>
    <style>
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row" style="margin-top:2cm;">
        <div class="col-lg-2">

        </div>
        <div class="col-lg-8 w3-card" style="padding:30px;">

            
      <h1 id="hello" style="text-align:center;font-family:Gabriola;font-size:xx-large;" class="w3-card" runat="server">Hello User</h1>
            <br />
            <div id="cred" runat="server">
            <ul>
     <li>  <p style="font-family:Gabriola; font-size:30px;color:orangered">Please enter the registered Full name</p></li> 
                </ul>
            <input id="uname" class="w3-input w3-border w3-round-xxlarge" runat="server" type="text" placeholder="Enter Full name" style="font-family:Gabriola; font-size:22px" required="required"/>
            <br />
                <label id="err"></label>
               
               <ul>
     <li>  <p style="font-family:Gabriola; font-size:30px;color:orangered">Please enter the registered Email-id</p></li> 
                </ul>
        <input id="eid" class="w3-input w3-border w3-round-xxlarge" runat="server" type="email" placeholder="Enter Email-id" style="font-family:Gabriola; font-size:22px" required="required"/>
        <br />
                 <label id="Eerr"></label>
        <br />
           
        <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate >--%>
        <asp:Button ID="submit" CssClass="w3-hover-white w3-border w3-round-xxlarge" BackColor="Red" runat="server" Text="Get OTP" OnClick="submit_Click" UseSubmitBehavior="true" OnClientClick="return validate();"   />
              <%--   </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="submit" EventName="Click" />

             </Triggers>
        </asp:UpdatePanel>--%>
            <br />
            <asp:Label ID="lblerr" ClientIDMode="Static" runat="server"></asp:Label>
                </div>
            <br />
            <div id="otp" runat="server">
               <p id="msg1" class="w3-card" style="font-family:Gabriola; font-size:30px;color:orangered"><i class="fa fa-check-circle" aria-hidden="true"></i>  Dear user,we have sent an OTP to your registered Email-id</p>
              
                <p id="msg2" class="w3-card" style="font-family:Gabriola; font-size:30px;color:orangered">If you haven't got an OTP then please click on the button below</p>
                <br />
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>
                 <asp:Button ID="reotp" CssClass="w3-border w3-round-xxlarge w3-hover-red" runat="server" Text="Resend OTP" OnClick="reotp_Click"  />

                 </ContentTemplate>
                       <%-- <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="reotp" EventName="Click"/>
                        </Triggers>--%>
                        </asp:UpdatePanel>
            </div>
            <br />
          
            <div id="set" runat="server">
                  <asp:UpdatePanel ID="sam" runat="server">
                <ContentTemplate>
                <asp:TextBox ID="getotp" runat="server" AutoCompleteType="Disabled" placeholder="Enter OTP" CssClass="form-control"></asp:TextBox>
                <br />
                   
                     <asp:Label ID="errmsg" runat="server"></asp:Label>
                    <br />
              
                     </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                 <asp:Button ID="setotp" CssClass="w3-border w3-round-xxlarge w3-hover-red" BackColor="" runat="server" Text="Submit OTP" OnClick="setotp_Click" OnClientClick="return valid();"  />
                <br />
                <br />

               
            </div>
               
               <h1 id="res" style="text-align:center;font-family:Gabriola;font-size:xx-large;" class="w3-card" runat="server">You are very near to update your previous password with a new password</h1>
            <br />
            <div id="updt" runat="server">
                
             
                <br />
                <ul>
                  <li>  <p style="font-family:Gabriola; font-size:30px;color:orangered">Enter new password</p></li> 
                </ul>
            <input id="newpass" class="w3-input w3-border w3-round-xxlarge" runat="server" type="password" placeholder="new password" style="font-family:Gabriola; font-size:22px" autocomplete="off" required="required"/>
                <br />
                 <ul>
                  <li>  <p style="font-family:Gabriola; font-size:30px;color:orangered">PLease re-enter new password</p></li> 
                </ul>
 <input id="cnfnewpass" class="w3-input w3-border w3-round-xxlarge" runat="server" type="password"  autocomplete="off" placeholder="Again new password" style="font-family:Gabriola; font-size:22px" required="required"/>
                <br />
                <asp:Button ID="upd" runat="server" Text="Update" CssClass="w3-border w3-round-xxlarge w3-hover-blue upd" OnClick="upd_Click"/>
  
                <br />
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpass" ControlToValidate="cnfnewpass" ErrorMessage="not match"></asp:CompareValidator>
               
            </div>
            <a href="log.aspx" style="font-family:Gabriola;color:blue;font-size:4ch;text-align:center;" id="log" runat="server">Now try again to Login</a>
    
        



        </div>
        <div class="col-lg-2">

        </div>

    </div>
       
  
    </form>
   <script>
       function run()
       {

           var x=<%=forgotPassword.success%>;
           alert(x);
           if(x==1)
           {
               document.getElementById("res").innerHTML="successfully update";
           }
           else
           {
               alert(x);
           }
       
       }


       $("#reotp").click(function(){
           setTimeout(function(){
               document.getElementById("msg1").innerHTML=" We have sent the OTP again to your registered E-mail";
               //    document.getElementById("msg1").insertAdjacentHTML("beforebegin","<i class="+"fa fa-check-circle"+" aria-hidden="+true+"></i>");
               document.getElementById("msg2").innerHTML="If still haven't got the OTP then try later";
           },1500);
       
          
       });
          
       function valid()
       {
           isTrue=true;
           if(document.getElementById("getotp").value=="")
           {
               isTrue=false;
               document.getElementById("errmsg").innerHTML="Please Fill the OTP first";

           }
       else
       {
               document.getElementById("errmsg").innerHTML="";

           }

           return isTrue;


       }


           
      
       function validate()
       {
           isTrue=true;
           
           if(document.getElementById("uname").value!="")
           {
               var reg=/^[a-zA-Z ]+$/;
               if(!document.getElementById("uname").value.match(reg))
               {
                   isTrue=false;
                   document.getElementById("err").innerHTML="Invalid name";
               }
               else{

                   document.getElementById("err").innerHTML="";
               }
                   
           }
           else
           {
               isTrue=false;
               //document.getElementById("err").innerHTML="Fill the name field";
           }



           if(document.getElementById("eid").value!="")
           {
               var reg=/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
               if(!document.getElementById("eid").value.match(reg))
               {
                   isTrue=false;
                   document.getElementById("Eerr").innerHTML="Invalid Email";
               }
               else{

                   document.getElementById("Eerr").innerHTML="";
               }
                   
           }
           else
           {
               isTrue=false;
              // document.getElementById("Eerr").innerHTML="Fill the Email field";
           }

       }
     

  
   
         

              
       
       
   </script>


</body>
</html>
