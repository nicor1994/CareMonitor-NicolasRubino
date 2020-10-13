<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionServicios.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.GestionServicios" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">Gestion de Servicios</h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">Alta de Servicio</h4>

             <br />

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
                    <span class="input-group-text" id="addon-wrappinga">Tiempo Medio</span>
                  </div>
                    <asp:TextBox ID="txtTiempo" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                   <br />
        
                      
                   <br />
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Servicio agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnGuardar" runat="server" Text="Aceptar" CssClass="btn btn-info" OnClick="btnGuardar_Click"/>
                 <br />
                 <br />
                  <div class="col-md-12 border shadow rounded">
                 <br />
                 <br />
             <h4 class="font-weight-bold mb-0">Gestion de Servicios</h4>
                 <br />
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Servicio</span>
                  </div>                 
                     <asp:ListBox ID="listServicio" runat="server" ></asp:ListBox>

                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnModificar_Click"/>
                      <asp:Button ID="btnBaja" runat="server" Text="Dar de Baja" CssClass="btn btn-danger" style="margin-left:10px" OnClick="btnBaja_Click"/>
                     
                      <asp:Label ID="lblmod" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
            </div>
                 <br />
                   <br />
            <div class="col-md-12 border shadow rounded ">
                 <br />
             <h4 class="font-weight-bold mb-0">Modificar Servicio</h4>

             <br />

                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">Nombre</span>
                  </div>
                   <asp:TextBox ID="txtnombremod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                </div>
                
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">Descripcion</span>
                  </div>
                  <asp:TextBox ID="txtdescmod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                </div>
                
                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping3">Tiempo Medio</span>
                  </div>
                    <asp:TextBox ID="txttiempomod" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                </div>

                   <br />
         
                   <br />
              
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
             
         </div>
        </section>
    </asp:Content>