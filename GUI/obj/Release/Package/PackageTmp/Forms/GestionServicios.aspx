<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionServicios.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.GestionServicios" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblGestionServicios" runat="server" Text="Gestion de Servicios"></asp:Label></h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblAltaServicio" runat="server" Text="Alta de Servicio"></asp:Label></h4>

             <br />

                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label></span>
                  </div>
                   <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtNombre" CssClass="alert-danger"></asp:RequiredFieldValidator>
                </div>
                
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion"></asp:Label></span>
                  </div>
                  <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtDesc" CssClass="alert-danger"></asp:RequiredFieldValidator>
                </div>
                
                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblTiempoMedio" runat="server" Text="Tiempo Medio"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtTiempo" CssClass="form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtTiempo" CssClass="alert-danger"></asp:RequiredFieldValidator>
               
                </div>

                   <br />
        
                      
                   <br />
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Servicio agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnGuardar" runat="server" Text="Aceptar" CssClass="btn btn-info shadow mb-5 rounded" OnClick="btnGuardar_Click"/>
                 <asp:Button ID="btnMod" runat="server" Text="Modificar" CssClass="btn btn-info shadow mb-5 rounded"  Visible="false" OnClick="btnMod_Click"/>
                 <br />
                 <br />
                  <div class="col-md-12 border shadow rounded">
                 <br />
                 <br />
            
                 <br />
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">
                        <asp:Label ID="lblServicios" runat="server" Text="Servicio"></asp:Label></span>
                  </div>                 
                     <asp:ListBox ID="listServicio" runat="server" ></asp:ListBox>

                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning shadow mb-5 rounded" style="margin-left:10px" OnClick="btnModificar_Click"/>
                      <asp:Button ID="btnBaja" runat="server" Text="Dar de Baja" CssClass="btn btn-danger shadow mb-5 rounded" style="margin-left:10px" OnClick="btnBaja_Click"/>
                     
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