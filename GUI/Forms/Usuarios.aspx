<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Usuarios" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">Usuarios</h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">Alta de Usuario</h4>

             <br />

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
                    <span class="input-group-text" id="addon-wrappinga">DNI</span>
                  </div>
                    <asp:TextBox ID="txtDni" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Direccion</span>
                  </div>                 
                <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
                   <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Fecha de Nacimiento</span>
                  </div>                 
                <asp:TextBox textmode="Date" ID="txtFechaNac" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
                   <br />
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-info" OnClick="btnAceptar_Click"/>
                 <br />
                 <br />
             </div>
           
           

             <br />
             <div class="col-md-12 border shadow rounded">
                 <br />
                 <br />
             <h4 class="font-weight-bold mb-0">Gestion de Usuario</h4>
                 <br />
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Usuario</span>
                  </div>                 
                     <asp:ListBox ID="listUsuarios" runat="server" ></asp:ListBox>

                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnModificar_Click"/>
                      <asp:Button ID="btnBaja" runat="server" Text="Dar de Baja" CssClass="btn btn-danger" style="margin-left:10px" OnClick="btnBaja_Click"/>
                      <asp:Button ID="btnrestore" runat="server" Text="Restaurar Contraseña" CssClass="btn btn-info" style="margin-left:10px" OnClick="btnrestore_Click"/>
                      <asp:Label ID="lblmod" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
            </div>
                 <br />
                   <br />
            <div class="col-md-12 border shadow rounded ">
                 <br />
             <h4 class="font-weight-bold mb-0">Modificar Usuario</h4>

             <br />

                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">Nombre/s</span>
                  </div>
                   <asp:TextBox ID="txtnombremod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                </div>
                
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">Apellido/s</span>
                  </div>
                  <asp:TextBox ID="txtapemod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                </div>
                
                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping3">DNI</span>
                  </div>
                    <asp:TextBox ID="txtdnimod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                </div>

                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Direccion</span>
                  </div>                 
                <asp:TextBox ID="txtdireccionmod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
            </div>
                   <br />
                     <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Fecha de Nacimiento</span>
                  </div>                 
                <asp:TextBox textmode="Date" ID="txtfechamod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
            </div>
                   <br />
                   <br />
                 <asp:Button ID="btnMod" runat="server" Text="Modificar" CssClass="btn btn-info"  Visible="false" OnClick="btnMod_Click"/>
                  <asp:Label ID="lblsuccess2" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
                 <br />
                 <br />
             </div>
                 <br />
          </div>
        </div>
       <br />
       </section>


</asp:Content>