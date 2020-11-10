﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mediciones.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Mediciones" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">Parametros</h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">Parametros</h4>
                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">Seleccione el parametro</span>
                  </div>                   
                 <asp:DropDownList ID="dropdownParametros" runat="server" CssClass="btn btn-light dropdown-toggle rounded" AutoPostBack="true" OnSelectedIndexChanged="dropdownParametros_SelectedIndexChanged"></asp:DropDownList>
                </div>                
                 <br />
                 <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">Valor</span>
                  </div>
                  <asp:TextBox ID="txtValor" CssClass="form-control" runat="server"></asp:TextBox>
                </div>                
                   <br />                                    
                 <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-info" OnClick="btnAgregar_Click"/>
               
                 <br />
                 <br />
                  <div class="col-md-12 border shadow rounded">
                 <br />
                 <br />
             <h4 class="font-weight-bold mb-0">Parametros Agregados</h4>
                 <br />
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="cosogris" runat="server">Parametros</span>
                  </div>                 
                     <asp:ListBox ID="listParametro" runat="server" ></asp:ListBox>
                     <br />
                       <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnGuardar_Click" />
                 
                     
                      <asp:Label ID="lblmod" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
                     <br />
                     <br />
                 
            </div>
                          <div class="alert alert-danger" role="alert" id="alerta" runat="server" visible="false">
                         <h4 class="alert-heading">Cuidado!!</h4>
                         <p>Los parametros ingresados condicen con la/s siguiente/s enfermedades, se ha emitido una alarma al Departamento Medico</p>
                         <hr>
                         <asp:Label ID="lblEnf" runat="server" Text=""></asp:Label>
                         <br />
                         <asp:Button ID="btnAlarma" CssClass="btn btn-warning" runat="server" Text="Aceptar" OnClick="btnAlarma_Click" />
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