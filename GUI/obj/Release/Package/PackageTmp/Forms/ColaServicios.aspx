<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ColaServicios.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.ColaServicios" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
                        <asp:Button ID="btnCerrarServicio" runat="server" Text="Agregar" CssClass="btn btn-success shadow mb-5 rounded" OnClick="btnCerrarServicio_Click"/>

                         
                 <br />
                </div>
                     <div class="col-sm">
                 <br />
                 <ul class="list-group">
                     <li class="list-group-item">Nombre: <asp:Label ID="lblNombre" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Descripcion: <asp:Label ID="lblDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Tiempo Medio: <asp:Label ID="lblTiempoMedio" runat="server" Text="" Font-Bold="true"></asp:Label></li>                  
                 </ul>
                         <br />
                           <asp:Chart ID="graficoBarras" runat="server" ImageStorageMode="UseImageLocation" >
                     <Series>
                         
                     </Series>
                     <ChartAreas>
                         <asp:ChartArea Name="Area"></asp:ChartArea>
                     </ChartAreas>
                 </asp:Chart>
                         </div>

                    
                     <br />
                     <div class="col-12">
                         <br />
                           <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblServiciosCerrados" runat="server" Text="Mediciones observadas"></asp:Label></h4>
                         <br />
                      <div class="table-responsive rounded">
                   <asp:GridView ID="gridServicios"  runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
                             <asp:BoundField DataField="Usuario.Direccion" HeaderText="Dirección" />
                            <asp:BoundField DataField="FechaPedido" HeaderText="Pedido el"  />                            
                            <asp:BoundField DataField="FechaServicio" HeaderText="Fecha del servicio" />
                            <asp:BoundField DataField="FechaCierre" HeaderText="Fecha de cierre" />
                            <asp:BoundField DataField="TipoServicio.TiempoMedio" HeaderText="Tiempo Medio Estimado" />
                            <asp:BoundField DataField="TiempoServicio" HeaderText="Tiempo del Servicio" />
                        </Columns>
                    </asp:GridView>
                </div>
                         <br />
                         <asp:Button ID="btnGenerarReporte2" runat="server" Text="GenerarReporte" CssClass="btn btn-warning shadow mb-5 rounded" OnClick="btnGenerarReporte2_Click"/>
              <asp:Button ID="btnGenerarExcel2" runat="server" Text="GenerarReporte" CssClass="btn btn-success shadow mb-5 rounded" style="margin-left:10px" OnClick="btnGenerarExcel2_Click" />
                         </div>
                 </div>
                 
                
                 <br />
                 <br />
              
        </div>
       <br />
             
         </div>
        </section>
    </asp:Content>
