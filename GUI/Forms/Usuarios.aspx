<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Usuarios" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">Usuarios</h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0"><asp:Label ID="lblAltaUsuario" runat="server" Text="Alta de Usuario"></asp:Label></h4>

             <br />

                 <br />
                 <br />
                 <div class ="row">
                 <div class="col-6">
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label></span>
                  </div>
                   <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtNombre" CssClass="alert-danger"></asp:RequiredFieldValidator>
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label></span>
                  </div>
                  <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtApellido" CssClass="alert-danger"></asp:RequiredFieldValidator>
                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblDNI" runat="server" Text="DNI"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtDni" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtDni" CssClass="alert-danger"></asp:RequiredFieldValidator>
               </div>
                 <div class="col-6">
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">
                        <asp:Label ID="lblDireccion" runat="server" Text="Direccion"></asp:Label></span>
                  </div>                 
                <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtDireccion" CssClass="alert-danger"></asp:RequiredFieldValidator>
                   <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4"><asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento"></asp:Label></span>
                  </div>                 
                <asp:TextBox textmode="Date" ID="txtFechaNac" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtFechaNac" CssClass="alert-danger"></asp:RequiredFieldValidator>
                   <br />
                     </div>
                     </div>
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-info shadow mb-5 rounded" OnClick="btnAceptar_Click"/>
                 <asp:Button ID="btnMod" runat="server" Text="Modificar" CssClass="btn btn-info shadow mb-5 rounded"  Visible="false" OnClick="btnMod_Click"/>
                 <asp:Label ID="lblsuccess2" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
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

                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning shadow mb-5 rounded" style="margin-left:10px" OnClick="btnModificar_Click"/>
                      <asp:Button ID="btnBaja" runat="server" Text="Dar de Baja" CssClass="btn btn-danger shadow mb-5 rounded" style="margin-left:10px" OnClick="btnBaja_Click"/>
                      <asp:Button ID="btnrestore" runat="server" Text="Restaurar Contraseña" CssClass="btn btn-info shadow mb-5 rounded" style="margin-left:10px" OnClick="btnrestore_Click"/>
                      <asp:Label ID="lblmod" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
            </div>
                 <br />
                   <br />
         
                 <br />
          </div>
        </div>
       <br />
       </section>


</asp:Content>