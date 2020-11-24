<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionEnfermedades.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.GestionEnfermedades" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="font-weight-bold mb-0">
        <asp:Label ID="lblGestionEnfermedades" runat="server" Text="Gestion de Enfermedades"></asp:Label></h1>
    <br />
    <section>
        <div class="container">

            <div class="container border shadow rounded"">
                <div class="row">
                    <br />                  
                 
                    <br />
                    <div class="col-sm">
                        <br />
                            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping3">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label></span>
                  </div>
                    <asp:TextBox ID="txtNom" CssClass="form-control" runat="server"></asp:TextBox>
                
                </div>
                         
                        <br />
                        <h4 class="font-weight-bold mb-0">
                            <asp:Label ID="lblParametros" runat="server" Text="Parametros"></asp:Label></h4>
                        <br />
                       <asp:ListBox ID="listParametros" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px">                      </asp:ListBox>
                      <br />
                         <asp:RadioButton ID="radiomax" runat="server" Text="Maximo" GroupName="MaxoMin" Checked="true" />
                        <asp:RadioButton ID="radiomin" runat="server" Text="Minimo" GroupName="MaxoMin" />
                        <br />
                        <div class="text-right">
                        <asp:Button ID="btnSelecc" runat="server" CssClass="btn btn-success" Text="Seleccionar Parametro" OnClick="btnSelecc_Click" />
                           <ion-icon name="arrow-forward-outline" size ="medium"></ion-icon>
                            </div>
                        <br />
                                      
                        <br />
                        <h4 class="font-weight-bold mb-0">
                            <asp:Label ID="lblHabitos" runat="server" Text="Habitos"></asp:Label></h4>
                        <br />
                       <asp:ListBox ID="listHabitos" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px">                      </asp:ListBox>
                      <br />
                        <div class="text-right">
                        <asp:Button ID="btnSeleccHabito" runat="server" CssClass="btn btn-success" Text="Seleccionar Habito" OnClick="btnSeleccHabito_Click" />
                           <ion-icon name="arrow-forward-outline" size ="medium"></ion-icon>
                            </div>
                        <br />
                       
                         <asp:Button ID="btnGuardarEnfermedad" runat="server" Text="Guardar Enfermedad" CssClass="btn btn-info" OnClick="btnGuardar_Click"/>
                        <br />
                        <br />
                         <asp:Label ID="lblSuccess" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                    </div>
                    <div class="col-sm">
                         <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtNom" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                         <h4 class="font-weight-bold mb-0">
                             <asp:Label ID="lblParametrosSeleccionados" runat="server" Text="Parametros Seleccionados"></asp:Label></h4>
                        <br />
                      <asp:ListBox ID="listaParamSelect" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="300px"></asp:ListBox>
                        <br />
                   
                        <h4 class="font-weight-bold mb-0">
                            <asp:Label ID="lblHabitosSeleccionados" runat="server" Text="Habitos Seleccionados"></asp:Label></h4>
                        <br />
                       <asp:ListBox ID="listHabitosSelec" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="300px">                      </asp:ListBox>
                      <br />
               
                        <br />
                   <br />
                        
                        <br />
                    </div>
                
                </div>
            </div>


            <br />

        </div>
        </section>
    </asp:Content>