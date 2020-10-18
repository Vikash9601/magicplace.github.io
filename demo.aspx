<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function func(str) {
            if (str.length == 0) {
                document.getElementById("abc").innerHTML = "";
                return


            }
            else {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {

                        document.getElementById("abc").innerHTML = this.responseText;
                    }

                };
                xhttp.open("GET", "demo.aspx?q=" + str,true);
                xhttp.send();
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
       <br />
        <asp:Label ID="data" Text="" runat="server"></asp:Label>   
    </div>
    </form>


</body>
</html>
