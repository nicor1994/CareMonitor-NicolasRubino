<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alarmas.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Alarmas" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">Alarmas</h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">Alarmas Activas</h4>
                 <br />
                 <br />
                  <asp:Listbox ID="listAlarmas" CssClass="¨list-group" runat="server"></asp:Listbox>
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
                    <span class="input-group-text" id="addon-wrapping2">Efecto Positivo</span>
                  </div>
                  <asp:TextBox ID="txtEfePos" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Veces por semana Positivo</span>
                  </div>
                    <asp:TextBox ID="txtVecesPos" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                   <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Efecto Negativo</span>
                  </div>
                    <asp:TextBox ID="txtEfeNeg" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                   <br />
        <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrappinga">Veces por semana Negativo</span>
                  </div>
                    <asp:TextBox ID="txtVecesNeg" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                 <br />
                 <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Parametro agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnGuardar" runat="server" Text="Aceptar" CssClass="btn btn-info" />
                 <asp:Button ID="btnGuardarModif" runat="server" Text="Modificar" CssClass="btn btn-info"  Visible="false" />
                 <br />
                 <br />
                  <div class="col-md-12 border shadow rounded">
                 <br />
               
             <h4 class="font-weight-bold mb-0">Gestion de Habitos</h4>
                 <br />
                      
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">Servicio</span>
                  </div>                 
                     <asp:ListBox ID="listServicio" runat="server" ></asp:ListBox>

                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" style="margin-left:10px" />
                      <asp:Button ID="btnBaja" runat="server" Text="Dar de Baja" CssClass="btn btn-danger" style="margin-left:10px"  />
                     
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


