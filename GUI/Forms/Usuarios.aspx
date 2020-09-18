<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Usuarios" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container">
         <h1 class="font-weight-bold mb-0">Usuarios</h1>
         <br />

         <div class="row">
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">Alta de Usuario</h4>
<<<<<<< HEAD
<<<<<<< HEAD
            
=======
             <br />

>>>>>>> parent of 10115e1... Merge branch 'master' of https://github.com/nicor1994/CareMonitor-NicolasRubino
=======
                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">Nombre/s</span>
                  </div>
                   <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">Apellido/s</span>
                  </div>
                  <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                
                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping3">DNI</span>
                  </div>
                    <asp:TextBox ID="txtDni" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
>>>>>>> parent of 5018397... Revert "Merge branch 'master' of https://github.com/nicor1994/CareMonitor-NicolasRubino"

                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Direccion</span>
                  </div>                 
                <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
                   <br />
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-info" OnClick="btnAceptar_Click"/>
                 <br />
                 <br />
             </div>
           
            </div>

             <br />
             <div class="col-md-12 border shadow rounded ">
                 <br />
                 <br />
             <h4 class="font-weight-bold mb-0">Gestion de Usuario</h4>
                 <br />
                 <br />
                
                 <br />
                   <br />
            
                   <br />
                   <br />
                 <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-info" />
                 <br />
                 <br />
             </div>
          </div>
       
       </section>


</asp:Content>