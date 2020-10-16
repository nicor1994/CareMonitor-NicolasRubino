<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Permisos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="font-weight-bold mb-0">Gestion de Permisos</h1>
    <br />
    <section>
        <div class="container">

            <div class="container border shadow rounded"">
                <div class="row">
                    <br />
                    <div class="col-sm">
                        <br />
                        <h4 class="font-weight-bold mb-0">Permisos</h4>
                        <br />
                       <asp:ListBox ID="listPermisos" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px">                      </asp:ListBox>
                      <br />
                        <div class="text-right">
                        <asp:Button ID="btnSelecc" runat="server" CssClass="btn btn-success" Text="Seleccionar Permiso" OnClick="btnSelecc_Click" />
                           <ion-icon name="arrow-forward-outline" size ="medium"></ion-icon>
                            </div>
                        <br />
                    
               
                                        
                         <asp:Label ID="lblSuccess" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                     <br />
                  
                   <br />
                        <br />
                       
                    </div>
                    <div class="col-sm">
                         <br />
                         <h4 class="font-weight-bold mb-0">Crear Rol</h4>
                        <br />
                      <asp:ListBox ID="listaTemp" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="300px"></asp:ListBox>
                        <br />
                               <br />     
                        
                           <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">Nombre Rol</span>
                  </div>
                             
                   <asp:TextBox ID="txtRol" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="btnAgregarRol" runat="server" CssClass="btn btn-outline-info" Text="Crear Rol" OnClick="btnAgregarRol_Click"  style="margin-left:10px" />      
                       
                   <br />
                        <br />
                    </div>
                    <div class="col-sm">
                         <br />
                        <h4 class="font-weight-bold mb-0">Roles</h4>
                        <br />
                        <asp:ListBox ID="listRoles" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px"></asp:ListBox>
                        <br />
                        <div class="text-left">
                            <ion-icon name="arrow-back-outline" size="medium"></ion-icon>
                            <asp:Button ID="btnSelectRol" runat="server" CssClass="btn btn-success" Text="Seleccionar Rol" OnClick="btnSelectRol_Click" />
                        </div>
                    </div>
                </div>
            </div>


            <br />

        </div>
        <div class="container">
              <div class="container border shadow rounded"">
            <div class="row">
                <div class="col-sm">
                    <br />
                   <asp:ListBox ID="listUsu" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px"></asp:ListBox>
                    <br />
                       <asp:Button ID="btnUsuario" runat="server" CssClass="btn btn-success" Text="Seleccionar Usuario" OnClick="btnUsuario_Click" />
                    <br />
                </div>
                <div class="col-sm">
                      <br />
                   <asp:ListBox ID="listRolUsu" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px"></asp:ListBox>
                    <br />
                       <asp:Button ID="btnGuardarRol" runat="server" CssClass="btn btn-success" Text="Guardar Roles" OnClick="btnGuardarRol_Click" Visible="false" />
                    <br />
                </div>
                <div class="col-sm">
                    <br />
                    <asp:ListBox ID="listRoles2" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px"></asp:ListBox>
                      <br />
                       <asp:Button ID="btnAgregarRolUsu" runat="server" CssClass="btn btn-success" Text="Agregar Roles" OnClick="btnAgregarRolUsu_Click" Visible ="false"/>
                    <br />
                </div>
            </div>
        </div>
            <br />
</div>

                <%--  <div class="col-md-12 border shadow rounded">
                 
                      <h4 class="font-weight-bold mb-0" >Alta de Roles</h4>
                      <br />
                        
                    <br />
                    
                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-outline-info" Text="Agregar Permiso" OnClick="btnAgregarPermiso_Click"  style="margin-left:10px" />          
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                
                      <br />
                  

                        
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:Button ID="Button2" runat="server" Text="Button" />
         
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="Crear Rol" />
          

                  </div>--%>
              
            

           
    </section>
</asp:Content>
