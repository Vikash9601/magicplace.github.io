<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchresult.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <link rel="stylesheet" href="w3.css"/>
    
          <style>
          body {
         background-color:transparent;
          
          }


          .row {
      
             
                
          }

        #a1 {
     
       
   


        }
        #a2 {
          

         background-color:floralwhite;
        }
            #a3 {
          

         background-color:floralwhite;
        }
          
table {

  border-spacing: 10px 0;
 
}

    </style>
     <%-- <link href="jsImgSlider/themes/1/js-image-slider.css" rel="stylesheet" /> 
    <script src="jsImgSlider/themes/1/js-image-slider.js"></script>

    <link href="jsImgSlider/generic.css" rel="stylesheet" />
     <div id="sliderFrame">
        <div id="slider">
           
            <asp:Repeater ID="rptpic" runat="server">

                <ItemTemplate>
                    <asp:Image runat="server" ID="img1" ImageUrl='<%#Eval("imgname") %>' Height="250" Width="250" />

                </ItemTemplate>
            </asp:Repeater>--%>
            <%-- <asp:DataList ID="DataList1" runat="server">
            
            <ItemTemplate>
                <div class="row productList">  
                    
                        <div class="col-8"> 
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("property_type") %>'></asp:Label>
                  <br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("locality")%>'></asp:Label>
                            ,
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("city")%>'></asp:Label>

                <br />
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("expected_price") %>'></asp:Label>
                            </div>
            </ItemTemplate>
        </asp:DataList>--%>
            
          <%--  <img src="images/image-slider-2.jpg" />
            <img src="images/image-slider-3.jpg" alt="" />
            <img src="images/image-slider-4.jpg" alt="#htmlcaption" />
            <img src="images/image-slider-5.jpg" />--%>
      <%--  </div>--%>

   
     <div class="container">
                <div class="row">
                    <div style="width:100%;height:3cm;">
                       
                         <asp:Label ID="resmsg" runat="server" ForeColor="#3366FF" ClientIDMode="Static"></asp:Label>
                    <br />
                        
                           <asp:Label ID="resmsg1" runat="server" ForeColor="Blue"></asp:Label><i class="fa fa-arrow-down fa-3x" id="icon" aria-hidden="true"></i>
                    </div>
                   
    <asp:Repeater ID="data" runat="server">
        <ItemTemplate>
        <div class="w3-card">
           <table  class="table table-bordered" style="border-collapse:separate;">
               <tbody>
               <tr>
                   <td>
                     
                        <asp:Image ID="img1" ClientIDMode="Static" runat="server"  width="500" Height="300" ImageUrl='<%#Eval("propertyFirstImg") %>'/>
                   </td>
                   <td>
                       <table style="border-collapse:separate">
                           <tbody>
                           <tr><td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="lblbhk" runat="server" Text='<%# string.Concat(Eval("bedrooms")," BHK"," ",Eval("property_type"))%>'></asp:Label></u></td></tr>
                           <tr>
                               <td>Address-
                               </td>
                               <td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="lblproperty_type" runat="server" Text='<%#string.Concat(Eval("locality"),",",Eval("city"))%>'></asp:Label></u></td>
                               <td style="margin-left:1cm;">Furnished Status-</td>
                               <td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="Label3" runat="server" Text='<%#Eval("furnished_status")%>'></asp:Label></u></td>
                           </tr>
                           <tr><td>Plot area-</td><td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="Label5" runat="server" Text='<%#string.Concat(Eval("plot_area")," ",Eval("cover_area_unit"))%>'></asp:Label></u></td>

                               <td>
                                   Transaction type-
                               </td>
                               <td style="font-weight:bold;font-family:Times New Roman;">
                           <u><asp:Label ID="Label4" runat="server" Text='<%#Eval("transaction_type")%>'></asp:Label></u>  
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold;font-family:Times New Roman;">
                               <u><asp:Label ID="lbl_id" runat="server" Text='<%#Eval("property_id")%>' Visible="false"></asp:Label></u>
                                   <asp:Button ID="btn" runat="server" Text="Check" ForeColor="Red" CssClass="w3-hover-red" OnClick="btn_Click"/>
                               
                               
                               </td>
                             
                              
                           </tr>
                          
                          </tbody> 
                       </table>
                   </td>
               </tr>
</tbody>
           </table>
            <asp:Label ID="lblbtn" runat="server"></asp:Label>
           </div>
            <br />
          
            </ItemTemplate>
       </asp:Repeater>
                        <br />
            <br />
                     </div>

         <div class="row">

              <asp:Repeater ID="residentialdata" runat="server">
        <ItemTemplate>
        
           <table  class="table table-bordered" style="border-collapse:separate;border-color:indigo;border-width:0.3cm;">
               <tbody>
               <tr>
                   <td>
                     
                        <asp:Image ID="imgres" ClientIDMode="Static" runat="server"  width="500" Height="250" CssClass="img-thumbnail"  ImageUrl='<%#Eval("RfirstPostImg") %>'/>
                   </td>
                   <td>
                       <table style="border-collapse:separate">
                           <tbody>
                           <tr><td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="lblRbhk" runat="server" Text='<%# string.Concat(Eval("Rbedrooms")," BHK"," ",Eval("Rproperty_type"))%>'></asp:Label></u></td></tr>
                           <tr>
                               <td>Address-
                               </td>
                               <td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="addlbl" runat="server" Text='<%#Eval("address")%>'></asp:Label></u></td>
                               <td style="margin-left:1cm;">Furnished Status-</td>
                               <td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="RLabel3" runat="server" Text='<%#Eval("Rfurnished_status")%>'></asp:Label></u></td>
                           </tr>
                           <tr><td>Plot area-</td><td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="RLabel5" runat="server" Text='<%#string.Concat(Eval("Rplot_area")," ",Eval("Rcover_area_unit"))%>'></asp:Label></u></td>

                               <td>
                                   Transaction type-
                               </td>
                               <td style="font-weight:bold;font-family:Times New Roman;">
                           <u><asp:Label ID="RLabel4" runat="server" Text='<%#Eval("Rtransaction_type")%>'></asp:Label></u>  
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold;font-family:Times New Roman;">
                               <u><asp:Label ID="Rlbl_id" runat="server" Text='<%#Eval("Rproperty_id")%>' Visible="false"></asp:Label></u>
                                   <asp:Button ID="Rbtn" runat="server" Text="Check" ForeColor="Red" CssClass="w3-hover-red" OnClick="btn_Click"/>
                               
                               
                               </td>
                             
                              
                           </tr>
                          
                          </tbody> 
                       </table>
                   </td>
               </tr>
</tbody>
           </table>
            <asp:Label ID="lblbtn" runat="server"></asp:Label>
           
            </ItemTemplate>
       </asp:Repeater>

         </div>
           
         </div>

 

         <div class="container">
                <div class="row">
             <div class="col-sm-4" id="Div1">
              <asp:Image ID="Image1" runat="server" />
              
             </div>
             <div class="col-sm-8" id="a3">
                 <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
                 <asp:Label ID="Label2" runat="server"></asp:Label>
             </div>



                </div>


         </div>

      
        <div id="htmlcaption" style="display: none;">
            <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
        </div>
    

    <script>
        if ($("#resmsg").text() == "No result found") {

            $("#icon").hide();
        }


    </script>

</asp:Content>

