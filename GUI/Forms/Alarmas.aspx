<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alarmas.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Alarmas" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblAlarmas" runat="server" Text="Alarmas"></asp:Label></h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
                 <div class=row>
                     <div class="col-sm">
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblAlarmasActivas" runat="server" Text="Alarmas Activas"></asp:Label></h4>
                 <br />
                 
                  <asp:Listbox ID="listAlarmas" AutoPostBack="true" CssClass="¨list-group" runat="server" OnSelectedIndexChanged="listAlarmas_SelectedIndexChanged"></asp:Listbox>
                 <br />                          
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblMedicionesObservadas" runat="server" Text="Mediciones observadas"></asp:Label></h4>

                 <br />
                 <asp:Listbox ID="listMediciones" AutoPostBack="true" CssClass="¨list-group" runat="server" OnSelectedIndexChanged="listMediciones_SelectedIndexChanged"></asp:Listbox>
                 <br />
                         <asp:Button ID="btnGenerarReporte" runat="server" Text="GenerarReporte" CssClass="btn btn-warning shadow mb-5 rounded" OnClick="btnGenerarReporte_Click" />
                         <asp:Button ID="btnGenerarExcel" runat="server" Text="GenerarReporte" CssClass="btn btn-success shadow mb-5 rounded" Style="margin-left: 10px" OnClick="btnGenerarExcel_Click" />

                         <br />
                </div>
                     <div class="col-sm">
                 <br />
                 <ul class="list-group">
                     <li class="list-group-item">Nombre: <asp:Label ID="lblNombre" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Descripcion: <asp:Label ID="lblDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Descripcion Máxima: <asp:Label ID="lblDescripcionMax" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                      <li class="list-group-item">Valor Máximo:  <asp:Label ID="lblValMaxMasc" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Descripcion Mínima:  <asp:Label ID="lblDescMin" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                     <li class="list-group-item">Valor Mínimo: <asp:Label ID="lblValMinMasc" runat="server" Text="" Font-Bold="true"></asp:Label></li>
                 </ul>
                         </div>
                 </div>
                 
                
                 <br />
                 <asp:Chart ID="grafico" runat="server" Visible="false" ImageStorageMode="UseImageLocation" >
                     <Series>
                         
                     </Series>
                     <ChartAreas>
                         <asp:ChartArea Name="Area"></asp:ChartArea>
                     </ChartAreas>
                 </asp:Chart>
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


