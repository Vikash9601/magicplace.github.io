<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="adminfeedbackpage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <div class="row">
        <div class="col-md-6" id="vik" style="border:12px groove">
            <table style="margin-left:4cm;">
                <tbody>
                    <tr>
                        <td> <h3>Customer Feedback</h3></td>
                        <td><button id="expand" style="border-radius:20px" onclick="return false">

                <i id="left" class="fa fa-arrow-right" aria-hidden="true"></i>
            </button></td>
                               </tr>
                </tbody>
            </table>

            <p> See property details of commented property </p>
           
      
        <asp:Repeater ID="custfeed" runat="server">

            <ItemTemplate>

            

                
               <table id="tblcust">
<tbody>
    <tr>
        <td> 
            <table>
                <tbody>
                    <tr>
                        <td> <asp:Label ID="lblnam" runat="server" Text='<%# Eval("username") %>' Font-Bold="True"></asp:Label> <asp:Label ID="lblid" runat="server" Text='<%# Eval("userid") %>' Visible="false"></asp:Label><asp:Label ID="lblpro" runat="server" Text='<%# Eval("property_id") %>' Visible="false"></asp:Label></td>
                        <td><asp:LinkButton ID="linkinformation" runat="server" Text="Property details" CssClass="w3-text-blue" OnClick="linkinformation_Click"></asp:LinkButton></td>
                    </tr>
                </tbody>
            </table>
           


        </td>
        
    </tr>
    <tr>
        <td class="w3-card-2"><asp:Label ID="lblfeed" runat="server" Text='<%#Eval("userfeedback") %>'></asp:Label></td>
   <br />
         </tr>
</tbody>
               </table>
                 
            </ItemTemplate>

        </asp:Repeater>    


 


        </div>



        <div class="col-md-6" id="vika" style="border:12px groove"> 
             <table style="margin-left:4cm;">
                <tbody>
                    <tr>
                        <td><button id="expandleft" style="border-radius:20px" onclick="return false">
                <i id="right" class="fa fa-arrow-left" aria-hidden="true"></i>
            </button></td>
                        <td> <h3>Seller feedback</h3> </td>
                        
                    </tr>

                </tbody>
            </table>
            <p> See property details of commented property </p>

            <asp:Repeater ID="sellerrep" runat="server">
                <ItemTemplate>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:Label ID="sellername" runat="server" Text='<%#Eval("username") %>' Font-Bold="True"></asp:Label>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("userid") %>' Visible="false"></asp:Label><asp:Label ID="lblpro" runat="server" Text='<%# Eval("property_id") %>' Visible="false"></asp:Label>
                                </td>
                                <td><asp:LinkButton ID="linkRinformation" runat="server" Text="Property details" CssClass="w3-text-blue" OnClick="linkRinformation_Click"></asp:LinkButton></td>
                            </tr>
                            <br />
                            <tr>
                                <td class="w3-card-2">
                                      <asp:Label ID="sellerfeed" runat="server" Text='<%#Eval("sellerFeed") %>'></asp:Label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ItemTemplate>
            </asp:Repeater>


       
           


        </div>
    </div>
        </div>


     <div class="modal fade" id="exampleModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Brief property information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
              <table>
              <tbody>
                 <tr>
                     <td>Seller name-</td><td class="card" style="font-weight:bold"><asp:Label ID="sellername" runat="server"></asp:Label></td>
                  </tr>
                  <tr>
                     
                                          <td>  Property For-</td><td class="card" style="font-weight:bold"><asp:Label ID="profor" runat="server"></asp:Label></td>
                       </tr>
                  <tr>


                    <td> Property Type- </td><td class="card" style="font-weight:bold"> <asp:Label ID="protype" runat="server"></asp:Label></td>
  </tr>
                  <tr>
                     <td>Locality-</td><td class="card" style="font-weight:bold"><asp:Label ID="locality" runat="server"></asp:Label></td>
                       </tr>
                  <tr>
                      <td>Expected price-</td><td class="card" style="font-weight:bold" ><asp:Label ID="price" runat="server"></asp:Label></td>
                 </tr>
              </tbody>
          </table>
        
    </div>
        </div>
  </div>
</div>

 


    <script>
        document.getElementById("expand").addEventListener('click',function(){
            if (document.getElementById("vik").classList == "col-md-6") {
                document.getElementById("vika").classList.remove("col-md-6");
                document.getElementById("vika").classList.add("col-md-0");
                document.getElementById("vika").style.display = "none";
                document.getElementById("vik").classList.remove("col-md-6");
                document.getElementById("vik").classList.add("col-md-12");
                document.getElementById("left").classList.remove("fa-arrow-right");
                document.getElementById("left").classList.add("fa-arrow-left");
            }
            else {
                document.getElementById("vika").classList.remove("col-md-0");
                document.getElementById("vika").classList.add("col-md-6");
                document.getElementById("vik").classList.remove("col-md-12");
                document.getElementById("vik").classList.add("col-md-6");
                
                document.getElementById("vika").style.display = "block";
                document.getElementById("left").classList.remove("fa-arrow-left");
                document.getElementById("left").classList.add("fa-arrow-right");
            }

        });

        document.getElementById("expandleft").addEventListener('click', function () {
            if (document.getElementById("vika").classList == "col-md-6") {
              
                document.getElementById("vik").classList.remove("col-md-6");
                document.getElementById("vik").classList.add("col-md-0");
                document.getElementById("vika").classList.remove("col-md-6");
                document.getElementById("vika").classList.add("col-md-12");
                document.getElementById("vik").style.display = "none";

                document.getElementById("right").classList.remove("fa-arrow-left");
                document.getElementById("right").classList.add("fa-arrow-right");
            }
            else {
             
                document.getElementById("vik").classList.remove("col-md-0");
                document.getElementById("vik").classList.add("col-md-6");
                document.getElementById("vika").classList.remove("col-md-12");
                document.getElementById("vika").classList.add("col-md-6");

                document.getElementById("vik").style.display = "block";

                document.getElementById("right").classList.remove("fa-arrow-right");
                document.getElementById("right").classList.add("fa-arrow-left");
            }

        });

        


    </script>

    <script src="jquery-3.4.1.js"></script>
</asp:Content>

