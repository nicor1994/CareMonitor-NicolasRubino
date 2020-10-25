<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Roles" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="font-weight-bold mb-0">Gestion de Permisos</h1>
    <br />
    <section>
   <div class="container">
              <div class="container border shadow rounded"">
            <div class="row">
                <div class="col-sm">
                    <br />
                    <h4 class="font-weight-bold mb-0">Usuario</h4>
                    <br />
                   <asp:ListBox ID="listUsu" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="500px"></asp:ListBox>
                    <br />
                       <asp:Button ID="btnUsuario" runat="server" CssClass="btn btn-success" Text="Seleccionar Usuario" OnClick="btnUsuario_Click" />
                    <br />
                </div>
                <div class="col-sm">
                     <br />
                    <h4 class="font-weight-bold mb-0">Permisos Asignados</h4>
                      <br />
                   <asp:ListBox ID="listRolUsu" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="500px"></asp:ListBox>
                    <br />
                       <asp:Button ID="btnGuardarRol" runat="server" CssClass="btn btn-success" Text="Guardar Roles" OnClick="btnGuardarRol_Click" Visible="false" />
                    <br />
                </div>
                <div class="col-sm">
                     <br />
                    <h4 class="font-weight-bold mb-0">Roles</h4>
                    <br />
                    <asp:ListBox ID="listRoles2" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px"></asp:ListBox>
                      <br />
                       <asp:Button ID="btnAgregarRolUsu" runat="server" CssClass="btn btn-success" Text="Agregar Roles" OnClick="btnAgregarRolUsu_Click" Visible ="true"/>
                    <br />                   
                    <h4 class="font-weight-bold mb-0">Permisos</h4>
                    <br />
                        <asp:ListBox ID="listPermisos" CssClass="list-group-item list-group-item-action align-content-stretch" runat="server" Height="200px"></asp:ListBox>
                    <br />
                        <asp:Button ID="btnAgregarPermiso" runat="server" CssClass="btn btn-success" Text="Agregar Roles" OnClick="btnAgregarPermiso_Click" Visible ="true"/>
                    <br />
                </div>
            </div>
        </div>
            <br />
</div>
        </section>
    </asp:Content>
