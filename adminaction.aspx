<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="adminaction.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="stylesheet" href="http://localhost:1992/code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <style>
    
    </style>



      <div class="row">
        
        <div class="col-md-12">
            <asp:Panel ID="panel" runat="server" Direction="LeftToRight" ScrollBars="Both">
  <asp:GridView runat="server" ID="gvshow" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
      <FooterStyle BackColor="White" ForeColor="#000066" />
      <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
      <RowStyle ForeColor="#000066" />
      <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F1F1F1" />
      <SortedAscendingHeaderStyle BackColor="#007DBB" />
      <SortedDescendingCellStyle BackColor="#CAC9C9" />
      <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </asp:Panel>
          
         
  </div>
      


         </div>
    <br />

 
                  

    <script>
       

       

           //var x = 0;
           // $("#textsearch").keyup(function () {
           //     var value = $("#textsearch").val();
           //     var arr = [];
                //if (value != "") {
                //    $('#putit').load('getdataforadminaction.aspx #seedata', { getit: value }, function (responseTxt, statusTxt, xhr) {
                      
                         
                //        if (statusTxt == "error")
                //            alert("Error: " + xhr.status + ": " + xhr.statusText);
                   
                //    });

                //    //$.get('', { getit: value });


                //}
                //else {
                //    $('#putit').html('');

                //}





                //if (value != "") {

                //    //$.get('finduser.aspx/data', {data:value} , function (response) {

                //    //    arr = response;
                //    //    alert(arr);

                //    if (x > 0) {
                //        alert(x);

                        

                //      }


                    //var parmeter = {"name":value}

            //        $.ajax({
            //            type:"POST",
            //            url: 'adminaction.aspx/dataname',
            //            data: JSON.stringify({ 'nam': value }),
            //            contentType: "application/json; charset=utf-8",
            //            dataType: 'json',
            //            success:OnSuccess 
            //                , error: function (response) {

            //                alert(response.d+"asdbhas");
            //            }
            //        });


                 
            //    }
            


            //});



           

              

               


       
     
    </script>




     
   

</asp:Content>

