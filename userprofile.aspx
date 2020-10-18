<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userprofile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>  
    
    <script src="jquery-3.5.0.js"></script>
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
         
            <div>
    
                <p>Read only &nbsp;&nbsp;</p>
                  
                         <label class="switch">
  <input type="checkbox" id="chk" checked />
  <span class="slider"></span>
</label> 
           
                

                <br />
                <br />
                <div>
                   <h3>Name</h3>
                    
                       <asp:TextBox runat="server" ID="txtname" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    
                    <br />
                     <h3>Email</h3>
                    
                       <asp:TextBox runat="server" ID="txtemail" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <br />

                    <h3>Contact no</h3>
                    <asp:TextBox runat="server" ID="contact" CssClass="form-control" ClientIDMode="Static" ></asp:TextBox>
                    <br />
                  <h3>User Type</h3>
                        <br />
                    <asp:RadioButtonList runat="server" ID="usertype" ClientIDMode="Static">
                        <asp:ListItem Value="builder">Builder</asp:ListItem>
                         <asp:ListItem Value="agent">Agent</asp:ListItem>
                         <asp:ListItem Value="buyer/seller">Buyer/Seller</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />


                    <asp:Button ID="submitchange" runat="server" CssClass="w3-button w3-red w3-hover-blue" OnClick="submitchange_Click" ClientIDMode="Static" Text="Save changes" />

                   <br />
                </div>
        
            </div>
  <div class="d-flex justify-content-center">
 <%--<a href="#" onclick="return false" data-toggle="modal" data-target="#exampleModal" >Want To change the password?</a>--%>
      <br />
  </div>
            <br />
             </div>

        <div class="col-md-3">

        </div>
    </div>

    <div class="modal fade" id="exampleModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Seller contact</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        

         
  <asp:TextBox ID="txtverify" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
           
      </div>
      <div class="modal-footer d-flex justify-content-center">
         
        <asp:Button ID="btngetcontact" ClientIDMode="Static" runat="server" CssClass="w3-button w3-hover-red" Text="Verify"/>
      </div>
        
    </div>
  </div>
</div>



    <div class="modal fade" id="MSG" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        

         
<label id="msg">Your records has updated successfully</label>    
      </div>
   
        
    </div>
  </div>
</div>


    <script>
        var ch = document.getElementById("chk");
        $("#submitchange").hide();

        $(document).ready(function () {

            if (ch.checked) {
                document.getElementById("txtname").readOnly = true;
                document.getElementById("txtemail").readOnly = true;
                document.getElementById("contact").readOnly = true;
                document.getElementById("usertype").readOnly = true;
            }
            else {
                document.getElementById("txtname").readOnly = false;
                document.getElementById("txtemail").readOnly = false;
                document.getElementById("contact").readOnly = false;
                document.getElementById("usertype").readOnly = false;

            }

        })

       
       ch.addEventListener("click", function () {
         
           var txt1 = document.getElementById("txtname");
            if (!ch.checked) {

             
               
                txt1.readOnly = false;
                document.getElementById("txtemail").readOnly = false;
                document.getElementById("contact").readOnly = false;
                document.getElementById("usertype").readOnly = false;
                $("#submitchange").show();
              
            }
            else {

                txt1.readOnly = true;
                document.getElementById("txtemail").readOnly = true;
                document.getElementById("contact").readOnly = true;
                document.getElementById("usertype").readOnly = true;
                $("#submitchange").hide();
            }


        });



 

    </script>
</asp:Content>

