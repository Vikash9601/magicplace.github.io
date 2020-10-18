<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Buymodule.aspx.cs" Inherits="Buymodule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <div style="margin-left:7cm;margin-right:5cm;">
    <div class="row no-gutters">
        <div class="col">

            <asp:TextBox ID="txtplace" CssClass="form-control" placeholder="Enter locality or city" runat="server"></asp:TextBox>

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
            <button class="form-control w3-hover-red" style="width:150px" runat="server" onserverclick="vikash"><i class="fa fa-search" aria-hidden="true"></i></button>

        </div>
     

    </div>
        <br />
        <br />

        <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>

    </div>
    <br />
    <br />
    
    
     <div style="margin-left:5cm;margin-right:5cm;">

        
    
        <asp:Repeater ID="apart" runat="server" OnItemDataBound="apart_ItemDataBound">
            <ItemTemplate>

                  <table  class="table table-bordered" style="border-collapse:separate;border-color:indigo;border-width:0.1cm">
               <tbody>
               <tr>
                   <td>
                     
                        <asp:Image ID="img1" ClientIDMode="Static" runat="server"  width="500" Height="300" CssClass="img-thumbnail"  ImageUrl='<%#Eval("propertyFirstImg") %>'/>
                   </td>
                   <td>
                       <table style="border-collapse:separate">
                           <tbody>
                           <tr><td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="lblbhk" runat="server" Text='<%# string.Concat(Eval("bedrooms")," BHK"," ",Eval("property_type"))%>'></asp:Label></u></td></tr>
                           <tr>
                               <td>Address-
                               </td>
                               <td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="lblproperty_type" runat="server" Text='<%#string.Concat(Eval("address"),",",Eval("city"))%>'></asp:Label></u></td>
                               <td style="margin-left:1cm;">Furnished Status-</td>
                               <td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="Label3" runat="server" Text='<%#Eval("furnished_status")%>'></asp:Label></u></td>
                           </tr>
                           <tr><td>Plot area-</td><td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="Label5" runat="server" Text='<%#string.Concat(Eval("plot_area")," ",Eval("plot_area_unit"))%>'></asp:Label></u></td>

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

            </ItemTemplate>
            <FooterTemplate>
    <%-- Label used for showing Error Message --%>
    <asp:Label ID="lblDefaultMessage" runat="server" Text="Sorry, no such Property is there to show." Visible="false">
    </asp:Label>
</FooterTemplate> 

        </asp:Repeater>




    </div>


     <div style="margin-left:5cm;margin-right:5cm;font-size:large">

        
    
        <asp:Repeater ID="resiprop" runat="server" OnItemDataBound="resiprop_ItemDataBound">
            <ItemTemplate>

                  <table  class="table table-bordered" style="border-collapse:separate;border-color:indigo;border-width:0.1cm">
               <tbody>
               <tr>
                   <td>
                     
                        <asp:Image ID="rimg1" ClientIDMode="Static" runat="server"  width="500" Height="300" CssClass="img-thumbnail"  ImageUrl='<%#Eval("RfirstPostImg") %>'/>
                   </td>
                   <td>
                       <table style="border-collapse:separate">
                           <tbody>
                           <tr><td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="rlblbhk" runat="server" Text='<%# string.Concat(Eval("Rbedrooms")," BHK"," ",Eval("Rproperty_type"))%>'></asp:Label></u></td></tr>
                           <tr>
                               <td>Address-
                               </td>
                               <td style="font-weight:bold;font-family:Times New Roman;"> <u><asp:Label ID="rlblproperty_type" runat="server" Text='<%#string.Concat(Eval("address")," , ",Eval("Rcity"))%>'></asp:Label></u></td>
                               <td style="margin-left:1cm;">Furnished Status-</td>
                               <td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="rlblfurnish" runat="server" Text='<%#Eval("Rfurnished_status")%>'></asp:Label></u></td>
                           </tr>
                           <tr><td>Plot area-</td><td style="font-weight:bold;font-family:Times New Roman;"><u><asp:Label ID="rlblplot" runat="server" Text='<%#string.Concat(Eval("Rplot_area")," ",Eval("Rplot_area_unit"))%>'></asp:Label></u></td>

                               <td>
                                   Transaction type-
                               </td>
                               <td style="font-weight:bold;font-family:Times New Roman;">
                           <u><asp:Label ID="rtransac" runat="server" Text='<%#Eval("Rtransaction_type")%>'></asp:Label></u>  
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold;font-family:Times New Roman;">
                               <u><asp:Label ID="Rlbl_id" runat="server" Text='<%#Eval("Rproperty_id")%>' Visible="false"></asp:Label></u>
                                   <asp:Button ID="rbtn" runat="server" Text="Check" ForeColor="Red" CssClass="w3-hover-red" OnClick="btn_Click"/>
                               
                               
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

            <FooterTemplate>
    <%-- Label used for showing Error Message --%>
    <asp:Label ID="lblDefaultMessage2" runat="server" Text="Sorry, no such Property is there to show." Visible="false">
    </asp:Label>
</FooterTemplate> 
        </asp:Repeater>


      

    </div>

    
    <script>

        document.getElementById("ddlprice").options[0].disabled = true;

    </script>


    </asp:Content>