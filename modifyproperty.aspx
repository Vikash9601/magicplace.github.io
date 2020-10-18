<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="modifyproperty.aspx.cs" Inherits="modifyproperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        body {
        background-color:whitesmoke;
        }
       #para {
       color:blue;
       text-align:center;
       font-family:Gabriola;
       font-size:3ch;

        }

        #modify {
        position:absolute;
        border:groove;
        border-width:5px;

        margin:auto;
        left:13cm;
   padding-left:10ch;
   padding-right:10ch;
       background-color:white;
        text-align:center;
        }
        #grid {
        background-color:white;
        }
        #btnmodalsubmit:hover {
       background-color:red;
        }
        .x:hover {
            color:black;
        }

        .c {
margin-left:12cm;
margin-right:12cm;
        }

    </style>

   <link rel="stylesheet" href="w3.css"/>
    
    <p id="para">Your posted property data</p>
   

  
  <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <div class="w3-container w3-orange">
  <h2 class="text-center">Edit the Uploaded data</h2>
</div>
  

    <div>
              <a href="modifypropertydata1.aspx"><i class="fa fa-backward" aria-hidden="true"></i> Click here to go back</a>
       

    </div>
    <br />
  <%--   <div class="c">
<asp:DropDownList ID="ddlselect" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlselect_SelectedIndexChanged">
           <asp:ListItem>---Select property Type----</asp:ListItem>
           <asp:ListItem>Apartment</asp:ListItem>
           <asp:ListItem>Residential houses</asp:ListItem>
       </asp:DropDownList>
    </div>--%>
   
  <%-- <div id="grid">
      
         <asp:Panel ID="panel1" CssClass="w3-panel" runat="server" ScrollBars="Horizontal">
       
            <%-- <asp:UpdatePanel ID="up" runat="server">
                 <ContentTemplate>
                     <asp:GridView ID="gvshow" runat="server" OnSelectedIndexChanged="gvshow_SelectedIndexChanged" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellSpacing="2"  PageSize="4" AllowPaging="True" OnRowDataBound="gvshow_RowDataBound" OnPageIndexChanging="gvshow_PageIndexChanging" OnRowCreated="gvshow_RowCreated">
       <PagerSettings Mode="NumericFirstLast" />
                         <AlternatingRowStyle BackColor="White" />
       
       <Columns>
           
         
           <asp:CommandField ButtonType="Button" ShowSelectButton="True">
           <ControlStyle CssClass="btn-primary x" />
          
           </asp:CommandField>
          

        
          

           <asp:TemplateField>
               <ItemTemplate>
                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("property_id") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
          

        
          

       </Columns>
                         
       <FooterStyle BackColor="#CCCC99" />
       <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
       <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
       <RowStyle BackColor="#F7F7DE" />
       <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
       <SortedAscendingCellStyle BackColor="#FBFBF2" />
       <SortedAscendingHeaderStyle BackColor="#848384" />
       <SortedDescendingCellStyle BackColor="#EAEAD3" />
       <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
          

            
          

             </ContentTemplate>

             </asp:UpdatePanel>
   
  <br />
              <asp:GridView ID="gvshow2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <AlternatingRowStyle BackColor="White" />

                  <Columns>
                      <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                      <asp:TemplateField>
                          <ItemTemplate>
                              <asp:Label ID="Label2" runat="server"></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                  </Columns>

                  <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                  <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                  <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                  <SortedAscendingCellStyle BackColor="#FDF5AC" />
                  <SortedAscendingHeaderStyle BackColor="#4D0000" />
                  <SortedDescendingCellStyle BackColor="#FCF6C0" />
                  <SortedDescendingHeaderStyle BackColor="#820000" />

             </asp:GridView>
         </asp:Panel>

</div>--%>


    <div id="modify">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
        <label class="w3-animate-opacity" style="color:red;font-size:medium"><u>Your selected data</u></label>
        <br />

        <br />
      <label style="color:blue">Property for </label> <asp:DropDownList ID="p_for" runat="server" CssClass="form-control" required="required">
          <asp:ListItem Text="--Select property type--" ></asp:ListItem>
         
            <asp:ListItem  Text="Sell" Value="sell" ></asp:ListItem>
             <asp:ListItem Text="Rent" Value="rent"></asp:ListItem>
             <asp:ListItem Text="PG" Value="PG"></asp:ListItem>
      </asp:DropDownList>
        <br />
        <br />
      <label style="color:blue">Property type-</label>  <asp:DropDownList ID="p_type" runat="server" CssClass="form-control" required="required">
           <asp:ListItem Text="--Select property type--" ></asp:ListItem>
         
            <asp:ListItem  Text="Apartment" Value="apartment" ></asp:ListItem>
             <asp:ListItem Text="Residential Houses" Value="houses"></asp:ListItem>
             <asp:ListItem Text="Villas" Value="villas"></asp:ListItem>
       </asp:DropDownList> 
        <br />
        <br />
     
        <asp:UpdatePanel ID="Updatecity" runat="server">
            <ContentTemplate>
                <label style="color:blue">State-</label> <asp:DropDownList ID="state" runat="server" required="required" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="state_SelectedIndexChanged"></asp:DropDownList> 
        <br />
        <br />
       <label style="color:blue">city-</label>  <asp:DropDownList ID="city" ClientIDMode="Static" runat="server" CssClass="form-control">
                                                       
                                                </asp:DropDownList> 
 
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="state" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
                <br />
        <br />
          <label style="color:blue">Locality-</label>  <asp:TextBox ID="txtlocal" runat="server" CssClass="form-control" placeholder="locality"></asp:TextBox>
        <br />
        <br />
        <label style="color:blue">Bedrooms-</label> <asp:DropDownList ID="bed" runat="server" required="required" CssClass="form-control">

            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
                 </asp:DropDownList>
        <br />
        <br />
         <label style="color:blue">Balconies-</label><asp:DropDownList ID="balcony" runat="server" required="required" CssClass="form-control">

            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
                 </asp:DropDownList>
        <br />
        <br />
        <label style="color:blue"> Bathrooms-</label><asp:DropDownList ID="bathrooms" runat="server" required="required" CssClass="form-control">

            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
                 </asp:DropDownList>
        <br />
        <br />
      <label style="color:blue">Floor no-</label><asp:DropDownList ID="floor_no" runat="server" required="required" CssClass="form-control">
            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
             <asp:ListItem Text="2" Value="2"></asp:ListItem>
             <asp:ListItem Text="3" Value="3"></asp:ListItem>
            
        </asp:DropDownList> 
        <br />
        <br />
       <label style="color:blue">Furnished status-</label> <asp:DropDownList ID="furnished_s"  runat="server" required="required" CssClass="form-control">
             <asp:ListItem Text="--Select--"></asp:ListItem>
                  
                <asp:ListItem Text="Furnished" Value="furnished"></asp:ListItem>
             <asp:ListItem Text="Unfurnished" Value="unfurnished"></asp:ListItem>
             <asp:ListItem Text="Semi-furnished" Value="semi-furnished"></asp:ListItem> 

        </asp:DropDownList> 

        <br />
        <br />
            <label style="color:blue">Cover Area-</label>
        <asp:TextBox ID="cover_area" placeholder="cover area" runat="server"  CssClass="form-control" Width="280px"></asp:TextBox>
        
     <asp:DropDownList ID="cover_area_unit" runat="server" CssClass="w3-dropdown-hover">
           <asp:ListItem Text="Sq-ft" Value="Sq-ft"></asp:ListItem>
                <asp:ListItem Text="Sq-m" Value="Sq-m"></asp:ListItem>
             <asp:ListItem Text="Acre" Value="Acre"></asp:ListItem>
        </asp:DropDownList> 
        <br />
        <br />
            <label style="color:blue">Plot Area-</label>
        <asp:TextBox ID="plot_area" placeholder="plot area" runat="server" CssClass="form-control" Width="280px"></asp:TextBox>
        
     <asp:DropDownList ID="plot_area_unit" runat="server" CssClass="w3-dropdown-hover">
           <asp:ListItem Text="Sq-ft" Value="Sq-ft"></asp:ListItem>
                <asp:ListItem Text="Sq-m" Value="Sq-m"></asp:ListItem>
             <asp:ListItem Text="Acre" Value="Acre"></asp:ListItem>
        </asp:DropDownList> 
        <br />
        <br />

            <label id="lblpname" runat="server" style="color:blue">Property name-</label>
        <asp:TextBox ID="txtpname" runat="server" CssClass="form-control"></asp:TextBox>

        <br />
        <br />

            <label style="color:blue">Expected Price-</label>
           <asp:TextBox ID="txteprice" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
       
           <label style="color:blue">Price Per Sqft-</label>
           <asp:TextBox ID="txtpp" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

        <br />
         <label style="color:blue">Address-</label>
           <asp:TextBox ID="txtadd" runat="server" CssClass="form-control"></asp:TextBox>

        <br />
          <label style="color:blue">Landmark-</label>
           <asp:TextBox ID="txtlm" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
                  <label style="color:blue">Flooring-</label>
           <asp:TextBox ID="txtfloor" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
                  <label style="color:blue">Status Of Electricity-</label>
        <asp:DropDownList ID="ddlrelectricity" CssClass="form-control" runat="server">
                  <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                 <asp:ListItem Text="No/Rare powercut" Value="No/Rare powercut"></asp:ListItem>
             <asp:ListItem Text="Powercut once or twice in a week" Value="Powercut once or twice in a week"></asp:ListItem>
           </asp:DropDownList>
        <br />


      <asp:Button ID="btnsub" runat="server" Text="Update" CssClass="btn-primary" OnClick="btnsub_Click"/>  


        

    </div>

    




       <script>
        
             
           $("#city option:first-child").attr("disabled","disabled");
          


           $(document).ready(function () {
               $("#txteprice").keyup(function () {

                   var x = $("#txteprice").val();



                   if (x != "") {
                       console.log(x);


                       $.ajax({
                           type: "POST",
                           url: 'modifyproperty.aspx/convertcurr',
                           data: JSON.stringify({ 'cur': x }),
                           contentType: "application/json; charset=utf-8",
                           dataType: 'json',
                           success: function (response) {
                               console.log(response.d);
                               $("#txteprice").val(response.d);
                           }
                                           , error: function (response) {


                                           }

                       });
                   }





               });




               $("#txtpp").keyup(function () {

                   var x = $("#txtpp").val();



                   if (x != "") {
                       console.log(x);


                       $.ajax({
                           type: "POST",
                           url: 'modifyproperty.aspx/convertpp',
                           data: JSON.stringify({ 'cur': x }),
                           contentType: "application/json; charset=utf-8",
                           dataType: 'json',
                           success: function (response) {
                               console.log(response.d);
                               $("#txtpp").val(response.d);
                           }
                                           , error: function (response) {


                                           }

                       });
                   }





               });

           });
        </script>
  

    

</asp:Content>

