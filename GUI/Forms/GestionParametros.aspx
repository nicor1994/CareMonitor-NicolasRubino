<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionParametros.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.GestionParametros" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblGestionParametro" runat="server" Text="Gestion de Parametros"></asp:Label></h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblAltaParametros" runat="server" Text="Alta de Parametros"></asp:Label></h4>
                 <br />
                 <br />
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
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion"></asp:Label></span>
                  </div>
                  <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtDesc" CssClass="alert-danger"></asp:RequiredFieldValidator>
                   <br />
                 <div class="row">
                     <div class="col-md-6 col-sm-12">
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblDescripcionMax" runat="server" Text="Descripcion de valores máximos"></asp:Label></span>
                  </div>
                    <asp:TextBox ID="txtDescMax" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtDescMax" CssClass="alert-danger"></asp:RequiredFieldValidator>
                   <br />
         <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblValMaxMasc" runat="server" Text="Valor máximo Masculino"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtValMaxMasc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtValMaxMasc" CssClass="alert-danger"></asp:RequiredFieldValidator>
                 
                         <br />
                   <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblValMaxFem" runat="server" Text="Valor máximo Femenino"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtValFemMax" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtValFemMax" CssClass="alert-danger"></asp:RequiredFieldValidator>
                 
                 <br />
                         </div>
                     <div class="col-md-6 col-sm-12">
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblDescMin" runat="server" Text="Descripcion de valores mínimos"></asp:Label></span>
                  </div>
                    <asp:TextBox ID="txtDescMin" CssClass="form-control" runat="server"></asp:TextBox>
                </div> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtDescMin" CssClass="alert-danger"></asp:RequiredFieldValidator>
                   <br />                             
         <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblValMinMasc" runat="server" Text="Valor mínimo Masculino"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtValMinMasc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtValMinMasc" CssClass="alert-danger"></asp:RequiredFieldValidator>
                 
                 <br />
                  <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblValMinFem" runat="server" Text="Valor mínimo Femenino"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtValMinFem" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtValMinFem" CssClass="alert-danger"></asp:RequiredFieldValidator>
                </div>
                     </div>
                 <br />
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Parametro agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnGuardar" runat="server" Text="Aceptar" CssClass="btn btn-info" OnClick="btnGuardar_Click" />
                 <asp:Button ID="btnGuardarModificacion" runat="server" Text="Guardar Modificacion" CssClass="btn btn-info" OnClick="btnGuardarModificacion_Click" Visible ="false" />
                 <br />
                 <br />
                  <div class="col-md-12 border shadow rounded">
                 <br />
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblGestionParametros" runat="server" Text="Gestion de Parametros"></asp:Label></h4>
                 <br />
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">
                        <asp:Label ID="lblParametro" runat="server" Text="Parametros"></asp:Label></span>
                  </div>                 
                     <asp:ListBox ID="listParametro" runat="server" ></asp:ListBox>

                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnModificar_Click"/>
                      <asp:Button ID="btnBaja" runat="server" Text="Dar de Baja" CssClass="btn btn-danger" style="margin-left:10px" OnClick="btnBaja_Click"/>
                     
                      <asp:Label ID="lblmod" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
            </div>
                 <br />
                   <br />
            
                 <br />
          </div>
        </div>
       <br />
             
         </div>
        </section>
    </asp:Content>