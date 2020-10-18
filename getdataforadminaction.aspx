<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getdataforadminaction.aspx.cs" Inherits="getdataforadminaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <link  rel="stylesheet" href="w3.css"/>
     <link rel="stylesheet" href="bootstrap.min.css" />
    <form id="form1" runat="server">
    <div>
    
    </div>
          <div id="seedata">
              <asp:Repeater ID="putdata" runat="server">
                  <ItemTemplate>
                      <div class="w3-card-2">
                          <table>
                              <tbody>
                                  <tr>
                                      <td>
                                          <div class="input-group mb-3">
                                              <div class="input-group-prepend">
                                                  <span class="input-group-text"><i class="fa fa-search" aria-hidden="true"></i></span>
                                                  
                                              </div>
                                              &nbsp;&nbsp;
                                              <asp:Label ID="lbl" runat="server" Text='<%#Eval("username") %>'>"></asp:Label>
 
                                          </div>
                                         
                                      </td>
                                  </tr>
                              </tbody>
                          </table>

                      </div>


                  </ItemTemplate>


              </asp:Repeater>
    </div>
    </form>

  


</body>
</html>
