<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ColaServicios.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.ColaServicios" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblColaServicios" runat="server" Text="Alarmas"></asp:Label></h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
                 <div class=row>
                     <div class="col-sm">
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblServiciosSolicitados" runat="server" Text="Servicios Solicitados"></asp:Label></h4>
                 <br />
                 
                  <asp:Listbox ID="listServicios" AutoPostBack="true" CssClass="¨list-group" runat="server" OnSelectedIndexChanged="listServicios_SelectedIndexChanged"></asp:Listbox>
                         <br />
                         <asp:Button ID="btnGenerarReporte" runat="server" Text="GenerarReporte" CssClass="btn btn-warning shadow mb-5 rounded" OnClick="btnGenerarReporte_Click" />
              <asp:Button ID="btnGenerarExcel" runat="server" Text="GenerarReporte" CssClass="btn btn-success shadow mb-5 rounded" style="margin-left:10px" OnClick="btnGenerarExcel_Click" />
        
                 <br />                          
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblCerrarServicio" runat="server" Text="Mediciones observadas"></asp:Label></h4>

                 <br />

                             <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblTiempoServicio" runat="server" Text="Seleccione el parametro"></asp:Label></span>
                  </div>                   
                <asp:TextBox ID="txtTiempo" TextMode="Number" runat="server"></asp:TextBox>
                </div>
                         <br />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtTiempo" CssClass="alert-danger"></asp:RequiredFieldValidator>

                         <br />
                        <asp:Button ID="btnCerrarServicio" runat="server" Text="Agregar" CssClass="btn btn-success" OnClick="btnCerrarServicio_Click"/>

                         
                 <br />
                </div>
                     <div class="col-sm">
                 <br />
                 <ul class="list-group">
                     <li class="list-group-item">Nombre: <asp:Label ID="lblNombre" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Descripcion: <asp:Label ID="lblDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Tiempo Medio: <asp:Label ID="lblTiempoMedio" runat="server" Text="" Font-Bold="true"></asp:Label></li>                  
                 </ul>
                         </div>
                 </div>
                 
                
                 <br />
                 <br />
              
        </div>
       <br />
             
         </div>
        </section>
    </asp:Content>
