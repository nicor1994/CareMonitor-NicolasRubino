<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPrueba.aspx.cs" Inherits="GUI.Pruebas.LoginPrueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ComprobarI Integridad" />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
