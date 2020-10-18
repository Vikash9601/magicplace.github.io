<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="imageedit.aspx.cs" Inherits="imageedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .panel {
    position:absolute;
       top:2cm;
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
         padding-right: 10px;
        width: 400px;
        height: 250px;
     
    }

               .message {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.message .text{
  visibility: hidden;
  width: 400px;
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
        
      


    </style>
    
    <div>

          <div class="w3-container w3-orange">
  <h2 class="text-center">Edit the Uploaded photos</h2>
</div>  

        <br />
        <br />

    </div>
           <asp:ScriptManager ID="scrip" runat="server"></asp:ScriptManager>
  <div class="row">
 
        <div class="col-lg-2">
            <a href="modifypropertydata1.aspx"><i class="fa fa-backward" aria-hidden="true"></i> Click here to go back</a>
        </div>
           <div class="col-lg-8">
             


                         <asp:DataList ID="ddlistimages" runat="server" OnItemDataBound="ddlistimages_ItemDataBound">
        <ItemTemplate>
            <div class="w3-card">

                  
           <br />
       <table>
           <tbody>
               <tr>
                    <td>
                       &nbsp;&nbsp;&nbsp;
                   </td>
                   <td>
                        <asp:Image ID="Image2" runat="server" Width="400" Height="200" ImageUrl='<%#Eval("imgname") %>'/>
                     <asp:Label ID="imgid" runat="server" Text='<%#Eval("imgid") %>' Visible="false"></asp:Label>
                        <asp:Label ID="imgnam" runat="server" Text='<%#Eval("imgname") %>' Visible="false"></asp:Label>
            
                   </td>
                   <td>
                         <asp:FileUpload ID="file" ClientIDMode="Static" runat="server"/>
                       <br />
      <asp:Button ID="btnupd" ClientIDMode="Static" runat="server" Text="Update" CssClass="form-control w3-hover-red" OnClick="btnupd_Click" OnClientClick="return confirm('Are you sure to update this Property Image')"/>
                       <br />
                              <asp:Button ID="btndel" ClientIDMode="Static" runat="server" Text="Delete"  CssClass="form-control w3-hover-cyan" OnClick="btndel_Click" OnClientClick="return confirm('Are you sure you want to delete this Property Record?');"/>
                               
                      
                   </td>
                   <td>
                       &nbsp;&nbsp;&nbsp;
                   </td>
               </tr>
           </tbody>
       </table>
          

    </div>
            <br />
        </ItemTemplate>



    </asp:DataList>



                <asp:DataList ID="ddllistresi" runat="server">
        <ItemTemplate>
            <div class="w3-card-2">

           
       <table>
           <tbody>
               <tr>
                    <td>
                       &nbsp;&nbsp;&nbsp;
                   </td>
                   <td>
                        <asp:Image ID="Image2" runat="server" Width="400" Height="200" ImageUrl='<%#Eval("imgname") %>'/>
                     <asp:Label ID="rimgid" runat="server" Text='<%#Eval("imgid") %>' Visible="false"></asp:Label>
                        <asp:Label ID="rimgnam" runat="server" Text='<%#Eval("imgname") %>' Visible="false"></asp:Label>
            
                   </td>
                   <td>
                         <asp:FileUpload ID="fileresi" ClientIDMode="Static" runat="server"/>
                       <br />
      <asp:Button ID="btnupdr" ClientIDMode="Static" runat="server" Text="Update" CssClass="form-control w3-hover-red" OnClick="btnupdr_Click" OnClientClick="return confirm('Are you sure to update this Property Image')"/>
                       <br />
                              <asp:Button ID="btndelr" runat="server" Text="Delete"  CssClass="form-control w3-hover-cyan" OnClick="btndelr_Click" OnClientClick="return confirm('Are you sure you want to delete this Property Record?');"/>
 

                   </td>
                    <td>
                       &nbsp;&nbsp;&nbsp;
                   </td>
               </tr>
           </tbody>
       </table>
            
                 </div>
            <br />
        </ItemTemplate>



    </asp:DataList>



              

               
                 

              

           </div>    
    
           <div class="col-lg-2">
            <a href="#" id="link" runat="server"><i class="fa fa-plus" aria-hidden="true"></i> Want to add more images</a>
        </div>
     
        
   
        </div>



    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="link"
    CancelControlID="btnClose"></ajaxToolkit:ModalPopupExtender>

    



<%--      <asp:FileUpload ID="Fileload" runat="server" AllowMultiple="True" />--%>


    <asp:Panel ID="Panel1" runat="server" CssClass="panel" style ="display:none">
    <div style="height:inherit">
  
         <button type="button" id="btnClose" runat="server" class="btn w3-hover-red" style="position:absolute;left:9cm;" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               <br />
                <label id="msg" runat="server" style="position:absolute;left:2cm;"></label>
                <br />
                <br />
                <br />
          <asp:FileUpload ID="fumore" ClientIDMode="Static" runat="server" AllowMultiple="True" />
          <br />
          <br />
                <div class="message">
         <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="form-control w3-hover-red" OnClick="btnupload_Click" OnClientClick="return moreimgcheck()" />
                
                 <span class="text">
                     <ul>
                         <li>Image should be less or equal to 5MB</li>
                         <li>Image Type should be .jpg/.jpeg/.png</li>
                     </ul>

                 </span>
                    </div>
          <br />
                  <br />
                 <asp:Label ID="lblSuccess" runat="server" ForeColor ="Red" />

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnupload" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Panel>




    <script type="text/javascript">

      

        function moreimgcheck() {
            var con = true;
            if (document.getElementById("fumore").files.length == 0) {
                con = false;
                alert("Please Select the Image First");
                return con;
            }
            else {

                return confirm("Are you sure to upload this property image");
            }
        }



	</script>

</asp:Content>

