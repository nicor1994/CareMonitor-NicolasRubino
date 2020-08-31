<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" Inherits="GUI.Pruebas.Permisos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 563px">
    <form id="form1" runat="server">
        <div style="height: 389px">
            <asp:ListBox ID="ListBox1" runat="server" Height="375px" Width="148px"></asp:ListBox>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
            <asp:ListBox ID="ListBox2" runat="server" Height="177px" Width="207px"></asp:ListBox>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Crear Rol" />
            <asp:ListBox ID="ListBox3" runat="server" Height="241px" Width="232px"></asp:ListBox>
        </div>
    </form>
</body>
</html>
