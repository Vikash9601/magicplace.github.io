<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <style>
     
       .glow {
  font-size: 80px;
  color: #fff;

  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}


       .message {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.message .text{
  visibility: hidden;
  width: 200px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
}

.message:hover .text {
  visibility: visible;
}






       .row{
       color:blue;
     position:relative;
     left:0.3cm;
       }

       .search {
       position:relative;
       left:2.5cm;
       
       }

   </style>
   <%-- <link rel="stylesheet" href="w3.css" />

    <script src="jquery-3.4.1.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
                $(".ddlx option:first-child").attr("disabled", "disabled");
                $(".ddly option:first-child").attr("disabled", "disabled");
              });

    </script>
    <link rel="stylesheet"  href="w3.css"/>
    <link rel="stylesheet" href="bootstrap.min.css" />

    <script>
        var images = ["image/Orange%20White%20Sunset%20Photo%20Quote%20Facebook%20Cover%20(1).jpg","image/slider01_single_south.jpg"];
        var arraylen = images.length;
        var a = 0;
        function imgchange() {
       
            var x = document.getElementById("getimg");
            
          
            x.src = images[a];
            a++;
            if (a == arraylen) {
                a = 0;
            }


        }
       
      
        setInterval(imgchange, 4000);


      

          
  
        
    </script>

    <%--<input type="text" name="txtloc" placeholder="Enter location or project" runat="server"/>
    <select name="ddlptype" class="w3-dropdown-hover" runat="server">
        <option>Property type</option>
        <option value="apartment">Apartment</option>
        <option value="houses/villas">villas</option>
        <option value="shops">shops</option>


    </select>
    <select name="ddlprice" class="w3-dropdown-hover" runat="server">
        <option>Budget</option>
        <option>5 lac-10 lac</option>
        <option>10 lac-15 lac</option>
        <option>15 lac-20 lac</option>
        <option>20 lac-30 lac</option>
        <option>30 lac-40 lac</option>
        <option>50 lac-60 lac</option>
</select>--%>
   <div class="container-fluid">
       <img src="image/Poster-simple-PixTeller%20(1).png" id="getimg" style="image-rendering:optimizeQuality;width:100%;height:9cm;" />

   </div>
    <br />
 <div class="container">
     <div class="row no-gutters search">
        <div class="col message">
             <asp:TextBox ID="txtloc" ClientIDMode="Static" CssClass="form-control" runat="server" placeholder="  Enter location"></asp:TextBox>
            
               <span class="text">Enter location,city </span>
        </div>

        <div class="col">
        <asp:DropDownList ID="ddlptype" ClientIDMode="Static" runat="server" CssClass="form-control ddlx">
        <asp:ListItem>Propert type</asp:ListItem>
        <asp:ListItem value="apartment">Apartment</asp:ListItem>
        <asp:ListItem Value="houses/villas">Houses</asp:ListItem>
        <asp:ListItem Value="shops">Shops</asp:ListItem>

                                                          
    </asp:DropDownList>
        </div>

        <div class="col">
             <asp:DropDownList ID="ddlprice" ClientIDMode="Static" runat="server" CssClass="form-control ddly">
        <asp:ListItem>Budget</asp:ListItem>
        <asp:ListItem>10 lac-20 lac</asp:ListItem>
        <asp:ListItem>20 lac-30 lac</asp:ListItem>
        <asp:ListItem>30 lac-40 lac</asp:ListItem>
        <asp:ListItem>40 lac-50 lac</asp:ListItem>
        <asp:ListItem>50 lac-60 lac</asp:ListItem>
        <asp:ListItem>60 lac-70 lac</asp:ListItem>

    </asp:DropDownList>
        </div>

        <div class="col">
             <asp:Button ID="btnsubmit" ClientIDMode="Static" runat="server" Text="Search" Width="130px" Height="35" BorderStyle="Ridge" CssClass="form-control w3-hover-red" OnClick="btnsubmit_Click" OnClientClick="return check()" />


        </div>
    </div>

   
 </div>
    

   

   <br />
   <%-- <div class="padding">--%>
    <div class="row c">
       
        <div class="col" id="a1">
 <asp:ImageButton ID="img1" width="450" height="300" runat="server"/> 
            <br />
 <asp:Label ID="lblimg1" runat="server" Text=""></asp:Label>
            <br />
              <asp:Label ID="lblimg1_1" runat="server" Text=""></asp:Label>
            <br />
             <asp:Label ID="lblimg1_2" runat="server" Text=""></asp:Label>


        </div>


        <div class="col" id="a2">
             <asp:ImageButton ID="img2" width="450" height="300" runat="server" OnClick="img2_Click"/>
            <br />
          <asp:Label ID="lblimg2" runat="server" Text="Label"></asp:Label>
            <br />
           <asp:Label ID="lblimg2_1" runat="server" Text="Label"></asp:Label>
            <br />
           <asp:Label ID="lblimg2_2" runat="server" Text="Label"></asp:Label>
            <br />
            </div>
        <div class="col" id="a3">
             <asp:ImageButton ID="img3" width="450" height="300" runat="server"/>
            <br />
       <asp:Label ID="lblimg3" runat="server" Text="Label"></asp:Label> 
            <br />
     <asp:Label ID="lblimg3_1" runat="server" Text="Label"></asp:Label>
            <br />
<asp:Label ID="lblimg3_2" runat="server" Text="Label"></asp:Label>
            <br />
            </div>
        </div>
 <br />

   
        <br />

   
   

 <div class="row">
     <div class="col" id="a4">
            <asp:ImageButton ID="img4" width="450" height="300" runat="server"/> 
         <br />
         <br />
          <asp:Label ID="lblimg4" runat="server" Text="vikash"></asp:Label>
         <br />
           <asp:Label ID="lblimg4_1" runat="server" Text="vikash"></asp:Label>
         <br />
         <asp:Label ID="lblimg4_2" runat="server" Text="vikash"></asp:Label>

     </div>
     <div class="col" id="a5">
          <asp:ImageButton ID="img5" width="450" height="300" runat="server"/>
         <br />
         <br />
          <asp:Label ID="lblimg5" runat="server" Text="Label"></asp:Label>
         <br />
         <asp:Label ID="lblimg5_1" runat="server" Text="Label"></asp:Label> 
         <br />
          <asp:Label ID="lblimg5_2" runat="server" Text="Label"></asp:Label> 
     </div>
     <div class="col" id="a6">
          <asp:ImageButton ID="img6" width="450" height="300" runat="server"/>
         <br />
         <br />
         <asp:Label ID="lblimg6" runat="server" Text="Label"></asp:Label>   
         <br />
         <asp:Label ID="lblimg6_1" runat="server" Text="Label"></asp:Label>
         <br />
        <asp:Label ID="lblimg6_2" runat="server" Text="Label"></asp:Label>

     </div>
     </div>
 
    <div class="showresult">
        <table>
            <tr>

                <th></th>

            </tr>
            <tr>

            </tr>

        </table>

    </div>
    <br />
    <br />

    
 <div class="row">
     <div class="col" id="Div1">
            <asp:ImageButton ID="rimg" width="450" height="300" runat="server"/> 
         <br />
         <br />
          <asp:Label ID="rlbltype1" runat="server" Text="vikash"></asp:Label>
         <br />
           <asp:Label ID="rlbladd1" runat="server" Text="vikash"></asp:Label>
         <br />
         <asp:Label ID="rlblprice1" runat="server" Text="vikash"></asp:Label>

     </div>
     <div class="col" id="Div2">
          <asp:ImageButton ID="rimg2" width="450" height="300" runat="server"/>
         <br />
         <br />
          <asp:Label ID="rlbltype2" runat="server" Text="Label"></asp:Label>
         <br />
         <asp:Label ID="rlbladd2" runat="server" Text="Label"></asp:Label> 
         <br />
          <asp:Label ID="rlblprice2" runat="server" Text="Label"></asp:Label> 
     </div>
     <div class="col" id="Div3">
          <asp:ImageButton ID="rimg3" width="450" height="300" runat="server"/>
         <br />
         <br />
         <asp:Label ID="rbltype3" runat="server" Text="Label"></asp:Label>   
         <br />
         <asp:Label ID="rlbladd3" runat="server" Text="Label"></asp:Label>
         <br />
        <asp:Label ID="rlblprice3" runat="server" Text="Label"></asp:Label>

     </div>
     </div>
    <br />
   
    <footer>
<div style="height:120px;background-color:black;">
    <p class="glow" style="color:azure;font-family:Gabriola;font-size:6ch;position:relative;top:1cm;left:17cm;"><u>MagicPlace</u></p>
</div>

    </footer>
      
      

  
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:simplestring %>" SelectCommand="SELECT * FROM [pimages]"></asp:SqlDataSource>
       
  
    <div id="myModal" class="modal" tabindex="-1" role="dialog" style="margin:8ch">
  <div class="modal-dialog" role="document">
    <div class="modal-content"  style="text-align:center">
      <div class="modal-header">
        <h5 class="modal-title">Welcome User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align:center">
        <p style="font-weight:bold">Please Login for the best experience on Magicplace</p>
          <br />
         <img src="image/giphy.gif" width="100" height="100" />

          <br />
        <a href="log.aspx" >Click here to Login</a>
      </div>
     
    </div>
  </div>
</div>




      
    <div id="ShowError" class="modal" tabindex="-1" role="dialog" style="margin:8ch">
  <div class="modal-dialog" role="document">
    <div class="modal-content"  style="text-align:center">
      <div class="modal-header"style="height:24px;">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align:center">
      <h3 id="err"></h3>
      </div>
     
    </div>
  </div>
</div>


    <script>

        $(document).ready(function () {

            setTimeout(launch, 5000);

        });


        function launch() {

            var sess1 = <%=Convert.ToInt32(Session["id"])%>;
            var sess2 = '<%=Convert.ToString(Session["user"])%>';
      
            if(sess2=='')
            {
                $('#myModal').modal('show');
            }
            else
            {
                $('#myModal').modal('hide');
            }



          

        }







        function check(){
            
            var ready=true;
            if(document.getElementById("txtloc").value=="")
            {
                $("#ShowError").modal("show");
                $("#err").text("Please Type Property location");
                ready=false;
                return ready;


            }

          

            if(document.getElementById("ddlptype").value=="Propert type")
            {
                $("#ShowError").modal("show");
                $("#err").text("Please select Property Type");
                ready=false;
                return ready;


            }

           
            if(document.getElementById("ddlprice").value=="Budget")
            {
                $("#ShowError").modal("show");
                $("#err").text("Please select Budget");
                ready=false;
                return ready;


            }

          
            return ready;
           
            
            
        }

       
    </script>
    
</asp:Content>




