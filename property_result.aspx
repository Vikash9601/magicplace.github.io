
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="property_result.aspx.cs" Inherits="property_result" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
  
    <style>
        #tb {
        border-spacing:2ch;
        border-collapse:separate;
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
    
 

    
       <script src="https://kit.fontawesome.com/6d17d89b76.js"></script>
    <script>

        $(document).ready(function () {

            $(".cons option:first-child").attr("disabled", "disabled");
            $(".dd1 option:first-child").attr("disabled", "disabled");

        });

    </script>

   
    <div class="container-fluid">
       

        <div class="row">
            <div class="col-lg-5">
                  <%-- <button type="button" class="btn-primary" data-toggle="modal" data-target="#modalimage">Contact Seller</button>--%>
 
                 <%-- <asp:ImageButton ID="imgbtn" ClientIDMode="Static" runat="server" CssClass="img-fluid x" AlternateText="propertyimage" ImageUrl="up_image/apartment.jpg"/>--%>

     <input type="image" id="imgbtn" class="im" width="600" height="400" alt="propertyimage" onclick="return false"/>

     
            </div>
            <div class="col-lg-4">
                   
                  <table id="tb">
                    
                      <tbody>
                        
                     
                              <tr style="font-size:large">
                                  <td>Bedrooms</td>
                                  <td>Bathrooms</td>
                                  <td>Balconies</td>
                            </tr>
                              <tr style="font-weight:bold">
                                  <td><asp:Label ID="bed" runat="server"></asp:Label></td>
                                  <td><asp:Label ID="bathroom" runat="server"></asp:Label></td>
                                  <td><asp:Label ID="balcony" runat="server"></asp:Label></td>
                              </tr>
                             <tr style="font-size:large">
                                 <td><hr /></td>
                                 <td><hr /></td>
                                 <td><hr /></td>
                             </tr>

                          <tr>
                              <td>Property For</td>
                              <td>
                                  Plot area
                              </td>
                              <td>
                                 Covered area
                              </td>
                              
                          </tr>
                          <tr style="font-weight:bold">
                                 <td><u><asp:Label ID="property_for" runat="server"></asp:Label></u></td>
                              <td><asp:Label ID="lblplot" runat="server"></asp:Label></td>
                              <td><asp:Label ID="lblcover" runat="server"></asp:Label></td>
                          </tr>
                          <tr style="font-size:large">
                                 <td><hr /></td>
                                 <td><hr /></td>
                               <td><hr /></td>
                             </tr>
                          <tr>
                              <td>
                                  Transaction type
                              </td>
                              <td>
                                  Car parking
                              </td>
                              <td>
                                  Furnished status
                              </td>
                              <td >
                                  Lifts
                              </td>

                          </tr>
                          <tr style="font-weight:bold">
                              <td>
                              <asp:Label ID="lbltransactionType" runat="server"></asp:Label>
                              </td>
                              <td>
                                       <asp:Label ID="lblparking" runat="server"></asp:Label>
                              </td>
                              <td>
                                   <asp:Label ID="lblfurnished" runat="server"></asp:Label>
                              </td>
                              <td>
                                   <asp:Label ID="lbllifts" runat="server"></asp:Label>
                              </td>
                          </tr>
                           <tr style="font-size:large">
                                 <td><hr /></td>
                                 <td><hr /></td>
                                 <td><hr /></td>
                               <td><hr /></td>
                             </tr>

                          </tbody>
                          </table>
                
            </div>
            <div class="col-lg-3">
                <div style="width:9cm; border:groove">
                    &nbsp;
                    <asp:Label ID="lblrating" runat="server" Text=""></asp:Label>
                    <asp:Image ID="img12" runat="server"  ImageUrl="~/stars/starfilled.png"/>

                    <asp:Label ID="lblpeople" runat="server" Font-Underline="True"></asp:Label>
                </div> 
                     
       
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3">

            </div>
            <div class="col-lg-3">
              <button type="button" id="btnpop" class="btn-primary" data-toggle="modal" data-target="#modalform">Contact Seller</button>
                   </div>
            <div class="col-lg-5">
          
                  <a id="share" href="#">share your feedback</a>
           
                
                
                
                
                 </div>


        </div>


        <div>

        </div>

    </div>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 


              <div class="modal" id="modalform" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Seller contact</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >

                    <div id="reginput">
                      <%-- <div style="background-color:blue;color:white;">
                             <label id="randomnum" runat="server"></label>
                        </div>--%>
                      
                        
                        <asp:DropDownList runat="server" ClientIDMode="Static" ID="ddlchoice" CssClass="form-control cons" AutoPostBack="false">
     <asp:ListItem>------Select option------</asp:ListItem>
                   <asp:ListItem Value="1">
                      Get Contact on Registered Email-Id
                  </asp:ListItem>
                   <asp:ListItem Value="2">
                      Get Contact on other Email-Id
                  </asp:ListItem>
    
    </asp:DropDownList>


               
  

          </div>
          <br />

        <div id="imp">
              <asp:DropDownList runat="server" ID="ddllist1" CssClass="w3-input dd1"  >
             <asp:ListItem>Interested in (optional)</asp:ListItem>
                <asp:ListItem>Site visit</asp:ListItem>
              <asp:ListItem>Immediate purchase</asp:ListItem>
              <asp:ListItem>Home loan</asp:ListItem>
          </asp:DropDownList>
        </div>
           
        


                
          
      </div>
      <div class="modal-footer">



    <asp:Button ID="btncontact" ClientIDMode="Static" CssClass="btn btn-primary" Text="Contact Seller" OnClick="btncontact_Click1" runat="server"></asp:Button>
       

      </div>
    </div>
  </div>
</div>



     

      <%-- <asp:UpdatePanel ID="upd" runat="server">
        <ContentTemplate>--%>
 <div class="modal fade" id="getcontact" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="text-align:center">
      <div class="modal-header">
        <h5 class="modal-title" id="H2">Please fill this form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align:center">
           <div id="input">

    <label id="err" style="font-weight:bold"></label>
<br />
        <asp:TextBox runat="server" ClientIDMode="Static" ID="txtna" CssClass="w3-input" placeholder="Name"></asp:TextBox>
          <br />
<label id="merr" style="font-weight:bold"></label>
               <br />
          <asp:TextBox runat="server" ClientIDMode="Static" ID="txtmob" CssClass="w3-input" placeholder="Moblie no."></asp:TextBox>
          <br />
               <label id="Eerr" style="font-weight:bold"></label>
               <br />
          <asp:TextBox runat="server" ClientIDMode="Static" ID="txtemail" CssClass="w3-input" placeholder="Email"></asp:TextBox>
          <br />
               <label id="ddlsel"></label>
               <br />
       <asp:DropDownList runat="server" ID="dropchoice" ClientIDMode="Static" CssClass="w3-input dd1"  >
             <asp:ListItem Value="0">Interested in (optional)</asp:ListItem>
                <asp:ListItem Value="1">Site visit</asp:ListItem>
              <asp:ListItem Value="2">Immediate purchase</asp:ListItem>
              <asp:ListItem Value="3">Home loan</asp:ListItem>
          </asp:DropDownList>
               <br />

        
             
       
             
            
            </div>
      </div>
      <div class="modal-footer">
             
        <asp:Button ID="btnsend" ClientIDMode="Static" CssClass="btn w3-hover-red" Text="Get Code" runat="server" OnClick="btnsend_Click" OnClientClick="return validate();" />
      </div>
    </div>
  </div>
</div>

   <%--</ContentTemplate>

    </asp:UpdatePanel>--%>

  


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
          <label id="msq">OTP code sent successfully on your email</label>
  <asp:TextBox ID="txtverify" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter verification code"></asp:TextBox>
           
      </div>
      <div class="modal-footer">
        <asp:Button ID="btngetcontact" ClientIDMode="Static" runat="server" CssClass="btn-primary" Text="Verify" OnClick="btngetcontact_Click"/>
      </div>
    </div>
  </div>
</div>

   



<%-- =======================================  --%>

   <div class="modal fade" id="modalimage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="H1">Property images</h5>
     
          
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>

        </button>
        
                 </div>
      <div class="modal-body" style="margin-left:2.5cm;margin-right:2.5cm;">
            <span id="msg1" style="display:none;text-align:center">Only single Image is available</span>

          <table>
              <tbody>
                  <tr>
                      <td>
                         
                      <button id="prev" onclick="return false" class="w3-button w3-hover-lightblue" style="width:2cm;height:1cm;"><i class="fa fa-angle-double-left fa-2x" aria-hidden="true"></i></button>
                      
                      </td>
                      <td>
                     <img id="imgsee" src="" width="800" height="500"/>
                      </td>
                      <td>
                         
                              <button id="after" onclick="return false"  class="w3-button w3-hover-lightblue" style="width:2cm;height:1cm;"><i class="fa fa-angle-double-right fa-2x" aria-hidden="true"></i></button>
                      </td>

                  </tr>
              </tbody>
          </table>
 
     
         
    
    </div>
   
 
  
</div>
      

  </div>

   </div>







  
    <br />
    <br />
    <div style="margin-left:1cm;">
        <div class="row">
            <div class="col-lg-6">

        
        <table>
            
            <tbody>
                <tr>
                    <td>
                       Price- 
                    </td>
                     <td  style="font-weight:bold"><asp:Label ID="lblprice" runat="server"></asp:Label></td>
                    
                     </tr>
                
                <tr>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>

                <tr>
                    <td>
                       Address- 

                    </td>
                      <td  style="font-weight:bold"><asp:Label ID="lbladd" runat="server"></asp:Label></td>
                 

                     </tr>

                  <tr>
                    <td>
                        <hr />
                    </td>
                    <td ">
                        <hr />
                    </td>
                </tr>

                <tr>
                    <td>
                    Landmark-
                    </td>
                    <td style="font-weight:bold">
                        <asp:Label ID="lbllandmark" runat="server"></asp:Label>
                    </td>
                </tr>

                  <tr>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>

                                <tr>
                    <td>
                    Flooring-
                    </td>
                    <td style="font-weight:bold">
                        <asp:Label ID="flooring" runat="server"></asp:Label>
                    </td>
                </tr>

                    <tr>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>

                                <tr>
                    <td>
                    Water availability-
                    </td>
                    <td style="font-weight:bold">
                        <asp:Label ID="lblwater" runat="server" Text="24 hours available"></asp:Label>
                    </td>
                </tr>

                 <tr>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>

                          <tr>
                    <td>
                    Status of Electricity-
                    </td>
                    <td style="font-weight:bold">
                        <asp:Label ID="lblelec" runat="server"></asp:Label>
                    </td>
                </tr>

                 <tr>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>

                      <tr>
                    <td>
                    Furnishing-
                    </td>
                    <td style="font-weight:bold">
                        <asp:Label ID="furnishst" runat="server"></asp:Label>
                    </td>
                </tr>
 <tr>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>


                  <tr>
                    <td>
                    Authority Approvel-
                    </td>
                    <td style="font-weight:bold">
                        <asp:Label ID="lblapprovel" runat="server" Text="City Municipal Corporation"></asp:Label>
                    </td>
                </tr>


                 <tr>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>



                

               
            </tbody>
         
               
        </table>

 </div>
            <div class="col-lg-6">
                <table>
                    <tbody>
                        <tr id="vi" runat="server">
                            <td>
                                Property Name-
                            </td>
                          
                            <td style="font-weight:bold">
                        <asp:Label ID="lblpropertyName" runat="server"></asp:Label>
                             </td>

                            
                        </tr>
                        <tr>
                            <td>
                                <hr />
                            </td>
                             <td>
                        <hr />
                    </td>
                        </tr>

                        <tr>
                            <td>
                               Possession Status-
                            </td>
                          
                            <td style="font-weight:bold">
                        <asp:Label ID="possession" runat="server"></asp:Label>
                             </td>
                            </tr>
                              <tr>
                            <td>
                                <hr />
                            </td>
                             <td>
                        <hr />
                    </td>
                        </tr>
                        <tr>
                            <td>
                               <asp:Label ID="possess" runat="server"></asp:Label>
                            </td>
                            <td style="font-weight:bold">
                                  <asp:Label ID="constructValue" runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <hr />
                            </td>
                             <td>
                        <hr />
                    </td>
                        </tr>
                       
                    </tbody>
                </table>
            </div>
                </div>

        </div>

                 
        <div style="height:2cm;position:absolute;left:13cm;">
       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  <label id="msg" runat="server"> Rate this property</label> 
            <br />
         
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">


                <ContentTemplate>
               <ajaxToolkit:Rating ID="Rating1" runat="server" CurrentRating="0" MaxRating="5" StarCssClass="starempty" FilledStarCssClass="starfilled" WaitingStarCssClass="starwaiting" EmptyStarCssClass="starempty" OnChanged="Rating1_Changed1" OnClick="Rating1_Click"></ajaxToolkit:Rating>
            



                     <asp:Button ID="btnagain" runat="server" CssClass="btn-primary" Text="Want To Rate Again" OnClick="btnagain_Click" />  
            
            
            
            
                </ContentTemplate>
            </asp:UpdatePanel>
            
                          
        </div>
                                 

   

    <br />
    <br />
    <br />
    <br />
    <br />
  <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>  --%>  
            <div id="feedbacksec" style="position:relative;left:10cm;" runat="server">
     <textarea  id="Ufeedback" runat="server" rows="4" cols="60" placeholder="Please share your Feedback and Response about this property"></textarea>
       
        <br />
   
         <asp:Button id="subfeed" runat="server" CssClass="btn w3-hover-red"  Text="Submit" OnClick="subfeed_Click"/>

                 </div>
            <div style="margin-left:12.5cm;">
 <asp:Button ID="feedagain" runat="server" CssClass="btn w3-hover-blue" Text="Want to change your feedback" OnClick="feedagain_Click"  />
 
            </div>
       <%--     
            </ContentTemplate>

        </asp:UpdatePanel>--%>
    <br />
    <br />

<h3><u>User's valuable feedbacks for this property</u></h3>
    <br />
    <asp:Repeater runat="server" ID="comment">
       <%-- <HeaderTemplate>
            <asp:Label ID="lblue" runat="server" Text="User's Feedback"></asp:Label>
        </HeaderTemplate>
  --%>
        <ItemTemplate>
            <table class="table table-bordered">

<%--                <tbody>
                    <tr>
                        <th>
                            <asp:Label ID="username" runat="server" Text='<%#String.Concat("Name- ", Eval("username")) %>'></asp:Label>
                        </th>
                   
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="feedback" runat="server" Text='<%#Eval("userfeedback") %>'></asp:Label>
                        </td>
                            <td>
  <ajaxToolkit:Rating ID="Rate" runat="server" CurrentRating='<%# Convert.ToInt32(Eval("rating")) %>' MaxRating="5" StarCssClass="starempty" FilledStarCssClass="starfilled" WaitingStarCssClass="starwaiting" EmptyStarCssClass="starempty" ReadOnly="true"></ajaxToolkit:Rating>
            

                        </td>
                       
                    </tr>
                </tbody>
            </table>--%>
                <div style="font-size:2ch;font-weight:bold;">
  <asp:Label ID="username" runat="server" Text='<%#String.Concat("Name- ", Eval("username")) %>'></asp:Label>
                </div>
              
                <div class="row w3-card">
                    <div class="col-lg-9">
    <asp:Label ID="feedback" runat="server" Text='<%#Eval("userfeedback") %>'></asp:Label>
                    </div>
                    <div class="col-lg-3">
<ajaxToolkit:Rating ID="Rate" runat="server" CurrentRating='<%# Convert.ToInt32(Eval("rating")) %>' MaxRating="5" StarCssClass="starempty" FilledStarCssClass="starfilled" WaitingStarCssClass="starwaiting" EmptyStarCssClass="starempty" ReadOnly="true"></ajaxToolkit:Rating>
        
                    </div>


                </div>

            <br />

            <br />
        </ItemTemplate>

    </asp:Repeater>
    <br />
    

    <asp:Label ID="lblmsr" runat="server"></asp:Label>

<br />
    <br />


  <%--  <div id="feedmodal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>We got your feedback.Thank You</p>
      </div>
      
    </div>
  </div>
</div>--%>
    
       <script>

        



            

              

          


           $('#imgbtn').click(function () {

               $('#modalimage').modal('show');

           });


           //$(document).ready(function () {
           //    if ($("#imgbtn").data('clicked')) {
           //        $('#modalimage').modal('show');
           //    }
           //    else {
           //        $('#modalimage').modal('show');
           //    }
           //});
           $(document).ready(function () {
              
               var str = '<%=arr%>';
               var arr = str.split('~/');
               var count=0;
               arr.shift();
           
              // alert(arr.length);
              imgbtn.src = arr[0];   
               imgsee.src = arr[0];

               $('#prev').click(function () {

                   if (arr.length == 1) {
                       document.getElementById("msg1").style.display = "block";

                   }

               
                   count -= 1;
                 
                   if (count < 0) {
                       if (typeof arr[arr.length + (count)] == "undefined") {

                           count = 0;
                           imgsee.src = arr[count];

                       }

                       else {

                           imgsee.src = arr[arr.length + (count)];
                          // alert(count);
                       }
                   }
                   else {

                       imgsee.src = arr[count];
                   }


                  


               });

               $('#after').click(function () {
                   if (arr.length == 1) {
                       document.getElementById("msg1").style.display = "block";

                   }
                   count += 1;
                   if (count < 0) {
                       imgsee.src = arr[arr.length + (count)];
                   }

                   else if (typeof arr[count] == "undefined") {
                       count = 0
                       imgsee.src = arr[count];
                   }



                   else {

                       imgsee.src = arr[count];
                     //  alert(count);

                   }


               });
              
               document.getElementById("imp").style.display = "none";
               
               document.getElementById("btncontact").style.display = "none";
               $("#ddlchoice").change(function () {

                   var selection = document.getElementById("ddlchoice").value;

                   //if (selection == 1) {

                   //    document.getElementById("input").style.display = "none";
                   //    document.getElementById("reginput").style.display = "block";
                   //    document.getElementById("imp").style.display = "block";
                   //    document.getElementById("btncontact").style.display = "block";
                   //    document.getElementById("btnsend").style.display = "none";
                   //}
                   //else {
                   //    document.getElementById("input").style.display = "block";
                   //  //  document.getElementById("reginput").style.display = "none";
                   //    document.getElementById("imp").style.display = "none";
                   //    document.getElementById("btncontact").style.display = "none";
                   //    document.getElementById("btnsend").style.display = "block";
                   //}

                   if(selection==2)
                   {

                       $("#modalform").modal('hide');
                       $("#getcontact").modal('show');
                       document.getElementById("load").style.display="none";

                   }
                   else
                   {
                       document.getElementById("imp").style.display = "block";
                       document.getElementById("btncontact").style.display = "block";

                   }

               });


             

               //$(document).ready(function () {
               //    $("#imgbtn").click(function () {
               //        $("#modalimage").modal();
               //    });

                   //var randnum = document.getElementById("randomnum");
                   //var randnumber = Math.ceil(Math.random() * 10000);
                   //randnum.innerHTML = randnumber;
                  

               });

           $(document).ready(function () {
              

          
           $("#share").click(function () {
              
               //$('html,body').animate({ scrollTop: $(document).height() }, 10);
               window.scrollBy(0, 750);
               return false;
              

           });

           var id=<%=property_result.user_id%>;
               if(id==0)
               {

                   $("#share").hide();
               }
               else
               {
                   $("#share").show();


               }
           });

           //function got()
           //{
           //    alert("We got your Feedback. Thank you");

           //}


           function validate(){
               var isTrue=true;
              
               if(document.getElementById("txtna").value!="")
               {
                   var reg=/^[a-zA-Z ]+$/;
                   if(!document.getElementById("txtna").value.match(reg))
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
                   document.getElementById("err").innerHTML="Fill the name field";
               }



               if(document.getElementById("txtmob").value!="")
               {
                   var reg=/^[0-9]+$/;
                   if(!document.getElementById("txtmob").value.match(reg))
                   {
                       isTrue=false;
                       document.getElementById("merr").innerHTML="Invalid mobile no.";
                   }
                   else{

                       document.getElementById("merr").innerHTML="";
                   }
                   
               }
               else
               {
                   isTrue=false;
                   document.getElementById("merr").innerHTML="Fill the mobile no. field";
               }


               if(document.getElementById("txtemail").value!="")
               {
                   var reg=/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                   if(!document.getElementById("txtemail").value.match(reg))
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
                   document.getElementById("Eerr").innerHTML="Fill the Email field";
               }
              
               if(document.getElementById("dropchoice").value=="0")
               {

                   isTrue=false;
                   document.getElementById("ddlsel").innerHTML="Select Interested in option";

               }
               else
               {
                   document.getElementById("ddlsel").innerHTML="";


               }
               return isTrue;

           }
    </script>
    

         

</asp:Content>

