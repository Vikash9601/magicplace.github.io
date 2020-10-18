<%@ Page Language="C#" AutoEventWireup="true" CodeFile="image.aspx.cs" Inherits="image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:simplestring %>" SelectCommand="SELECT * FROM [img]"></asp:SqlDataSource>
        <asp:FileUpload ID="fuload" runat="server" />
        <asp:Image ID="imgl" Height="500px" Width="500px" runat="server" />
        <br />
        <asp:Button ID="btn" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
    
    </div>
    </form>
</body>
</html>
