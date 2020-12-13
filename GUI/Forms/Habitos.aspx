<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Habitos.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Habitos" %>



<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">Habitos</h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblHabitos" runat="server" Text="Habitos"></asp:Label></h4>
                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblSeleccioneHabito" runat="server" Text="Seleccione el habito"></asp:Label></span>
                  </div>                   
                 <asp:DropDownList ID="dropdownHabitos" runat="server" CssClass="btn btn-light dropdown-toggle rounded"></asp:DropDownList>
                </div>                
                 <br />
               
                 <br />
                 <br />
            <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping2">
                        <asp:Label ID="lblVecesPorSemana" runat="server" Text="Veces por semana"></asp:Label></span>
                  </div>
                  <asp:TextBox TextMode="Number" ID="txtValor" CssClass="form-control" runat="server"></asp:TextBox>
               
                </div>          
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe completar este campo!" ControlToValidate="txtValor" CssClass="alert-danger"></asp:RequiredFieldValidator>
               
                   <br />                                    
                 <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-info shadow mb-5 rounded" OnClick="btnAgregar_Click"/>
                 <asp:Button ID="btnGuardar" CssClass ="btn btn-warning shadow mb-5 rounded" Visible="false" runat="server" Text="Button" OnClick="btnGuardar_Click" />
                 <asp:Label ID="lblExisteHabito" CssClass="alert alert-warning" Visible="false" runat="server" Text="Label"></asp:Label>
                 <br />
                 <br />
                  <div class="col-md-12 border shadow rounded">
                 <br />
                 <br />
             <h4 class="font-weight-bold mb-0">
                 <asp:Label ID="lblHabitosUsuario" runat="server" Text="Habitos del Usuario"></asp:Label></h4>
                 <br />
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping4">
                        <asp:Label ID="lblHabitos2" runat="server" Text="Habitos"></asp:Label></span>
                  </div>                 
                     <asp:ListBox ID="listHabitos" runat="server" ></asp:ListBox>
                     <br />
                       <asp:Button ID="btnModificar" runat="server" Text="Guardar" CssClass="btn btn-success shadow mb-5 rounded" OnClick="btnModificar_Click" style="margin-left:10px" />
                 
                     
                      <asp:Label ID="lblmod" runat="server" CssClass="alert alert-success" Text="Usuario agregado!" Visible="false"></asp:Label>
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