<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitarServicio.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.SolicitiarServicio" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblServicios" runat="server" Text="Servicios"></asp:Label></h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblSolicitarServicio" runat="server" Text="Solicitar Servicio"></asp:Label></h4>
                 <br />
           
                 <br />
                 <div class="row">
                     <div class="col-md-6 col-sm-12">
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblServiciosDisponibles" runat="server" Text="Serivcios Disponibles"></asp:Label></span>
                  </div>
                <asp:DropDownList ID="dropdownServicios" runat="server" OnSelectedIndexChanged="dropdownServicios_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                         <br />
                   <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion"></asp:Label></span>
                  </div>
                 
                </div>
                 <br />
                     </div>
             
                 <br />
            <div class="col-md-6 col-sm-12">

                  <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblFecha" runat="server" Text="Serivcios Disponibles"></asp:Label></span>
                  </div>
                 <asp:TextBox ID="txtFecha" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                </div>


   
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtFecha" CssClass="alert-danger"></asp:RequiredFieldValidator>
                <br />


                  <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblHora" runat="server" Text="Serivcios Disponibles"></asp:Label></span>
                  </div>
                 <asp:TextBox ID="txtHora" TextMode="Time" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtHora" CssClass="alert-danger"></asp:RequiredFieldValidator>
            </div>
               </div>
                   <br />
              
                     
                 <br />
                 <asp:Label ID="lblSolicitarServicioOk" runat="server" CssClass="alert alert-success" Text="Parametro agregado!" Visible="false"></asp:Label>
                 <asp:Button ID="btnGuardar" runat="server" Text="Aceptar" CssClass="btn btn-info shadow mb-5 rounded" OnClick="btnGuardar_Click" />
               
                 <br />
                 <br />
                
            
                 <br />
          </div>
        </div>
       <br />
             
        
        </section>
    </asp:Content>
