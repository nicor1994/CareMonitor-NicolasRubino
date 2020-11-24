<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionHabitos.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.GestionHabitos" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblGestionHabitos" runat="server" Text="Gestion de Hábitos"></asp:Label></h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblAltaHabito" runat="server" Text="Alta de Hábitos"></asp:Label></h4>
                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblNombreParametro" runat="server" Text="Nombre"></asp:Label></span>
                  </div>         
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtNombre" CssClass="alert-danger"></asp:RequiredFieldValidator>
                 <br />
                 <div class="row">
                     <div class="col-6">
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">
                        <asp:Label ID="lblEfectoPositivo" runat="server" Text="Efecto Positivo"></asp:Label></span>
                  </div>
                  <asp:TextBox ID="txtEfePos" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtEfePos" CssClass="alert-danger"></asp:RequiredFieldValidator>
                <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblVecesPositivo" runat="server" Text="Veces por semana Positivo"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtVecesPos" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtVecesPos" CssClass="alert-danger"></asp:RequiredFieldValidator> 
                  </div>
                 <div class="col-6">
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblEfectoNegativo" runat="server" Text="Efecto Negativo"></asp:Label></span>
                  </div>
                    <asp:TextBox ID="txtEfeNeg" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtEfeNeg" CssClass="alert-danger"></asp:RequiredFieldValidator>
                   <br />
        <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">
                        <asp:Label ID="lblVecesNegativo" runat="server" Text="Veces por semana Negativo"></asp:Label></span>
                  </div>
                    <asp:TextBox TextMode="Number" ID="txtVecesNeg" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtVecesNeg" CssClass="alert-danger"></asp:RequiredFieldValidator>
                
                  </div>
                     </div>
                 <br />
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Parametro agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnGuardar" runat="server" Text="Aceptar" CssClass="btn btn-info" OnClick="btnGuardar_Click" />
                 <asp:Button ID="btnGuardarModif" runat="server" Text="Modificar" CssClass="btn btn-info" OnClick="btnGuardarModif_Click" Visible="false" />
                 <br />
                 <br />
                  <div class="col-md-12 border shadow rounded">
                 <br />
               
             <h4 class="font-weight-bold mb-0">Gestion de Habitos</h4>
                 <br />
                      
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">
                        <asp:Label ID="lblServicios" runat="server" Text="Servicio"></asp:Label></span>
                  </div>                 
                     <asp:ListBox ID="listServicio" runat="server" ></asp:ListBox>

                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnModificar_Click"/>
                      <asp:Button ID="btnBaja" runat="server" Text="Dar de Baja" CssClass="btn btn-danger" style="margin-left:10px" OnClick="btnBaja_Click" />
                     
                      <asp:Label ID="lblmod" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
            </div>
                 <br />
                
        
                 <br />
          </div>
        </div>
       <br />
             
         </div>
        </section>
    </asp:Content>