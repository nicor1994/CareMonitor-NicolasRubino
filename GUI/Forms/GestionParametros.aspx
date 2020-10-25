<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionParametros.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.GestionParametros" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">Gestion de Parametros</h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">Alta de Parametros</h4>
                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">Nombre</span>
                  </div>
                   <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">Descripcion</span>
                  </div>
                  <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                
                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Descripcion de valores máximos</span>
                  </div>
                    <asp:TextBox ID="txtDescMax" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                   <br />
         <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Valor máximo Masculino</span>
                  </div>
                    <asp:TextBox ID="txtValMaxMasc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                         <br />
                   <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Valor máximo Femenino</span>
                  </div>
                    <asp:TextBox ID="txtValFemMax" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Descripcion de valores mínimos</span>
                  </div>
                    <asp:TextBox ID="txtDescMin" CssClass="form-control" runat="server"></asp:TextBox>
                </div>                      
                   <br />                             
         <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Valor mínimo Masculino</span>
                  </div>
                    <asp:TextBox ID="txtValMinMasc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <br />
                  <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Valor mínimo Femenino</span>
                  </div>
                    <asp:TextBox ID="txtValMinFem" CssClass="form-control" runat="server"></asp:TextBox>
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
             <h4 class="font-weight-bold mb-0">Gestion de Parametros</h4>
                 <br />
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Servicio</span>
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