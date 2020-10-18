<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="postproperty.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <script src="jquery-3.4.1.js"></script>
     <script>
     
         $(document).ready(function(){
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

         });

         

         $(".tes").keypress(function(event){
             var keycode = (event.keyCode ? event.keyCode : event.which);
             if(keycode == '13'){
                 alert('You pressed a "enter" key in somewhere');    
             }
         });

          
        
             
          
            
        </script>

    <style>
        /*body {
        background-image:url("image/postproimage.jpg");
        background-attachment:scroll;
        background-size:cover;
        background-repeat:no-repeat;
        
        }*/
      
       #lbinfo {
       font-size:15px;
       }
        #lbinfo2 {
       font-size:15px;
       }
        .button:hover {
            background-color:red;
        }

   </style>
    <link rel="stylesheet" href="w3.css"/>
     <script src="jquery-3.4.1.js"></script>
    <script>
        $(document).ready(function () {
            $(".x option:first-child").attr("disabled", "disabled");
            $(".ddls option:first-child").attr("disabled", "disabled");
            $(".ddlc option:first-child").attr("disabled", "disabled");
        });
    </script>
    <div>
        <label id="error" runat="server" style="text-align:center;color:red;"></label>

    </div>
    <div>
              <a href="homepage.aspx"><i class="fa fa-backward" aria-hidden="true"></i> Click here to go to Homepage</a>
       
    </div>
     
    <div class="position-absolute post">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    
        <label>
            <ul>
                <Blockquote>
          <li class="w3-hover-text-deep-purple"><b><i><u>Post your property for Sell or Rent</u></i></b>
              </Blockquote>
          </li>  
            <br />

          <li class="w3-hover-text-deep-purple"><b><i><u>Post your property for free</u></i></b></li>
                </ul>
        </label>
        <br />

         <%--    <asp:RadioButtonList ID="rbtn" RepeatLayout="Flow" runat="server">
            <asp:ListItem>
                user
            </asp:ListItem>
             <asp:ListItem>
                vikash
            </asp:ListItem>

        </asp:RadioButtonList>--%>


        
<label id="areyou" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp
        <label>Are you-</label>
        <asp:RadioButton ID="rbtnuser" ClientIDMode="Static" CssClass="choice w3-hover-text-deep-purple" Text="User" GroupName="type" runat="server"/>
       <asp:RadioButton ID="rbtnagent" ClientIDMode="Static" CssClass="choice w3-hover-text-deep-purple" Text="Agent" GroupName="type" runat="server"/>
       <asp:RadioButton ID="rbtnbuilder" ClientIDMode="Static" CssClass="choice w3-hover-text-deep-purple" Text="Builder" GroupName="type" runat="server"/>
      
      
        
        <%-- User<input type="radio" name="type" value="simpleuser" />
        Agent<input type="radio" name="type" value="agent" />
        Builder<input type="radio" name="type" value="builder" />--%>
        <br />
        <br />
        <label class="w3-card"><b>Property details</b></label>
        <br />
        <label id="Pfor" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;
        <label>Property For-</label>
          <asp:RadioButton CssClass="w3-hover-text-deep-purple" ID="rbtnsell" ClientIDMode="Static" Text="Sell" GroupName="typec" runat="server" />
        <asp:RadioButton CssClass="w3-hover-text-deep-purple" ID="rbtnrent" ClientIDMode="Static" Text="Rent" GroupName="typec" runat="server" />
        <asp:RadioButton CssClass="w3-hover-text-deep-purple" ID="rbtnpg" ClientIDMode="Static" Text="PG" GroupName="typec" runat="server" />
       <%-- Sell<input type="radio" value="sell" name="typec" />
       Rent<input type="radio" value="rent" name="typec" />
        Buy<input type="radio" value="Buy" name="typec" />--%>
        <br />
        <br />
     <label>
         &nbsp  &nbsp  &nbsp 
         Property type-
     </label>
        <asp:DropDownList CssClass="w3-dropdown-hover x" ID="ddlproperty" EnableViewState="false" ClientIDMode="Static" runat="server" OnSelectedIndexChanged="ddlproperty_SelectedIndexChanged">
            <asp:ListItem Text="--Select property type--" ></asp:ListItem>
         
            <asp:ListItem  Text="Apartment" Value="apartment" ></asp:ListItem>
             <asp:ListItem Text="Residential Houses" Value="houses"></asp:ListItem>
            <%-- <asp:ListItem Text="Villas" Value="villas"></asp:ListItem>--%>

        </asp:DropDownList>
        <br />
        <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate >

       <label id="vstate" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp;  State-
         <asp:DropDownList ID="ddlstate" ClientIDMode="Static" CssClass="ddls" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged" OnDataBound="ddlstate_DataBound">
     
        </asp:DropDownList>
                       <br />
                
            
  
        <br />

     <label id="vcity" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp;    city-
         <asp:DropDownList ID="ddlcity" ClientIDMode="Static" CssClass="ddlc" runat="server">
     
        </asp:DropDownList>
        <br />
        <br />
                 
          </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="ddlstate" EventName="SelectedIndexChanged" />

             </Triggers>
        </asp:UpdatePanel>
        <label id="locality"  runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
           <label>Locality-</label><asp:TextBox CssClass="w3-animate-input" ClientIDMode="Static" AutoCompleteType="Disabled" ID="txtlocality" runat="server" placeholder="Enter locality" ></asp:TextBox>
       <br />

        <script type="text/javascript">
            
            $(document).ready(function () {
                $("#simple").hide();
                $("#complex").hide();
                $("select.x").change(function () {
                    var selectedopt = $(this).children("option:selected").val();
                  //  alert("SELCTED OPTION " + selectedopt);

                    if(selectedopt=="apartment")
                   {
                        $("#simple").slideDown();


                    $("#complex").hide();


                    }
                    else if (selectedopt == "houses")
                    {
                       $("#simple").hide();

                    $("#complex").slideDown();

                    ////    $("#simple").click(function(){
                    ////        $("p").hide();
                    ////    });
                    ////    $("#complex").click(function(){
                    ////        $("p").show();
                    ////    });
                    }
                    else if (selectedopt == "villas") {


                    }

                    //else {
                    //    $("#simple").hide();
                    //    $("#complex").hide();
                    //}
              });
            });




            //------------------------------------------------------apartment----------------------------------------------------------------------
            $(document).ready(function () {
                $("#lbinfo").hide();
                $("#lbinfo2").hide();
                $(".txtcover").mouseover(function () {
                    $("#lbinfo").slideDown();
                   

                   
                });
                $(".txtplot").mouseover(function () {
                    $("#lbinfo2").slideDown();



                });

                $(".txtcover").mouseout(function () {
                    $("#lbinfo").slideUp();
                });
                $(".txtplot").mouseout(function () {
                    $("#lbinfo2").slideUp();

                });


             
            });
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------residential--------------------------------------------------------------------
            $(document).ready(function () {
                $(".lblin1").hide();
                $(".lblin2").hide();
                $(".txtcover").mouseover(function () {
                    $(".lblin1").slideDown();
                });
                $(".txtplot").mouseover(function () {
                    $(".lblin2").slideDown();
                });

                $(".txtcover").mouseout(function () {
                    $(".lblin1").slideUp();
                });
                $(".txtplot").mouseout(function () {
                    $(".lblin2").slideUp();



                });


            });

  //--------------------------------------------------------------------------------------------------------------------------------------          
            $(document).ready(function () {
                $(".ddlmonth").hide();
                $(".ddlyears").hide();
                $(".ddlage").hide();
                $(".rbtnun").click(function () {
                    $(".ddlmonth").slideDown();
                    $(".ddlyears").slideDown();
                    $(".ddlage").hide();

                });
                $(".rbtnre").click(function () {
                    $(".ddlmonth").hide();
                    $(".ddlyears").hide();
                    $(".ddlage").show();

                });

                $(".ddl1 option:first-child").attr("disabled", "disabled");
                $(".ddl2 option:first-child").attr("disabled", "disabled");
                $(".ddl3 option:first-child").attr("disabled", "disabled");
                $(".ddl4 option:first-child").attr("disabled", "disabled");
                $(".ddl5 option:first-child").attr("disabled", "disabled");
                //$(".ddl6 option:first-child").attr("disabled", "disabled");
                //$(".ddl7 option:first-child").attr("disabled", "disabled");
                //$(".ddlmonth option:first-child").attr("disabled", "disabled");
                $(".ddlyears option:first-child").attr("disabled", "disabled");
            });

          
           
            
           
        </script>
      

        <div id="simple">
            <br />
             <label id="aname" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
         
       <label>Apartment name-</label> &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox CssClass="w3-input" ClientIDMode="Static" AutoCompleteType="Disabled" ID="txtapart" runat="server" placeholder="Enter Apartment name"></asp:TextBox>
 <br />   
          <label id="address" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br /> 
        <label>Address-</label>&nbsp;&nbsp;&nbsp;&nbsp;    <asp:TextBox CssClass="w3-input" ClientIDMode="Static" AutoCompleteType="Disabled" ID="txtaddress" runat="server" placeholder="Enter full address"></asp:TextBox>
  <br />
            <label id="landmark" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label>Landmark-</label><asp:TextBox CssClass="w3-input" ClientIDMode="Static" AutoCompleteType="Disabled" ID="txtlandmark" runat="server" placeholder="Enter landmark"></asp:TextBox>
  
      
        <br />
            <label id="bedroom" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            Bedrooms-
           <asp:DropDownList ID="bedr" ClientIDMode="Static" CssClass="ddl1" runat="server">
                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>
            <br />
            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtaddress" ErrorMessage="Value Required!"></asp:RequiredFieldValidator>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bed"
                ErrorMessage="Value Required!" InitialValue="0"></asp:RequiredFieldValidator>--%>
            <br />
             <label id="balconies" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            Balconies-
             <asp:DropDownList ID="balcony" ClientIDMode="Static" CssClass="ddl2" runat="server">
                  <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>
            &nbsp &nbsp

            floor no.-
            <asp:DropDownList ID="floor" ClientIDMode="Static" CssClass="ddl3" runat="server">
                 <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>
             &nbsp;&nbsp;&nbsp;&nbsp; <label id="floorno" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label> 
            <br />
           
            <br />
           <label id="furnis" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>   
            <br />
             Furnished status-&nbsp;&nbsp;&nbsp;&nbsp;    
             <asp:DropDownList ID="furnish" ClientIDMode="Static" CssClass="ddl4" runat="server">
                  <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                  
                <asp:ListItem Text="Furnished" Value="furnished"></asp:ListItem>
             <asp:ListItem Text="Unfurnished" Value="unfurnished"></asp:ListItem>
             <asp:ListItem Text="Semi-furnished" Value="semi-furnished"></asp:ListItem>
           </asp:DropDownList>
            <br />
            <br />
             <label id="bath" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp; 
             Bathrooms-
            <asp:DropDownList ID="bathroom" ClientIDMode="Static" CssClass="ddl5" runat="server">
                 <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>
            <br />
            <br />
            
            <label>Flooring type-</label> &nbsp;&nbsp; &nbsp;&nbsp; <label id="floortype" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>  <asp:TextBox CssClass="w3-animate-input" ClientIDMode="Static" AutoCompleteType="Disabled" ID="txtflooring" runat="server" placeholder="Enter flooring type"></asp:TextBox>
  <br />
            <br />
            
            <label>Status of electricity-</label>   &nbsp;&nbsp;  &nbsp;&nbsp; <label id="stelec" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label> <asp:DropDownList ID="ddlelectricity" ClientIDMode="Static" CssClass="ddl7" runat="server">
             <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
            <asp:ListItem Text="No/Rare powercut" Value="No/Rare powercut"></asp:ListItem>
             <asp:ListItem Text="Powercut once or twice in a week" Value="Powercut once or twice in a week"></asp:ListItem>

           </asp:DropDownList>
  <br />
            <br />
            <label id="lifts" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;
            Lifts-
             <asp:DropDownList ID="lift" ClientIDMode="Static" CssClass="ddl6" runat="server">
                 <asp:ListItem Text="0" Value="0"></asp:ListItem>

                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
                  <asp:ListItem Text="No lift" Value="No lift"></asp:ListItem>
           </asp:DropDownList>
            <br />

            <label><b><i>Area</i></b></label>
            <br />
           

            <asp:TextBox ID="txtcoverarea" ClientIDMode="Static" CssClass="txtcover form-control" AutoCompleteType="Disabled" runat="server" placeholder="Covered area"></asp:TextBox>
            <asp:DropDownList ID="ddlunit" CssClass="ddl6" runat="server">
                 <asp:ListItem Text="Sq-ft" Value="Sq-ft"></asp:ListItem>
                <asp:ListItem Text="Sq-m" Value="Sq-m"></asp:ListItem>
             <asp:ListItem Text="Acre" Value="Acre"></asp:ListItem>
             

            </asp:DropDownList>

         
            &nbsp
           <%-- <asp:Image ID="info" ImageUrl="Question-Mark-Picture.jpg" Width="40px" Height="40px" runat="server"/>--%>
            <p id="lbinfo"><i>Covered area is the total area of your property under roof excluding corridors & balconies</i></p>
            <br />
               <label id="coverar" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;
            <br />
             <asp:TextBox ID="txtplotarea" ClientIDMode="Static" CssClass="txtplot form-control" runat="server" placeholder="Plot area"></asp:TextBox>
            <asp:DropDownList ID="ddlunit2" CssClass="ddl7" runat="server" OnSelectedIndexChanged="ddlunit2_SelectedIndexChanged">
                 <asp:ListItem Text="Sq-ft" Value="Sq-ft"></asp:ListItem>
                <asp:ListItem Text="Sq-m" Value="Sq-m"></asp:ListItem>
             <asp:ListItem Text="Acre" Value="Acre"></asp:ListItem>
                    </asp:DropDownList>
            <p id="lbinfo2"><i>Plot area is the total area of your property </i></p>
            <br />
             <label id="plotar" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;
            <br />
            <label><b><i>Transaction Type</i></b></label>
            <br />
             <label id="trType" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;
            <asp:RadioButton ID="rbtnnew" ClientIDMode="Static" Text="New property" GroupName="rbtntype" runat="server" />
            &nbsp&nbsp
            <asp:RadioButton ID="rbtnscale" ClientIDMode="Static" Text="Rescale" GroupName="rbtntype" runat="server" />
            <br />
        <label id="possess" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;     <label><b><i>Possession status</i></b></label>
            <br />
             
             <asp:RadioButton ID="rbtnstatus1" ClientIDMode="Static" CssClass="rbtnun" Text="Under construction" GroupName="rbtnstatus" runat="server" />
            &nbsp&nbsp
            <asp:RadioButton ID="rbtnstatus2" ClientIDMode="Static" Text="Ready to move" CssClass="rbtnre" GroupName="rbtnstatus" runat="server" />
            <br />
              <label id="possessmsg" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;
            <asp:DropDownList ID="ddlmon" ClientIDMode="Static" CssClass="ddlmonth" runat="server" >
                <asp:ListItem Text="--month--" Value="none"></asp:ListItem>
                <asp:ListItem Text="January" Value="january"></asp:ListItem>
                <asp:ListItem Text="February" Value="february"></asp:ListItem>
                <asp:ListItem Text="March" Value="march"></asp:ListItem>
                <asp:ListItem Text="April" Value="april"></asp:ListItem>
                <asp:ListItem Text="May" Value="may"></asp:ListItem>
                <asp:ListItem Text="June" Value="june"></asp:ListItem>
                <asp:ListItem Text="July" Value="july"></asp:ListItem>
                <asp:ListItem Text="August" Value="august"></asp:ListItem>
                <asp:ListItem Text="September" Value="september"></asp:ListItem>
                <asp:ListItem Text="October" Value="october"></asp:ListItem>
                <asp:ListItem Text="November" Value="november"></asp:ListItem>
                <asp:ListItem Text="December"  Value="december"></asp:ListItem>
            </asp:DropDownList>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlmon" InitialValue="month"></asp:RequiredFieldValidator>--%>
            <asp:DropDownList ID="ddlyear" ClientIDMode="Static" CssClass="ddlyears" runat="server" >
                <asp:ListItem Text="--Year--" Value="none"></asp:ListItem>
                <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                <asp:ListItem Text="2025" Value="2026"></asp:ListItem>
                
            </asp:DropDownList>

               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlyear" InitialValue="year"></asp:RequiredFieldValidator>--%>

               <asp:DropDownList ID="ddlbuildage" ClientIDMode="Static" CssClass="ddlage" runat="server" >
                <asp:ListItem Text="--Age of construction--" Value="none"></asp:ListItem>
                <asp:ListItem Text="New construction" Value="new"></asp:ListItem>
                <asp:ListItem Text="Less than 5 years" Value="Less than 5 years"></asp:ListItem>
                <asp:ListItem Text="5 to 10 years" Value="5 to 10 years"></asp:ListItem>
                <asp:ListItem Text="10 to 15 years" Value="10 to 15 years"></asp:ListItem>
                <asp:ListItem Text="15 to 20 years" Value="15 to 20 years"></asp:ListItem>
                
                
            </asp:DropDownList>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlbuildage" InitialValue="Age of construction"></asp:RequiredFieldValidator>--%>
            <br />
           

            <label><b><i>Price details</i></b></label>
            <br />
            <label><b>Expected price</b></label>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <label><b>Price per Sq-ft</b></label>
            <br />
         
 <asp:TextBox ID="txtprice" runat="server" ClientIDMode="Static" AutoCompleteType="Disabled" placeholder="Enter total price"></asp:TextBox>
           
               
            &nbsp&nbsp&nbsp
            <asp:TextBox ID="txtsq" runat="server" ClientIDMode="Static" AutoCompleteType="Disabled"  placeholder="₹"></asp:TextBox>
                    
            <br />
             <label id="lblprice" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;
            <label id="lblsq" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>  &nbsp;&nbsp;
            <br />
            <label><b>Price includes-</b></label>
          &nbsp&nbsp&nbsp
            <asp:CheckBox ID="chkcarp" runat="server" ClientIDMode="Static" Text="Car parking"/>
            &nbsp&nbsp&nbsp
             <asp:CheckBox ID="chkclub" runat="server" ClientIDMode="Static" Text="Club Membership"/>
           <br />
            <asp:CheckBox ID="chk" runat="server" Text="Stamp Duty & Registration charges excluded" Checked="True"/>
            <br />
            <label><b>Photos</b></label>
            <br />
            <label id="fileres" runat="server" ClientIDMode="Static" style="color:blue;font-weight:bold"></label>
            <br />

            <asp:FileUpload ID="Fileload" runat="server" ClientIDMode="Static"  AllowMultiple="True" BorderStyle="Ridge" />

            <br />
          <label style="color:red;font-weight:bold">Only 8 images are allowed only</label>
            <br />

            <asp:Button ID="Btnsub" runat="server" Text="Upload" BackColor="#FFFFCC" BorderColor="#FF6600" OnClick="Buttsub_Click" CssClass="w3-hover-text-blue-grey active" UseSubmitBehavior="true" OnClientClick="return valaidateForm()"/>
           
         <br />
            <br />
            
         
        </div>
        
        
        <script>
            $(document).ready(function(){
                $(".ddl1 option:first-child").attr("disabled", "disabled");
                $(".ddl2 option:first-child").attr("disabled", "disabled");
                $(".ddl3 option:first-child").attr("disabled", "disabled");
                $(".ddl4 option:first-child").attr("disabled", "disabled");
                $(".ddl5 option:first-child").attr("disabled", "disabled");
                
                $(".ddlmonth option:first-child").attr("disabled", "disabled");
                $(".ddlyears option:first-child").attr("disabled", "disabled");
            });
          
        </script>
        
        
        
        <div id="complex">
                    <label>Address-</label><asp:TextBox CssClass="w3-input" AutoCompleteType="Disabled" ID="txtRaddress" ClientIDMode="Static" runat="server" placeholder="Enter full address"></asp:TextBox>
  <br />
            <label id="raddress" runat="server" ClientIDMode="Static"  style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
        <label>Landmark-</label><asp:TextBox CssClass="w3-input" AutoCompleteType="Disabled" ID="txtRlandmark" ClientIDMode="Static" runat="server"  placeholder="Enter landmark"></asp:TextBox>
  
      
        <br />
            <label id="rlandmark" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
             Bedrooms-
           <asp:DropDownList ID="ddlrbed" CssClass="ddl1" ClientIDMode="Static" runat="server">
                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>


            <br />
            <label id="rbedroom" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
         <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlrbed"
                ErrorMessage="Value Required!" InitialValue="0"></asp:RequiredFieldValidator>
         --%>   <br />

 Balconies-
             <asp:DropDownList ID="ddlrbalony" ClientIDMode="Static" CssClass="ddl2" runat="server">
                  <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>
           
            
            &nbsp&nbsp
            
             floor no-
            <asp:DropDownList ID="ddlrfloor" ClientIDMode="Static" CssClass="ddl3" runat="server">
                 <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>
            <br />
            <label id="rbalcony" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <label id="rfloor" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
            Furnished status-
             <asp:DropDownList ID="ddlrfurnish" ClientIDMode="Static" CssClass="ddl4" runat="server">
                  <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                 
                <asp:ListItem Text="Furnished" Value="furnished"></asp:ListItem>
             <asp:ListItem Text="Unfurnished" Value="unfurnished"></asp:ListItem>
             <asp:ListItem Text="Semi-furnished" Value="semi-furnished"></asp:ListItem>

        </asp:DropDownList>

            <br />
            <label id="rfurnish" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
             Bathrooms-
            <asp:DropDownList ID="ddlrbathroom" ClientIDMode="Static" CssClass="ddl5" runat="server">
                 <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
           </asp:DropDownList>
            <br />
            <label id="rbathroom" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
              <br />
            <label>Flooring type-</label><asp:TextBox CssClass="w3-animate-input" ClientIDMode="Static" AutoCompleteType="Disabled"  ID="txtrflooring" runat="server" placeholder="Enter flooring type"></asp:TextBox>
  <br />
                  <label id="rflooring" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
             <label>Status of electricity-</label><asp:DropDownList ID="ddlrelectricity" ClientIDMode="Static" CssClass="ddl7" runat="server">
                  <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                 <asp:ListItem Text="No/Rare powercut" Value="No/Rare powercut"></asp:ListItem>
             <asp:ListItem Text="Powercut once or twice in a week" Value="Powercut once or twice in a week"></asp:ListItem>
           </asp:DropDownList>
           <br />
                  <label id="relectricity" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
            <br />
             Floors allowed for construct-
            <asp:DropDownList ID="ddlrfloors" ClientIDMode="Static" CssClass="ddl6" runat="server">
             <asp:ListItem Text="Total floors" Value="0"></asp:ListItem>
             <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
             <asp:ListItem Text="4" Value="4"></asp:ListItem>
             <asp:ListItem Text="5" Value="5"></asp:ListItem>
             <asp:ListItem Text="6" Value="6"></asp:ListItem>
             <asp:ListItem Text="7" Value="7"></asp:ListItem>
             <asp:ListItem Text="8" Value="8"></asp:ListItem>
             <asp:ListItem Text="9" Value="9"></asp:ListItem>
             <asp:ListItem Text="10" Value="10"></asp:ListItem>
             <asp:ListItem Text="11" Value="12"></asp:ListItem>
             <asp:ListItem Text="12" Value="12"></asp:ListItem>
             <asp:ListItem Text="13" Value="13"></asp:ListItem>
             <asp:ListItem Text="14" Value="14"></asp:ListItem>
             <asp:ListItem Text="15" Value="15"></asp:ListItem>
           </asp:DropDownList>
            <br />
                  <label id="rfloorsallowed" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
            <label><b><i>Area</i></b></label>
            <br />
            <asp:TextBox ID="txtrcoverarea" CssClass="txtcover" ClientIDMode="Static" AutoCompleteType="Disabled" runat="server"  placeholder="Covered area"></asp:TextBox>
            <asp:DropDownList ID="ddlrcoverarea" runat="server">
                 <asp:ListItem Text="Sq-ft" Value="Sq-ft"></asp:ListItem>
                <asp:ListItem Text="Sq-m" Value="Sq-m"></asp:ListItem>
             <asp:ListItem Text="Acre" Value="Acre"></asp:ListItem>
             

            </asp:DropDownList>
            <br />
            &nbsp
           <%-- <asp:Image ID="info" ImageUrl="Question-Mark-Picture.jpg" Width="40px" Height="40px" runat="server"/>--%>
            <p class="lblin1"><i>Covered area is the total area of your property under roof excluding corridors & balconies</i></p>
            <br />
              <label id="rcoverarea" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
             <asp:TextBox ID="txtrplotarea" CssClass="txtplot" ClientIDMode="Static" runat="server" AutoCompleteType="Disabled"  placeholder="Plot area"></asp:TextBox>
            <asp:DropDownList ID="ddlrplotarea" runat="server" OnSelectedIndexChanged="ddlunit2_SelectedIndexChanged">
                 <asp:ListItem Text="Sq-ft" Value="Sq-ft"></asp:ListItem>
                <asp:ListItem Text="Sq-m" Value="Sq-m"></asp:ListItem>
             <asp:ListItem Text="Acre" Value="Acre"></asp:ListItem>
                    </asp:DropDownList>
            <p class="lblin2"><i>Plot area is the total area of your property </i></p>

            <br />
              <label id="rplotarea" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />

             <label id="rtransaction" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp;   <label><b><i>Transaction Type</i></b></label>
            <br />
            <asp:RadioButton ID="rbtnrnew" Text="New property" ClientIDMode="Static" GroupName="rbtntype" runat="server" />
            &nbsp&nbsp
            <asp:RadioButton ID="rbtnrrescale" Text="Rescale" ClientIDMode="Static" GroupName="rbtntype" runat="server" />
            <br />
             <label id="rpossession" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp;  <label><b><i>Possession status</i></b></label>
            <br />
             <asp:RadioButton ID="rbtnruconstruction" CssClass="rbtnun" ClientIDMode="Static" Text="Under construction" GroupName="rbtnstatus" runat="server" />
            &nbsp&nbsp
            <asp:RadioButton ID="rbtnrmove" Text="Ready to move" ClientIDMode="Static" CssClass="rbtnre" GroupName="rbtnstatus" runat="server" />
            <br />
            <label id="ruconstruct" runat="server" ClientIDMode="Static" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
         
            <asp:DropDownList ID="ddlrmonth" ClientIDMode="Static" CssClass="ddlmonth" runat="server">
                <asp:ListItem Text="--month--" Value="none"></asp:ListItem>
                <asp:ListItem Text="January" Value="january"></asp:ListItem>
                <asp:ListItem Text="February" Value="february"></asp:ListItem>
                <asp:ListItem Text="March" Value="march"></asp:ListItem>
                <asp:ListItem Text="April" Value="april"></asp:ListItem>
                <asp:ListItem Text="May" Value="may"></asp:ListItem>
                <asp:ListItem Text="June" Value="june"></asp:ListItem>
                <asp:ListItem Text="July" Value="july"></asp:ListItem>
                <asp:ListItem Text="August" Value="august"></asp:ListItem>
                <asp:ListItem Text="September" Value="september"></asp:ListItem>
                <asp:ListItem Text="October" Value="october"></asp:ListItem>
                <asp:ListItem Text="November" Value="november"></asp:ListItem>
                <asp:ListItem Text="December"  Value="december"></asp:ListItem>
            </asp:DropDownList>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlmon" InitialValue="month"></asp:RequiredFieldValidator>--%>
            <asp:DropDownList ID="ddlryear" ClientIDMode="Static" CssClass="ddlyears" runat="server" >
                <asp:ListItem Text="--Year--" Value="none"></asp:ListItem>
                <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                <asp:ListItem Text="2025" Value="2026"></asp:ListItem>
                
            </asp:DropDownList>

               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlyear" InitialValue="year"></asp:RequiredFieldValidator>--%>
          
               <asp:DropDownList ID="ddlrage"  ClientIDMode="Static" CssClass="ddlage" runat="server" >
                <asp:ListItem Text="--Age of construction--" Value="none"></asp:ListItem>
                <asp:ListItem Text="New construction" Value="new"></asp:ListItem>
                <asp:ListItem Text="Less than 5 years" Value="Less than 5 years"></asp:ListItem>
                <asp:ListItem Text="5 to 10 years" Value="5 to 10 years"></asp:ListItem>
                <asp:ListItem Text="10 to 15 years" Value="10 to 15 years"></asp:ListItem>
                <asp:ListItem Text="15 to 20 years" Value="15 to 20 years"></asp:ListItem>
                
                
            </asp:DropDownList>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlbuildage" InitialValue="Age of construction"></asp:RequiredFieldValidator>--%>
            <br />
           

            <label><b><i>Price details</i></b></label>
            <br />
            <label><b>Expected price</b></label>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <label><b>Price per Sq-ft</b></label>
            <br />
       
 <asp:TextBox ClientIDMode="Static" ID="txtrprice" runat="server" AutoCompleteType="Disabled" placeholder="Enter total price" ></asp:TextBox>
           
                     &nbsp&nbsp&nbsp
            <asp:TextBox ID="txtpersqft" runat="server" ClientIDMode="Static" AutoCompleteType="Disabled"  placeholder="₹"></asp:TextBox>
         
             
              <br />
            <label id="rprice" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
         <label id="rpricepersqft" ClientIDMode="Static" runat="server" style="font-weight:bold;color:blue;"></label>&nbsp;&nbsp;&nbsp;&nbsp; 
         

            <br />
            <label><b>Price includes-</b></label>
          &nbsp&nbsp&nbsp
            <asp:CheckBox ID="chkrcarpark" ClientIDMode="Static" runat="server" Text="Car parking"/>
            &nbsp&nbsp&nbsp
             <asp:CheckBox ID="chkrclub" ClientIDMode="Static" runat="server" Text="Club Membership"/>
           <br />
            <asp:CheckBox ID="chkstamp" ClientIDMode="Static" runat="server" Text="Stamp Duty & Registration charges excluded" Checked="True"/>
            <br />
           
            <br />
            <label><b>Photos</b></label>
            <br />
            <label id="rfileres" ClientIDMode="Static" runat="server" style="color:blue;font-weight:bold"></label>
            <br />


            Upload image-<asp:FileUpload ID="fuload" ClientIDMode="Static" runat="server" BorderStyle="Ridge" AllowMultiple="True" />
            <br />
           <%-- <asp:RegularExpressionValidator ID="valfuload" runat="server" ControlToValidate="fuload" ErrorMessage="Only file types with jpg, png, gif are allowed." ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
             --%>
           <%-- <asp:UpdatePanel ID="sdad" runat="server" >
                <ContentTemplate>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="/^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$/" ControlToValidate="fuload" runat="server" EnableClientScript="true" ErrorMessage="Please select a valid Word or PDF File file." Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="Red" />     
         
                </ContentTemplate>

             

            </asp:UpdatePanel>--%>

         <%--  <asp:Button ID="btnupl" runat="server" Text="Upload" BackColor="#FFFFCC" BorderStyle="Ridge" OnClick="btnupl_Click" />--%>
           
                     <label id="lblimg" ClientIDMode="Static" runat="server" style="color:red;font-weight:bold">Only 8 images allowed only</label>
            <br />
 <asp:Button ID="btnupl" CssClass="w3-hover-red" ClientIDMode="Static" runat="server" Text="Upload" BackColor="#FFFFCC" OnClick="btnupl_Click" OnClientClick="return chkresidential()"/> 



            
            <%--<asp:Button ID="btnsub2" runat="server" BackColor="#FFFFCC" OnClick="btnsub2_Click" Text="Login &amp; Upload" />--%>



        </div>
        
      


    </div>
       

       
      <div class="modal fade" id="modalLoginForm" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
       <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close" runat="server">
          <span aria-hidden="true">&times;</span>
        </button> --%>
     </div>
    <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
            <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
            <br />
         <%--   <label data-error="wrong" data-success="right" for="defaultForm-email">Your email</label>
          <input type="email" id="txtid" class="form-control validate" runat="server"/>--%>
    
          <asp:TextBox ID="txtid" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Email-id or Mobile no."></asp:TextBox>
          
          <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="enter valid email" ControlToValidate="txtid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
       --%>    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="txtid"></asp:RequiredFieldValidator>
   --%>     </div>

        <div class="md-form mb-4">
          <%-- <i class="fas fa-lock prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
          <input type="password" id="txtpass" class="form-control validate" runat="server" required="required"/>
         --%>
           
       <asp:TextBox ID="txtpass" ClientIDMode="Static" runat="server" TextMode="Password" CssClass="form-control tes"
                    placeholder="Enter Password"/>
            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" ControlToValidate="txtpass"></asp:RequiredFieldValidator>--%>
        </div>
</div>
     
      <div class="modal-footer d-flex justify-content-center">
          
                 
              <asp:Button ID="btnmodalsubmit" ClientIDMode="Static" class="btn btn-default button" runat="server" Text="Login" OnClick="btnmodalsubmit_Click1" UseSubmitBehavior="true" />
    
      </div>
    </div>
  </div>
</div>
  

<%--<div class="text-center">
  <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalLoginForm">Launch
    Modal Login Form</a>
</div>--%>


     
      <div class="modal fade" id="warning" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
         
            <asp:Label ID="msgwarn" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
            <br />
            <br />
             <asp:Label ID="msgwarn1" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
       
       </div>
        </div>
     
   
    </div>
  </div>
</div>


    <script>
      
            
            //function currency()
            //{
            //    var x=document.getElementById("txtrprice");
               
            
            //    x.value=Intl.NumberFormat('en-INR', {style: 'currency', currency: 'target currency'}).format(x.value);
            //    alert(x.value);
            //}
         //   document.getElementById("txtrprice").addEventListener("keydown",currency);

        $(document).ready(function()
        {
            var x=<%=insertsuccess%>;
            var y=<%=insertsuccess1%>;
            if(x>0)
            {
                alert("your detail has saved in our system");

            }
            else if(y>0)
            {
                alert("your detail has saved in our system");
            }


        });


        function valaidateForm()
        {
            var valid=true;
            var cnt=0;
            if(document.getElementById("rbtnuser").checked)
            {
                cnt+=1;
               
            }
            if(document.getElementById("rbtnagent").checked)
            {
                cnt+=1;
            }
            if(document.getElementById("rbtnbuilder").checked)
            {
                cnt+=1;
            }

            if(cnt>0)
            {
               
                areyou.innerHTML="";
            }
            else
            {
                areyou.innerHTML="Select User Type ";
                valid=false;
            }

            //---------------------------------------------------------------------


            var cnt1=0;

            if(document.getElementById("rbtnsell").checked)
            {
                cnt1+=1;
               
            }
            if(document.getElementById("rbtnrent").checked)
            {
                cnt1+=1;
            }
            if(document.getElementById("rbtnpg").checked)
            {
                cnt1+=1;
            }

            if(cnt1>0)
            {
                Pfor.innerHTML="";
            }
            else
            {
                Pfor.innerHTML="Select Property For";
                valid=false;
            }

            //---------------------------------------------------------------------


            if(document.getElementById("ddlstate").value==0)
            {
                valid=false;         
                vstate.innerHTML="Select state";
            }
            else
            {
                vstate.innerHTML="";
               
            }

            if(document.getElementById("ddlcity").value==0)
            {
                valid=false;         
                vcity.innerHTML="Select city";
            }
            else
            {
                vcity.innerHTML="";
               
            }


            //---------------------------------------------------------------------

            var locality=document.getElementById("locality");
            if(document.getElementById("txtlocality").value=="" || document.getElementById("txtlocality").value==null)
            {
                valid=false; 
                locality.innerHTML="Locality is required";
            }
            else
            {
                locality.innerHTML="";
                var data= document.getElementById("txtlocality").value;
                var letters = /^[a-zA-z ]+$/;
                if(!data.match(letters))
                {
                    locality.innerHTML="Invalid Locality";
                    valid=false;
                }
                else
                {
                   
                    locality.innerHTML="";

                }

            }

            if(document.getElementById("txtapart").value=="" || document.getElementById("txtapart").value==null)
            {
                valid=false; 
                aname.innerHTML="Apartment name is required";
            }
            else
            {
                aname.innerHTML="";
                var data= document.getElementById("txtapart").value;
                var letters = /^[a-zA-z ]+$/;
                if(!data.match(letters))
                {
                    aname.innerHTML="Invalid Apartment name";
                    valid=false;
                }
                else
                {
                   
                    aname.innerHTML="";

                }
            }

            if(document.getElementById("txtaddress").value=="" || document.getElementById("txtaddress").value==null)
            {
                valid=false; 
                address.innerHTML="Address is required";
            }
            else
            {
                address.innerHTML="";
                var data= document.getElementById("txtaddress").value;
                var letters = /^[0-9a-zA-z ]+$/;
                if(!data.match(letters))
                {
                    address.innerHTML="Invalid address";
                    valid=false;
                }
                else
                {
                   
                    address.innerHTML="";

                }
            }

            if(document.getElementById("txtlandmark").value=="" || document.getElementById("txtlandmark").value==null)
            {
                valid=false; 
                landmark.innerHTML="landmark is required";
            }
            else
            {
                landmark.innerHTML="";
                var data= document.getElementById("txtlandmark").value;
                var letters = /^[a-zA-z ]+$/;
                if(!data.match(letters))
                {
                    landmark.innerHTML="Invalid Landmark";
                    valid=false;
                }
                else
                {
                   
                    landmark.innerHTML="";

                }
            }

            if(document.getElementById("bedr").value=="0")
            {
                valid=false; 
                bedroom.innerHTML="Select Bedrooms";
            }
            else
            {
                bedroom.innerHTML="";
            }

            if(document.getElementById("balcony").value=="0")
            {
                valid=false; 
                balconies.innerHTML="Select Balcony";
            }
            else
            {
                balconies.innerHTML="";
            }

            if(document.getElementById("floor").value=="0")
            {
                valid=false; 
                floorno.innerHTML="Select Floor no.";
            }
            else
            {
                floorno.innerHTML="";
            }

            if(document.getElementById("furnish").value=="0" )
            {
                valid=false; 
                furnis.innerHTML="Select Furnish Status";
            }
            else
            {
                furnis.innerHTML="";
            }

            if(document.getElementById("bathroom").value=="0" )
            {
                valid=false; 
                bath.innerHTML="Choose bathrooms";
            }
            else
            {
                bath.innerHTML="";
            }

            if(document.getElementById("txtflooring").value=="" || document.getElementById("txtflooring").value==null)
            {
                valid=false; 
                floortype.innerHTML="Put Floor Type";
            }
            else
            {
                floortype.innerHTML="";
                var reg=/^[a-zA-z ]+$/;
                if(!document.getElementById("txtflooring").value.match(reg))
                {
    
                    floortype.innerHTML="Invalid Floortype"; 
                    valid=false;
                }
                else
                {

                    floortype.innerHTML="";
                }
            }

            if(document.getElementById("ddlelectricity").value=="0")
            {
                valid=false; 
                stelec.innerHTML="Select Electricity status";
            }
            else
            {
                stelec.innerHTML="";
            }

            if(document.getElementById("lift").value=="0")
            {
                valid=false; 
                lifts.innerHTML="Select Lifts";
            }
            else
            {
                lifts.innerHTML="";
            }

            if(document.getElementById("txtcoverarea").value=="" || document.getElementById("txtcoverarea").value==null )
            {
                valid=false; 
                coverar.innerHTML="Fill Covered area";
            }
            else
            {
                coverar.innerHTML="";

              
                var reg=/^[0-9]+$/;
                if(!document.getElementById("txtcoverarea").value.match(reg))
                {

                    coverar.innerHTML="Put Numeric value in Covered area";
                    valid=false;
                }
                else{

                    coverar.innerHTML="";
                }

            }

            
            if(document.getElementById("txtplotarea").value=="" || document.getElementById("txtplotarea").value==null )
            {
                valid=false; 
                plotar.innerHTML="Fill Plot area";
            }
            else
            {
                plotar.innerHTML="";
                var reg=/^[0-9]+$/;
                if(!document.getElementById("txtplotarea").value.match(reg))
                {

                    plotar.innerHTML="Put Numeric value in Plot area";
                    valid=false;
                }
                else{

                    plotar.innerHTML="";
                }
            }
            var cnt2=0
            if(document.getElementById("rbtnnew").checked)
            {
                cnt2+=1;

            }
            if(document.getElementById("rbtnscale").checked)
            {
                cnt2+=1
            }

            if(cnt2>0)
            {
                trType.innerHTML="";

            }
            else
            {
                trType.innerHTML="Select Transaction Type";
                valid=false;
            }

            var cnt3=0,cnt4=0,cnt5=0;
            if(document.getElementById("rbtnstatus1").checked)
            {
                cnt3=0;
                cnt3+=1;
                if(document.getElementById("ddlmon").value=="none" && document.getElementById("ddlyear").value=="none")
                {
                    cnt4+=1;

                }
                else if(document.getElementById("ddlmon").value=="none")
                {

                    cnt4+=1;
                }
               else if(document.getElementById("ddlyear").value=="none")
                {

                    cnt4+=1;
                }

                if(cnt4>0)
                {
                    possessmsg.innerHTML="Select Month and Year";
                    valid=false;
                }
                else
                {
                 
                    possessmsg.innerHTML="";
                }
               

            }
            if(document.getElementById("rbtnstatus2").checked)
            {
                cnt3=0;
                cnt3+=1;
                if(document.getElementById("ddlbuildage").value=="none")
                {
                    cnt5+=1;
                }

                
                if(cnt5>0)
                {
                 
                    possessmsg.innerHTML="Select Age of Property";
                    valid=false;
                }

                else
                {
                    possessmsg.innerHTML="";
                  
                }

            }

            if(cnt3>0)
            {
                possess.innerHTML="";

            }
            else
            {

                possess.innerHTML="Select possession Status";
                valid=false;
            }


            if(document.getElementById("txtprice").value=="" || document.getElementById("txtprice").value==null)
            {
                lblprice.innerHTML="Enter the Expected Price";
                valid=false;
            }
            else{
                lblprice.innerHTML="";

             
                //var reg=/^[0-9]+$/;
                //if(!document.getElementById("txtprice").value.match(reg))
                //{

                //    lblprice.innerHTML="Put Numeric value in Price field";
                //    valid=false;
                //}
                //else{
                //    lblprice.innerHTML="";
                    
                //}
            }

            
            if(document.getElementById("txtsq").value=="" || document.getElementById("txtsq").value==null)
            {
                lblsq.innerHTML="Enter the Expected Price of per Sq-ft";
                valid=false;
            }
            else{
                lblsq.innerHTML="";

                //var reg=/^[0-9]+$/;
                //if(!document.getElementById("txtsq").value.match(reg))
                //{

                //    lblsq.innerHTML="Put Numeric value in Price per Sq-ft field";
                //    valid=false;
                //}
                //else{
                //    lblsq.innerHTML="";
                    
                //}

            }

            if(document.getElementById("Fileload").files.length==0)
            {

                valid=false;
                fileres.style.color="blue";
                fileres.style.fontWeight="bold";
                fileres.innerHTML="Please upload some photos with the property data";
            }
            else
            {

                fileres.innerHTML="";
            }
         


           

            return valid;





        }

        //$("#txtprice").change(function(){
        //    var reg=/^[0-9]+$/;
        //    if(document.getElementById("txtprice").value.match(reg))
        //    {
        //        var formatter = new Intl.NumberFormat('en-US', {
        //            style: 'currency',
        //            currency: 'INR',
        //        });
        //        var price=document.getElementById("txtprice").value;
        //        price=parseInt(price);
               
        //        document.getElementById("txtprice").value= formatter.format(price);

        //    } 
            
        //});
        
        $(document).ready(function(){
            
            $("#txtrprice").keyup(function(){
                
                var x = $("#txtrprice").val();
               
            


                if(x!="")
                {
                    


                    $.ajax({
                        type:"POST",
                        url: 'postproperty.aspx/convertcur',
                        data: JSON.stringify({ 'cur': x }),
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success:function(response){
                            console.log(response.d);
                           $("#txtrprice").val(response.d);
                        }
                                        , error: function (response) {


                                        }

                    });
                }

           
                
            
           

            
            });

            $("#txtpersqft").keyup(function(){
                
                var value=  $("#txtpersqft").val();

                $.ajax({
                   type:"post", 
                   url: 'postproperty.aspx/convertcursqft',
                   data:JSON.stringify({'cur':value}),
                   contentType:"application/json",
                   datatype:'json',
                   success:function(response)
                   {


                       $("#txtpersqft").val(response.d);
                   }
                                        , error: function (response) {

                                            $('#rpricepersqft').val(response.d);

                                        }
                });
                

            });



            $("#txtprice").keyup(function(){
                
                var value1=  $("#txtprice").val();

                
                    $.ajax({
                        type:"post", 
                        url: 'postproperty.aspx/convertcurapart',
                        data:JSON.stringify({'cur':value1}),
                        contentType:"application/json",
                        datatype:'json',
                        success:function(response)
                        {


                            $("#txtprice").val(response.d);
                        }
                                            , error: function (response) {

                                                //  $('#txtprice').val(response.d);
                                               

                                            }
                    });
                   

            });



            $("#txtsq").keyup(function(){
                
                var value2=  $("#txtsq").val();

                $.ajax({
                    type:"post", 
                    url: 'postproperty.aspx/convertcurapartsqft',
                    data:JSON.stringify({'cur':value2}),
                    contentType:"application/json",
                    datatype:'json',
                    success:function(response)
                    {


                        $("#txtsq").val(response.d);
                    }
                                        , error: function (response) {

                                            $('#txtsq').val(response.d);

                                        }
                });
                

            });







        });



           

        




        function chkresidential()
        {
            var valid=true;
            var cnt=0;
            if(document.getElementById("rbtnuser").checked)
            {
                cnt+=1;
               
            }
            if(document.getElementById("rbtnagent").checked)
            {
                cnt+=1;
            }
            if(document.getElementById("rbtnbuilder").checked)
            {
                cnt+=1;
            }

            if(cnt>0)
            {
               
                areyou.innerHTML="";
            }
            else
            {
                areyou.innerHTML="Select User Type ";
                valid=false;
            }

            //---------------------------------------------------------------------


            var cnt1=0;

            if(document.getElementById("rbtnsell").checked)
            {
                cnt1+=1;
               
            }
            if(document.getElementById("rbtnrent").checked)
            {
                cnt1+=1;
            }
            if(document.getElementById("rbtnpg").checked)
            {
                cnt1+=1;
            }

            if(cnt1>0)
            {
                Pfor.innerHTML="";
            }
            else
            {
                Pfor.innerHTML="Select Property For";
                valid=false;
            }

            //---------------------------------------------------------------------


            if(document.getElementById("ddlstate").value==0)
            {
                valid=false;         
                vstate.innerHTML="Select state";
            }
            else
            {
                vstate.innerHTML="";
               
            }

            if(document.getElementById("ddlcity").value==0)
            {
                valid=false;         
                vcity.innerHTML="Select city";
            }
            else
            {
                vcity.innerHTML="";
               
            }


            //---------------------------------------------------------------------


            if(document.getElementById("txtlocality").value=="" || document.getElementById("txtlocality").value==null)
            {
                valid=false; 
                locality.innerHTML="Locality is required";
            }
            else
            {
                locality.innerHTML="";

                var reg=/^[a-zA-Z ]+$/;
                if(!document.getElementById("txtlocality").value.match(reg))
                {

                    locality.innerHTML="Invalid Locality";
                    valid=false;
                }
                else{
                    lblprice.innerHTML="";
                    
                }
            }

            //if(document.getElementById("txtapart").value=="" || document.getElementById("txtapart").value==null)
            //{
            //    valid=false; 
            //    aname.innerHTML="Apartment name is required";
            //}
            //else
            //{
            //    aname.innerHTML="";
            //}

            if(document.getElementById("txtRaddress").value=="" || document.getElementById("txtRaddress").value==null)
            {
                valid=false; 
                raddress.innerHTML="Address is required";
            }
            else
            {
                raddress.innerHTML="";

                var reg=/^[0-9a-zA-Z ]+$/;
                if(!document.getElementById("txtRaddress").value.match(reg))
                {

                    raddress.innerHTML="Invalid address";
                    valid=false;
                }
                else{
                    raddress.innerHTML="";
                    
                }
            }

            if(document.getElementById("txtRlandmark").value=="" || document.getElementById("txtRlandmark").value==null)
            {
                valid=false; 
                rlandmark.innerHTML="landmark is required";
            }
            else
            {
                rlandmark.innerHTML="";
                var reg=/^[a-zA-Z ]+$/;
                if(!document.getElementById("txtRlandmark").value.match(reg))
                {

                    rlandmark.innerHTML="Invalid Landmark";
                    valid=false;
                }
                else{
                    rlandmark.innerHTML="";
                    
                }

            }

            if(document.getElementById("ddlrbed").value==0 )
            {
                valid=false; 
                rbedroom.innerHTML="Select Bedrooms";
            }
            else
            {
               rbedroom.innerHTML="";
            }

            if(document.getElementById("ddlrbalony").value==0 )
            {
                valid=false; 
               rbalcony.innerHTML="Select Balcony";
            }
            else
            {
                rbalcony.innerHTML="";
            }

            if(document.getElementById("ddlrfloor").value==0 )
            {
                valid=false; 
                rfloor.innerHTML="Select Floor no.";
            }
            else
            {
                rfloor.innerHTML="";
            }

            if(document.getElementById("ddlrfurnish").value=="0" )
            {
                valid=false; 
                rfurnish.innerHTML="Select Furnish Status";
            }
            else
            {
                rfurnish.innerHTML="";
            }

            if(document.getElementById("ddlrbathroom").value=="0" )
            {
                valid=false; 
                rbathroom.innerHTML="Choose bathrooms";
            }
            else
            {
                rbathroom.innerHTML="";
            }

            if(document.getElementById("txtrflooring").value=="" || document.getElementById("txtrflooring").value==null)
            {
                valid=false; 
                rflooring.innerHTML="Put Floor Type";
            }
            else
            {
                rflooring.innerHTML="";
                var reg=/^[a-zA-Z ]+$/;
                if(!document.getElementById("txtrflooring").value.match(reg))
                {

                    rflooring.innerHTML="Invalid Flooring Type";
                    valid=false;
                }
                else{
                    rflooring.innerHTML="";
                    
                }

            }

            if(document.getElementById("ddlrelectricity").value=="0")
            {
                valid=false; 
                relectricity.innerHTML="Select Electricity status";
            }
            else
            {
                relectricity.innerHTML="";
            }

            if(document.getElementById("ddlrfloors").value=="0")
            {
                valid=false; 
                rfloorsallowed.innerHTML="Select Floors allowed for construct";
            }
            else
            {
                rfloorsallowed.innerHTML="";
            }

            if(document.getElementById("txtrcoverarea").value=="" || document.getElementById("txtrcoverarea").value==null )
            {
                valid=false; 
                rcoverarea.innerHTML="Fill Covered area";
            }
            else
            {
                rcoverarea.innerHTML="";

                var reg=/^[0-9]+$/;
                if(!document.getElementById("txtrcoverarea").value.match(reg))
                {

                    rcoverarea.innerHTML="Put numeric value in covered area";
                    valid=false;
                }
                else{
                    rcoverarea.innerHTML="";
                    
                }

            }

            
            if(document.getElementById("txtrplotarea").value=="" || document.getElementById("txtrplotarea").value==null )
            {
                valid=false; 
                rplotarea.innerHTML="Fill Plot area";
            }
            else
            {
                rplotarea.innerHTML="";

                var reg=/^[0-9]+$/;
                if(!document.getElementById("txtrplotarea").value.match(reg))
                {

                    rplotarea.innerHTML="Put numeric value in plot area";
                    valid=false;
                }
                else{
                    rplotarea.innerHTML="";
                    
                }

            }
            var cnt2=0
            if(document.getElementById("rbtnrnew").checked)
            {
                cnt2+=1;

            }
            if(document.getElementById("rbtnrrescale").checked)
            {
                cnt2+=1
            }

            if(cnt2>0)
            {
                rtransaction.innerHTML="";

            }
            else
            {
                rtransaction.innerHTML="Select Transaction Type";
                valid=false;
            }

            var cnt3=0,cnt4=0,cnt5=0;
            if(document.getElementById("rbtnruconstruction").checked)
            {
                cnt3=0;
                cnt3+=1;
                if(document.getElementById("ddlrmonth").value=="none" && document.getElementById("ddlryear").value=="none")
                {
                    cnt4+=1;

                }
                else if(document.getElementById("ddlrmonth").value=="none")
                {

                    cnt4+=1;
                }
                else(document.getElementById("ddlryear").value=="none")
                {

                    cnt4+=1;
                }

                if(cnt4>0)
                {
                    ruconstruct.innerHTML="Select Month and Year";
                    valid=false;
                }
                else
                {
                 
                    ruconstruct.innerHTML="";
                }
               

            }
            if(document.getElementById("rbtnrmove").checked)
            {
                cnt3=0;
                cnt3+=1;
                if(document.getElementById("ddlrage").value=="none")
                {
                    cnt5+=1;
                }

                
                if(cnt5>0)
                {
                 
                    ruconstruct.innerHTML="Select Age of Property";
                    valid=false;
                }

                else
                {
                    ruconstruct.innerHTML="";
                  
                }

            }

            if(cnt3>0)
            {
                rpossession.innerHTML="";

            }
            else
            {

                rpossession.innerHTML="Select possession Status";
                valid=false;
            }


            if(document.getElementById("txtrprice").value=="" || document.getElementById("txtrprice").value==null)
            {
                rprice.innerHTML="Enter the Expected Price";
                valid=false;
            }
            else{
                rprice.innerHTML="";
            
                var reg=/^[0-9]+$/;
                if(!document.getElementById("txtrprice").value.match(reg))
                {

                    rprice.innerHTML="Put numeric value in Expected price";
                    valid=false;
                }
                else{
                    rprice.innerHTML="";
                    
                }
            
            }

            
            if(document.getElementById("txtpersqft").value=="" || document.getElementById("txtpersqft").value==null)
            {
                rpricepersqft.innerHTML="Enter the Expected Price of per Sq-ft";
                valid=false;
            }
            else{
                rpricepersqft.innerHTML="";

                var reg=/^[0-9]+$/;
                if(!document.getElementById("txtpersqft").value.match(reg))
                {

                    rpricepersqft.innerHTML="Put numeric value in Expected Price Per Sq-ft";
                    valid=false;
                }
                else{
                    rpricepersqft.innerHTML="";
                    
                }
            }

          
            if(document.getElementById("fuload").files.length==0)
            {

                valid=false;
                fileres.style.color="blue";
                fileres.style.fontWeight="bold";
                rfileres.innerHTML="Please upload some photos with the property data";
            }

           

            return valid;



        }

       
        
    
      
    </script>



        
     

    
    </asp:Content>

