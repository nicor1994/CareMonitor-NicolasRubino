<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Empleados" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
     <h1 class="font-weight-bold mb-0">Gestor de Empleados</h1>
     <br />
                <br />
    <section>
        <div class="container">
            <div class="row">
             

                 <asp:ListBox ID="listUsuarios" runat="server" Width="200px" Height="200px" ></asp:ListBox>
                <br />
                <br />
                   <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">Legajo</span>
                  </div>
                   <asp:TextBox ID="txtLegajo" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                </div>
                    </div>                  
                </div>
        </section>
</asp:Content>