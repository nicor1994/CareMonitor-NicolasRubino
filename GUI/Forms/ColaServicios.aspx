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
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblTiempoServicio" runat="server" Text="Mediciones observadas"></asp:Label></h4>

                 <br />
                         <asp:TextBox ID="txtTiempo" TextMode="Number" runat="server"></asp:TextBox>
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
                  <div class="col-md-12 border shadow rounded">
                 <br />
               
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblGestionHabitos" runat="server" Text="Gestion de Habitos"></asp:Label></h4>
                 <br />
                      
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">
                        <asp:Label ID="lblEvolucion" runat="server" Text="Evolucion"></asp:Label></span>
                  </div>                 
                     <asp:TextBox ID="txtEvolucion" runat="server" TextMode ="MultiLine" CssClass="w-100"></asp:TextBox>
                     <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtEvolucion" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                     
                      
            </div>
                      <br />
                      <asp:Button ID="btnEvolucionar" runat="server" Text="Evolucionar" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnEvolucionar_Click"/>
                     
                     <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Text="Parametro agregado!" Visible="false"></asp:Label>
                     
                 <br />
                
        
                 <br />
          </div>
        </div>
       <br />
             
         </div>
        </section>
    </asp:Content>
