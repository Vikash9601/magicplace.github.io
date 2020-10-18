<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="modifypropertydata1.aspx.cs" Inherits="modifypropertydata1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
       #para {
       color:blue;
       text-align:center;
       font-family:Gabriola;
       font-size:3ch;

        }

            .c {
margin-left:12cm;
margin-right:12cm;
        }
        #btnmodalsubmit:hover {
        
        background-color:red;
        }

                .panel {
    position:absolute;
       top:2cm;
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 50px;
         padding-right: 50px;
        width: 500px;
        height: 400px;
     
    }


.starempty
        {
            background-image: url(stars/starempty.png);
            width: 50px;
            height: 50px;
        }
.starfilled
        {
            background-image: url(stars/starfilled.png);
            width: 50px;
            height: 50px;
        }
.starwaiting
        {
            background-image: url(stars/starwaiting.png);
            width: 50px;
            height: 50px;
        }
 </style>
    <script>
        $(document).ready(function () {

            var sess1 = <%=Convert.ToInt32(Session["id"])%>;
            var sess2 = '<%=Convert.ToString(Session["user"])%>';
              
               

            if(sess2=='')
            {
                $('#modalLoginForm').modal('show');
            }
            else
            {
                $('#modalLoginForm').modal('hide');
            }
            document.getElementById("ddlselect").options[0].disabled = true;
            //$(".x").click(setTimeout(myfun,1000)); 


            //function myfun()
            //{
            //  window.scrollBy(0,500);
            //}
        });

    </script>
    
    
       <link rel="stylesheet" href="w3.css"/>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <p id="para">Your posted properties</p>
  <div class="w3-container w3-orange">
  <h2 class="text-center">Edit the Uploaded data</h2>
</div>   
     <div>
            <a href="homepage.aspx"><i class="fa fa-backward" aria-hidden="true"></i> Click here to go to Homepage</a>
       
     </div>
  
        <div class="c">
 <asp:DropDownList ID="ddlselect" ClientIDMode="Static" CssClass="form-control custom-select-lg"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlselect_SelectedIndexChanged">
           <asp:ListItem>---Select property Type----</asp:ListItem>
           <asp:ListItem>Apartment</asp:ListItem>
           <asp:ListItem>Residential houses</asp:ListItem>
       </asp:DropDownList>

    </div>
<br />
        
    <div class="row">
        <div class="col-lg-2">

        </div>
         <div class="col-lg-8">

    
        
    <asp:DataList ID="dataresidential" runat="server">

        <ItemTemplate>
           <table class="table table-bordered" style="border-collapse:separate;border-color:indigo;border-width:0.3cm">
               <tbody>
                   <tr>
                       <td>
                          <%-- <asp:Image ID="Image1" runat="server" Width="400" Height="200" ImageUrl='<%#Eval("RfirstPostImg") %>' />--%>
                           <asp:ImageButton ID="imgbtresi" runat="server" Width="400" Height="250" ImageUrl='<%#Eval("RfirstPostImg") %>' OnClick="imgbtr_Click" />
                       </td>
                       <td>
                           <table>
                               <tbody>
                                  <tr>
                                      <td>
                                           Address-
                                       </td>
                                       <td>
                                          <asp:Label ID="lbladdress1" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           Locality-
                                       </td>
                                       <td>

                                          <asp:Label ID="lbllocality1" runat="server" Text='<%#Eval("Rlocality") %>'></asp:Label>
                                       </td>
                                     
                                   </tr>
                                   <tr>
                                       <td>
                                           Total plot area-

                                       </td>
                                       <td>
                                          <asp:Label ID="lblplot1" runat="server" Text='<%#string.Concat(Eval("Rplot_area")," ",Eval("Rplot_area_unit")) %>'></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           Expected price-
                                       </td>
                                       <td>
                                         <asp:Label ID="lblex1" runat="server" Text='<%#String.Format("{0:n}",Eval("Rexpected_price")) %>'></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                         <td>
                           <asp:Label ID="label_id" runat="server" Text='<%#Eval("Rproperty_id")%>' Visible="false"></asp:Label>
                           <asp:Button ID="btnedit" runat="server" CssClass="btn-primary" Text="Edit" OnClick="btnedit" />
                          
                       </td>
                                       <td>
                                            <asp:Label ID="lbl_type" runat="server" Text='<%#Eval("Rproperty_type")%>' Visible="false"></asp:Label>
                                             <asp:Button ID="btndel" runat="server" CssClass="btn-danger" Text="Delete" OnClick="btndel" OnClientClick="return confirm('Are you sure you want to delete this Property Record?');" />
                                       </td>
                                   </tr>
                                

                               </tbody>
                           </table>
                           <br />
                           <table>
                               <tbody>
                                      <tr>
                                       <td>
                                             <a href="#" id="laun" data-toggle="modal" data-target="#modalsellfeed">Tell MagicPlace if this property sold</a>   
                                             </td>
                                   </tr>
                               </tbody>
                           </table>
                       </td>
                     
                   </tr>
               </tbody>
           </table>


             <div class="modal fade" id="modalsellfeed" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
     <button type="button" class="close" id="btnClose" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      
      </div>
     <div class="modal-body mx-3">
        <div class="md-form mb-5">
            
    
               
               <asp:Label ID="rlblerr" runat="server" Text=""></asp:Label>
            <br />
            <ul>
                <li> <label style="font-family:'Times New Roman';font-size:large">Is this property sold?</label> </li>
            
                   
          
            

                <asp:RadioButtonList ID="rbtnrsold" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="Sold">Yes</asp:ListItem>
                    <asp:ListItem Value="Not Sold">No</asp:ListItem>

                </asp:RadioButtonList>

              <br />
                <br />
        <li>Rate US</li>
              
                 <ajaxToolkit:Rating ID="rRating1" runat="server" CurrentRating="0" MaxRating="5" StarCssClass="starempty" FilledStarCssClass="starfilled" WaitingStarCssClass="starwaiting" EmptyStarCssClass="starempty" OnChanged="rRating1_Changed"></ajaxToolkit:Rating>
            
           

                <br />
             <br />
                <br />
               <li> <label style="font-family:'Times New Roman';font-size:large" >Share your Experience with MagicPlace</label></li>
            
           
             
                <asp:TextBox ID="rsharefeed" runat="server" CssClass="form-control" TextMode="MultiLine" MaxLength="60"></asp:TextBox>
                <br />

               

                <asp:Button  ID="rexperiencesub" runat="server" CssClass="form-control w3-hover-red" Text="Submit" OnClick="rexperiencesub_Click"/>
             </ul>



   
 
                    
        </div>
</div>
    </div>
  </div>
</div>


        </ItemTemplate>

    </asp:DataList>

                 </div>
             <div class="col-lg-2">

        </div>

</div>

    <br />
    <div class="row">
         <div class="col-lg-2">

        </div>
         <div class="col-lg-8">


          <asp:DataList ID="datashow" runat="server">

        <ItemTemplate>
           <table class="table table-bordered" style="border-collapse:separate;border-color:indigo;border-width:0.3cm">
               <tbody>

                   <tr>
                       <td>
                          <%-- <asp:Image ID="Image1" runat="server" Width="400" Height="200" ImageUrl='<%#Eval("propertyFirstImg") %>' />--%> 
                       <asp:ImageButton ID="imgbtapart" runat="server" Width="400" Height="250" ImageUrl='<%#Eval("propertyFirstImg") %>' OnClick="imgbtresi_Click"/>
<%-- <input type="image" id="imgbtapart" class="im" src='<%#Eval("propertyFirstImg") %>' runat="server" width="400" height="200" alt="propertyimage"/>--%>


                       </td>
                       <td>
                           <table>
                               <tbody>
                                   <tr>
                                       <td>
                                           Property name-
                                       </td>
                                       <td>
                                           <asp:Label ID="lblpname" runat="server" Text='<%#Eval("propertyName") %>'></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           Address-
                                       </td>
                                       <td>
                                           <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           Total plot area-

                                       </td>
                                       <td>
                                           <asp:Label ID="lblplot" runat="server" Text='<%#string.Concat(Eval("plot_area")," ",Eval("plot_area_unit")) %>'></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           Expected price-
                                       </td>
                                       <td>
                                           <asp:Label ID="lblex" runat="server" Text='<%#String.Format("{0:n}",Eval("expected_price")) %>'></asp:Label>
                                       </td>

                                         
                                       
                                   </tr>
                                   <tr>

                                        <td>
                                           <asp:Label ID="labelid" runat="server" Text='<%#Eval("property_id")%>' Visible="false"></asp:Label>
                           <asp:Button ID="btnedit1" runat="server" CssClass="btn-primary" Text="Edit" OnClick="btn_edit" />
                         
                   
                                       </td>
                                       <td>
                                             <asp:Label ID="lbltype" runat="server" Text='<%#Eval("property_type")%>' Visible="false"></asp:Label>
                                           
                                           
                                            <%--  <asp:Button ID="btndel1" runat="server" CssClass="btn-danger" Text="Delete" CommandName="delete" />--%>
                                            
                                           
                                            <asp:Button ID="Button1" runat="server" CssClass="btn-danger" Text="Delete" OnClick="btn_del" OnClientClick="return confirm('Are you sure you want to delete this Property Record?');" />
                                       </td>

                                   </tr>
                               </tbody>
                           </table>
                               <br />
                           <table>
                               <tbody>
                                      <tr>
                                       <td>
                                   <a href="#" id="launch" data-toggle="modal" data-target="#modalsellerfeed">Tell MagicPlace if this property sold</a>     
                                         </td>
                                   </tr>
                               </tbody>
                           </table>
                       </td>
                    
                       
                   </tr>
                  <%-- <tr>
                       <td>
                           <asp:Label ID="Lab" runat="server" Text='<%#Eval("property_id")%>' Visible="false"></asp:Label>
                           <asp:Button ID="btnedit" runat="server" CssClass="btn-primary" Text="Edit" />
                            <asp:Button ID="btndel" runat="server" CssClass="btn-danger" Text="Delete" />
                       </td>
                   </tr>--%>
               </tbody>
           </table>
        
           

             


        </ItemTemplate>

    </asp:DataList>





             <asp:Label ID="lblm" runat="server"></asp:Label>
                  </div>
             <div class="col-lg-2">

        </div>
    </div>


     <div class="modal fade" id="modalsellerfeed" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
     <button type="button" class="close" id="btnClose" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      
      </div>
     <div class="modal-body mx-3">
        <div class="md-form mb-5">
            
    
               
               <asp:Label ID="lblerr" runat="server" Text=""></asp:Label>
            <br />
            <ul>
                <li> <label style="font-family:'Times New Roman';font-size:large">Is this property sold?</label> </li>
            
                   
          
            

                <asp:RadioButtonList ID="rbtnsold" ClientIDMode="Static" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="Sold" Selected="False">Yes</asp:ListItem>
                    <asp:ListItem Value="Not Sold" Selected="False">No</asp:ListItem>

                </asp:RadioButtonList>

                 <br />
                <br />
        <li>Rate US</li>
              
                 <ajaxToolkit:Rating ID="Rating1" ClientIDMode="Static" runat="server" CurrentRating="0" MaxRating="5" StarCssClass="starempty" FilledStarCssClass="starfilled" WaitingStarCssClass="starwaiting" EmptyStarCssClass="starempty" OnChanged="Rating1_Changed"></ajaxToolkit:Rating>
            
           

                <br />
             <br />
                <br />
               <li> <label style="font-family:'Times New Roman';font-size:large" >Share your Experience with MagicPlace</label></li>
            
           
             
                <asp:TextBox ID="sharefeed" runat="server" CssClass="form-control" TextMode="MultiLine" MaxLength="60"></asp:TextBox>
                <br />

               

                <asp:Button  ID="experiencesub" runat="server" CssClass="form-control w3-hover-red" Text="Submit" OnClick="experiencesub_Click"/>
             </ul>



   
 
                    
        </div>
</div>
    </div>
  </div>
</div>




    <div class="modal fade" id="saybye" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <label id="msq">We got your Feedback. Thank you for this Feedback</label>
 
      </div>
      
    </div>
  </div>
</div>


  


     <div class="modal fade" id="modalLoginForm" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
          <%-- <i class="fas fa-lock prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
          <input type="password" id="txtpass" class="form-control validate" runat="server" required="required"/>
         --%>
      </div>
     <div class="modal-body mx-3">
        <div class="md-form mb-5">
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" ControlToValidate="txtpass"></asp:RequiredFieldValidator>--%>
            <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
            <br />
            <br />

         <%--   <label data-error="wrong" data-success="right" for="defaultForm-email">Your email</label>
         --%>
    
            <asp:TextBox ID="txtid" runat="server" CssClass="form-control" placeholder="Enter Email and Mobile no."></asp:TextBox>
          
         <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="txtid"></asp:RequiredFieldValidator>
      --%>  </div>

        <div class="md-form mb-4">
          <%-- <i class="fas fa-lock prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
          <input type="password" id="txtpass" class="form-control validate" runat="server" required="required"/>
         --%>
           
      <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control"
                    placeholder="Enter Password" />
            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" ControlToValidate="txtpass"></asp:RequiredFieldValidator>
--%>

        </div>
</div>
     
      <div class="modal-footer d-flex justify-content-center">
          
                 
              <asp:Button ClientIDMode="Static" ID="btnmodalsubmit"  class="btn btn-default button" runat="server" Text="Login" OnClick="btnmodalsubmit_Click1" UseSubmitBehavior="true" />
    
      </div>
    </div>
  </div>
</div>


    <div class="modal fade" id="warningm" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Message</h4>
       <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close" runat="server">
          <span aria-hidden="true">&times;</span>
        </button> --%>
     </div>
    <div class="modal-body mx-3">
        <div class="md-form mb-5">
         
            <asp:Label ID="msgwa" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
            <br />
            <br />
             <asp:Label ID="msgwa1" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
       
       </div>
        </div>
     
   
    </div>
  </div>
</div>



  



<script>
    

    $(".im").click(function(){
        
        $('#modalimage').modal('show');
    });


</script>
</asp:Content>

