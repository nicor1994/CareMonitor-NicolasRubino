<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrimerInicio.aspx.cs" Inherits="GUI.Forms.PrimerInicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <title>CareMonitor - Login</title>
    <link rel="stylesheet" type="text/css" href="../Content/global.css"/>
</head>
<body>
    <section class="container-fluid bg" >
        <section class="row justify-content-center">
            <section class="col-12 col-sm-6 col-md-3">
                <form class="form-container" runat="server">                  
                    <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Larger"></asp:Label>
                    <br />
                    
                    <div class="form-group">
                        <label for="dni">Ingrese su contraseña</label>
                       
                        <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass">Reingrese la contraseña</label>
                    
                         <asp:TextBox runat="server" ID="TextBox2"  CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="form-group form-check">
                        <asp:Label class="alert alert-danger" ID="Label1" runat="server" Text="Las contraseñas ingresadas no coinciden" Visible="False"></asp:Label>
                    </div>
                    <div class="alert alert-danger" role="alert" hidden="hidden">
                         Las contraseñas ingresadas no coinciden!
                    </div>
                <asp:Button ID="btnCambiarContraseña" Text="Login" runat="server" OnClick="btnCambiarContraseña_Click" Class="btn btn-primary btn-block" />
                </form>
            </section>
        </section>
    </section>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
</body>
</html>
