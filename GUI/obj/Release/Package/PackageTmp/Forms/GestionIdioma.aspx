﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionIdioma.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.GestionIdioma" %>



<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
    

        <section class="container-fluid">
            <section class="row">
                <section class="col-md-12">
                    <section class="form-container" runat="server" >
                         <div class="form-group">
                       <h1 class="font-weight-bold mb-0">
                           <asp:Label ID="lblSeleccioneIdioma" runat="server" Text="Seleccione el Idioma"></asp:Label></h1>
                        <br />
                        <asp:ListBox ID="listIdioma" CssClass="center" runat="server" Height ="200" Width="200"></asp:ListBox>
                        <br />
                        <asp:Button ID="btnSeleccionarIdioma" CssClass="btn btn-info shadow mb-5 rounded" runat="server" Text="Cambiar Idioma" OnClick="btnSeleccionarIdioma_Click"/>
                                               
                        <asp:Button ID="btnCrearIdioma" CssClass="btn btn-secondary shadow mb-5 rounded" runat="server" Text="Crear Idioma" OnClick="btnCrearIdioma_Click"/>
                        <br />
                        <br />                          
                           <div class="input-group flex-nowrap">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="addon-wrapping">
                                    <asp:Label ID="lblTextoaTraducir" runat="server" Text="Texto a Traducir"></asp:Label></span>
                            </div>
                            <asp:TextBox ID="txtTraduccion" runat="server" Visible="false" CssClass="form-control input-group-lg"></asp:TextBox>
                        </div>
                         
                               <br />
                        <br />
                               <asp:Button ID="btnGuardarModificacion" runat="server" CssClass="btn btn-primary shadow mb-5 rounded" OnClick="btnGuardarModificacion_Click" Text="Guardar Modificacion" Visible="false"/>
                        <br />
                        <br />
                        <div class="input-group flex-nowrap">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="addon-wrapping">
                                    <asp:Label ID="lblNombreIdioma" runat="server" Text="Nombre del Idioma"></asp:Label></span>
                            </div>
                            <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />                          
                        </div>
                             <br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtNombre" CssClass="alert-danger"></asp:RequiredFieldValidator>
                        <asp:Button ID="btnCrearNuevoidioma" runat="server" CssClass="btn btn-warning shadow mb-5 rounded" OnClick="btnCrearNuevoidioma_Click" Text="Crear Nuevo Idioma" Visible="false"/>
                   
                           <div class="table-responsive w-75 mx-auto">
                          <div id="divGrid" style="overflow: auto; height: 200px">     
                    <asp:GridView ID="GrillaIdiomas" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"
                        AutoGenerateSelectButton="true"
                        AutoGenerateDeleteButton="false" 
                        AutoGenerateEditButton="false"
                        OnSelectedIndexChanged="GrillaIdiomas_SelectedIndexChanged"
                        >
                        
                        <SelectedRowStyle CssClass="table-success"/>
                    </asp:GridView></div>
                                  
                               </div>
                           </div>
               
                       
                   </section>
                </section>
            </section>
            </section>
     <br />
    
                      
     </asp:Content>
                      


