<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="newadminaction.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <link rel="stylesheet" href="bootstrap.min.css" />
    <link  rel="stylesheet" href="w3.css"/>

     <script src="https://kit.fontawesome.com/6d17d89b76.js"></script>
      <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.4/themes/cupertino/jquery-ui.css" />


     <script src="jquery-3.5.0.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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
  <script>
      $(function () {
 
          $("#textsearch").autocomplete({
              source: 'getdata.ashx'
          });
      });
  </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 

   <div class="row">
        <div class="col-md-2">

        </div> 
        <div class="col-md-8">
           <%-- <div class="input-group mb-3">
                <div class="input-group-prepend">
            <span>@</span>
                </div>
                <%-- <asp:TextBox ID="textsearch"  CssClass="w3-input w3-border w3-round-xxlarge" runat="server" placeholder="Enter username" Width="500">    </asp:TextBox>
                <input id="Text1" type="text" class="form-control"/>
            </div>--%>

 <div class="input-group mb-3">
 <asp:TextBox ID="textsearch" runat="server" ClientIDMode="Static" placeholder="Enter username" CssClass="form-control"></asp:TextBox>
        <div class="input-group-append">
      <button id="searchuser"  class="form-control" runat="server" onserverclick="search_click">  <i class="fa fa-search" aria-hidden="true"></i></button>

</div>

     </div>
  </div>
        <div class="col-md-2">
            
        </div>


         </div>
    <br />
   
    <br />
    <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-8">
            <label id="msg" runat="server" style="font-family:'Times New Roman';font-size:larger;"></label>
 
    <asp:Repeater ID="userinfo" runat="server">
        <ItemTemplate>
            <style>
                table, td, th {  
  border:solid #ddd;

  text-align: left;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 15px;
}
            </style>

           
       <div class="w3-card-2">
                <table>
                <tbody>
                    <tr>
                        <td>
                         Username-
                        </td>
                        <td><asp:Label ID="uname" runat="server" Text='<%#Eval("username")%>' Font-Bold="true"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>
                         User Type-
                        </td>
                        <td><asp:Label ID="Label3" runat="server" Text='<%#Eval("user_type")%>' Font-Bold="true"></asp:Label></td>
                    </tr>


                    <tr>
                         <td>
                        Email-
                        </td>
                        <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("email")%>' Font-Bold="true"></asp:Label></td>
                  
                    </tr>

                      <tr>
                         <td>
                        contact no-
                        </td>
                        <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("contactno")%>' Font-Bold="true"></asp:Label></td>
                  
                    </tr>
                
                        <tr>
                         <td>
                        Joining date-
                        </td>
                        <td><asp:Label ID="Label6" runat="server" Text='<%#Eval("joindate")%>' Font-Bold="true"></asp:Label></td>
                  

                    </tr>


                </tbody>
            </table>
            <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
           <asp:Button ID="actiononit" CssClass="w3-button w3-hover-red" runat="server" OnClick="actiononit_ServerClick" Text="Action on this User"></asp:Button> 
           <div style="text-align:right">

 <asp:Button ID="seeUser" runat="server" CssClass="w3-button" OnClick="seeUser_ServerClick" Text="See User property records" UseSubmitBehavior="true"></asp:Button>
 
            </div>
           </div>
<div id="accordion">
  <div class="card">
    
        <button class="btn btn-link" id="btnsh" onclick="return false">
         Send Email to User
        </button>
     
    </div>

    <div id="collapseOne" class="hide">
      <div class="card">
      <asp:TextBox ID="txtsub" runat="server" placeholder="Email subject" CssClass="form-control" Width="500"></asp:TextBox>
          <br />
          <br />
          <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Email body" TextMode="MultiLine" Rows="5" Columns="30"></asp:TextBox>
          <br />
          <br />

          <asp:Button ID="btnsend" runat="server" Text="Send" CssClass="w3-btn w3-hover-red" OnClick="btnsend_Click"/>

            </div>
    </div>
  </div>
    </div>


            
    <script>
        $(document).ready(function () {

            $("#collapseOne").hide();

            document.getElementById("btnsh").addEventListener('click', function () {
                if (document.getElementById("collapseOne").classList=="show") {
                    //$("#collapseOne").hide();
                    //$("#collapseOne").removeClass("show");
                    //$("#collapseOne").addClass("hide");
                    
                    document.getElementById("collapseOne").classList.remove("show");
                    document.getElementById("collapseOne").classList.add("hide");
                    $("#collapseOne").slideUp();

                }
                else {
                    $("#collapseOne").slideDown();
                    document.getElementById("collapseOne").classList.remove("hide");
                    document.getElementById("collapseOne").classList.add("show");
            
                   
                }

            });


        });


    </script>




        </ItemTemplate>


    </asp:Repeater>


        </div>
        <div class="col-md-2">

        </div>

    </div>
    
    
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
          
          <div style="width:100%;height:1cm;text-align:center;background-color:orange;">
               <label class="w3-text-white" style="font-family:'Times New Roman';font-size:large" id="blockuser">Block User's Activity</label>
          </div>
            
       <br />
          <div id="useractivity">
           <table>
            <tbody>
                <tr class="w3-card-2">
                    <td>
                        <label>New property Post</label>
                    </td>
                    <td>
                      <asp:Label ID="status" ClientIDMode="Static" runat="server" Text="Not blocked"></asp:Label>
                    </td>
                    <td>
                        <label class="switch">
  <input type="checkbox" id="chk" class="unchk" runat="server"/>
  <span class="slider round"></span>
</label>
                        <br />
                    </td>
                </tr>
                <tr>
  <td>
                        <label>Update Posted property</label>
                    </td>
                    <td>
                      <asp:Label ID="status1" ClientIDMode="Static" runat="server" Text="Not blocked"></asp:Label>
                    </td>
                    <td>
                        <label class="switch">
      <input type="checkbox" id="chk1" class="unchk" runat="server"/>
  <span class="slider round"></span>
</label>
<br />
                    </td>

                </tr>
                
                <tr>
                      <td>
                        <label>Entire Activity block</label>
                    </td>
                    <td>
                      <asp:Label ID="status2" runat="server" ClientIDMode="static" Text="Not blocked" ></asp:Label>
                    </td>
                    <td>
                        <label class="switch">
  <%--<input type="checkbox" id="chk2" runat="server" />--%>
                       
                            <input type="checkbox" id="chk2" runat="server"/>
  <span class="slider round"></span>
</label>
                        <br />
                    </td>
                </tr>
            </tbody>
        </table>
 
     </div>
         
    
    </div>
   
 
  
</div>
      

  </div>

   </div>

    <script>
      
        var x = '<%=chk.ClientID%>';
        var y = '<%=chk1.ClientID%>';
        var z = '<%=chk2.ClientID%>';
        $("#"+'<%=chk2.ClientID%>').click(function () {
           
           
            if ((document.getElementById(x).className == "unchk") && (document.getElementById(y).className == "unchk")) {
               // alert("ccccccccs");
                $("#"+x).attr("checked", "checked");
                $("#"+y).attr("checked", "checked");
                $("#"+x).removeClass("unchk");
                $("#"+x).addClass("chk");
                $("#"+y).removeClass("unchk");
                $("#"+y).addClass("chk");
            }
            else if ($("#"+x).hasClass("unchk") && !$("#"+y).hasClass("unchk")) {
             //   alert("ddds");
                $("#"+x).attr("checked", "checked");
                $("#"+x).removeClass("unchk");
                $("#"+x).addClass("chk");
            }
            else if ($("#"+y).hasClass("unchk") && !$("#"+x).hasClass("unchk"))
            {
               // alert("eeees");
                $("#"+y).attr("checked", "checked");
                $("#"+y).removeClass("unchk");
                $("#"+y).addClass("chk");
                
            }
            else {
               // alert("ffffs");
                //$("#"+x).removeAttr("checked");
                //$("#"+y).removeAttr("checked");
                //$("#"+x).removeClass("chk");
                //$("#"+x).addClass("unchk");
                //$("#"+y).removeClass("chk");
                //$("#"+y).addClass("unchk");
            }

            

         

            //alert(document.getElementById(x).className);
            //alert(document.getElementById(y).className);

        });


        $("#"+x).click(function () {
            $("#"+x).removeClass("unchk");
            $("#"+x).addClass("chk");
            if ($(this).is(":checked")) {


                $.ajax({
                    type: "POST",
                    url: 'newadminaction.aspx/setdata',
                    data: JSON.stringify({ 'stat': "one_checked" }),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (response) {
                        if (response.d == 1) {
                          
                            $("#status").text("Blocked");

                        }

                    }
                                    , error: function (response) {

                                        alert(response.d + "asdbhas");

                                    }
                });



            }
            else {
                alert("unchecked");
                $.ajax({
                    type: "POST",
                    url: "newadminaction.aspx/setdata",
                    data: JSON.stringify({ 'stat': 'one_notchecked' }),
                    contentType: "application/json",
                    dataType: 'json',
                    success: function (response) {
                        if (response.d == 1) {

                            $("#status").text("Not Blocked");

                        }

                        
                    },
                    error:function(response){
                    
                        alert(Error(response.d));

                    }
                    




                });




            }



        });


        $("#"+y).click(function () {



            if ($(this).is(":checked")) {


                $.ajax({
                    type: "POST",
                    url: 'newadminaction.aspx/setdata',
                    data: JSON.stringify({ 'stat': "two_checked" }),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (response) {
                        if (response.d == 1) {

                            $("#status1").text("Blocked");

                        }

                    }
                                    , error: function (response) {

                                        alert(response.d + "asdbhas");
                                    }
                });



            }
            else {


                $.ajax({
                    type: "POST",
                    url: 'newadminaction.aspx/setdata',
                    data: JSON.stringify({ 'stat': "two_notchecked" }),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (response) {
                        if (response.d == 1) {

                            $("#status1").text("Not Blocked");

                        }

                    }
                                    , error: function (response) {

                                        alert(response.d + "asdbhas");
                                    }
                });

            }



        });


        $("#"+z).click(function () {

            if ($(this).is(":checked")) {


                $.ajax({
                    type: "POST",
                    url: 'newadminaction.aspx/setdata',
                    data: JSON.stringify({ 'stat': "three_checked" }),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (response) {
                        $("#status2").text("Blocked");

                    }
                                    , error: function (response) {

                                        alert(response.d + "asdbhas");
                                    }
                });



            }
            else {
                $.ajax({
                    type: "POST",
                    url: 'newadminaction.aspx/setdata',
                    data: JSON.stringify({ 'stat': "three_notchecked" }),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (response) {
                        $("#status2").text("Not Blocked");

                    }
                                  , error: function (response) {

                                      alert(response.d + "asdbhas");
                                  }
                });

              
            }



        });


    </script>


 


</asp:Content>

