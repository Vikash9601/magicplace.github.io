<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminPanel.aspx.cs" Inherits="adminPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="bootstrap.min.css" />
    <link  rel="stylesheet" href="w3.css"/>
    <script src="jquery-3.4.1.js"></script>
     <script src="https://kit.fontawesome.com/6d17d89b76.js"></script>
    <style>
       


        .tabmenu {
             margin:0px;
        padding:0px;

        float:left;
        border:1px solid black;
        width:21%;
        height:100vh;
        background-color:black;
        
        }
            .tabmenu button {
            width:100%;
          
            color:white;
            padding:10px;
            border:none;
            transition:0.5s;
           
            
            
            
            }
                .tabmenu button:hover {
                background-color:white;
                
                }
        .name {
            font-size:x-large;
            font-weight:bold;
            color:aqua;
        position:absolute;
         bottom:5px;
         left:120px;
        
        }

        .content {
               margin-left:13cm;
        
        
        }
    

        tr, td {
       padding: 15px;
            
             }

       #a1:hover {
        color:black;
        
        }
        
        .accordion {
  background-color:darkblue;
 margin-left:5ch;
  color:white;
  cursor: pointer;
  padding: 18px;
  width: 70%;

  text-align: left;
  border: none;
  outline: none;
  transition: 0.4s;
}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */

.active, .accordion:hover {
  background-color:lightblue;
  color:black;
}

/* Style the accordion panel. Note: hidden by default */

.panel {
  padding: 0 18px;
   position:relative;
   left:1cm;    
  background-color: white;
  display: none;
 
  overflow: hidden;
  
}

    </style>
</head>
<body>
 
       <div class="row">
        <div class="col-md-3">
            <img src="image/avatar2.png" class="w3-circle" style="width:300px;height:200px;padding-left:12px;" alt="admins"/>
           <asp:Label ID="lblname" runat="server" CssClass="name"><u>vikash</u></asp:Label>
        </div>
            <div class="col-md-9">
    <p style="background-color:orange;width:100%;height:50px;text-align:center;font-family:'Times New Roman';font-size:30px;padding-top:6px;color:white;">Welcome To Admin Panel</p>
    <br />
                <br />
                <br />
                <table>
                    <tbody>
                        <tr>
                            <th> <label>Total User visited today-</label></th>
                            <th><label id="uservisited" runat="server" style="font-weight:bold"></label></th>
                        </tr>
                    </tbody>
                </table>
             
            </div>

       </div> 
       



        <div class="tabmenu">
            <button class="btn x" id="dash">Dashboard</button>
            <br />
            <button class="btn x" id="memory">Memory used</button>
            <br />
            <button class="btn x">Customer feedback</button>
           
        </div>
   

        <%--  --%>



    <%--    <div id="user_present" class="content" style="display:none;border:2px groove black;border-radius:50px;width:3cm;height:3cm;padding-left:5ch;">

         <asp:Label ID="present" CssClass="w3-circle" runat="server">5</asp:Label>
            <label style="font-family:Gabriola;font-size:6ch;color:black;">5</label>

        </div>--%>
    <div id="content1">

    <form id="Form1" runat="server">
    <div class="row no-gutters" style="margin-left:9cm;">
        <div class="col-md-2" id="a1">
        <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                     User Online
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
               <td>
                       <h3> <i class="fa fa-users" aria-hidden="true"></i></h3>
                      </td>
                      <td>
                      <label id="uservisit" style="font-size:larger" runat="server">0</label>
                          </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
          </table> 

        </div>
        <div class="col-md-3" id="a2">
         <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                  Builder registered today
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
                    <td>
                       <h3> <i class="fa fa-user-plus" aria-hidden="true" runat="server"></i></h3> 
                      </td>
                      <td>
                      <label id="lblbuilder" style="font-size:larger" runat="server">0</label>
                      </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
          </table>    


        </div>
          <div class="col-md-3" id="a3">
               <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                Agent registered today
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
                    <td>
                        <h3> <i class="fa fa-user-plus" aria-hidden="true"></i></h3> 
                      </td>
                      <td>
                      <label id="lblagent" style="font-size:larger" runat="server">0</label>
                          </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
   
   </table>


          </div>
        <div class="col-md-4" id="a4">
      <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                   Seller/Buyer Registered today
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
                   <td>
                     <h3> <i class="fa fa-user-plus" aria-hidden="true"></i></h3> 
                      </td>
                      <td>
                    <label id="lblsb" style="font-size:larger" runat="server">0</label>
                          </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
          </table> 


            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>


        </div>
 </div>

     <br />
    <br />

      <%--    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>


         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:Button id="t" CssClass="accordion" runat="server" Text="Posted by Builder" onClientClick="return false"></asp:Button>
       <div class="panel">
           <br />
           <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>    
 <asp:GridView ID="gvbuilder" runat="server" AllowPaging="True" OnPageIndexChanging="gvbuilder_PageIndexChanging" PageSize="4">
     <PagerSettings Mode="NumericFirstLast" />
           </asp:GridView>
 </ContentTemplate>
          
            </asp:UpdatePanel>
          
     <br />
           <br />
        </div>
            


 

<asp:Button id="Button2" CssClass="accordion" runat="server" Text="Posted by Agent" onClientClick="return false"></asp:Button>
    <div class="panel">
<br />
      
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
          <asp:GridView ID="gvagent" runat="server" PageSize="4" AllowPaging="True" OnPageIndexChanging="gvagent_PageIndexChanging">
              <PagerSettings Mode="NumericFirstLast" />
        </asp:GridView>
                    </ContentTemplate>
          
            </asp:UpdatePanel>
             <br />
           <br />
            
    </div>

            <div class="panel">
                <br />
             <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
              
    <asp:GridView ID="gvuser" runat="server" PageSize="4" AllowPaging="True" OnPageIndexChanging="gvuser_PageIndexChanging">
        <EditRowStyle BorderStyle="Groove" />
        <PagerSettings Mode="NumericFirstLast" />
                </asp:GridView>
                 </ContentTemplate>
          
            </asp:UpdatePanel>

                     <br />
           <br />
                    
            </div>

 <asp:Button id="Button1" CssClass="accordion" runat="server" Text="Posted by User" onClientClick="return false"></asp:Button>
        </form>
</div>

    <div id="content2" style="display:none">
      
        <asp:Label ID="lbl1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbl2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbl3" runat="server" Text="Label"></asp:Label>




    </div>

    <script>
        $(document).ready(function () {

          
        
        $("#dash").click(function () {
            $("#content1").css("display","block");
            $("#content2").css("display", "none");
        });
        $("#memory").click(function () {
            $("#content1").css("display", "none");
            $("#content2").css("display", "block");
          
        });


        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                /* Toggle between adding and removing the "active" class,
                to highlight the button that controls the panel */
                this.classList.toggle("active");

                /* Toggle between hiding and showing the active panel */
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }

        });


       

    </script>
</body>
</html>
