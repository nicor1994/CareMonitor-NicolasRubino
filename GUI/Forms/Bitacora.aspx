<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bitacora.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Bitacora" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
  <section>
     <div class="container">
         <h1 class="font-weight-bold mb-0">Bitacora</h1>
         <div class="row">
         <div class="col-lg-3">
             
             <br />
             <br />
    <div class="btn-group dropright" width:"200px">
       
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-success dropdown-toggle shadow  rounded" Text="Filtrar por:" data-toggle="dropdown" />
  <div class="dropdown-menu" aria-labelledby="Button1">
      <asp:Button ID="Button2" runat="server" CssClass="dropdown-item" Text="Fecha" onClick="Button2_Click"/>
       <asp:Button ID="btnUsuario" runat="server" CssClass="dropdown-item" Text="Usuario" OnClick="btnUsuario_Click" />
       <asp:Button ID="btnTipo" runat="server" CssClass="dropdown-item" Text="Tipo" OnClick="btnTipo_Click" />
    
  </div>
        </div>
         </div>
         <div class="col-lg-7">
          <asp:Calendar id="calendario" runat="server" Visible="false" CssClass="rounded" OnSelectionChanged="calendario_SelectionChanged"></asp:Calendar>
             <br />
             <br />
             <asp:DropDownList ID="dropdownUsuarios" runat="server" Visible="false" CssClass="btn btn-info dropdown-toggle shadow  rounded"></asp:DropDownList>
             <asp:Button ID="btnFiltraUsuarios" CssClass="btn btn-warning shadow" runat="server" Text="Filtrar" Visible="false" OnClick="btnFiltraUsuarios_Click"/>
             <asp:DropDownList ID="dropdownTipos" runat="server" Visible="false" CssClass="btn btn-info dropdown-toggle shadow  rounded"></asp:DropDownList>
             <asp:Button ID="btnFiltrarTipo" CssClass="btn btn-warning shadow" runat="server" Text="Filtrar" Visible="false" OnClick="btnFiltrarTipo_Click" />
        </div>
             <div class="col-lg-2">
                 <br />
                 <br />                              
                 <asp:Button ID="btnQuitarfiltro" runat="server" Text="Quitar filtros" CssClass="btn btn-danger shadow mb-5 rounded" OnClick="btnQuitarfiltro_Click" />
        </div>
             </div>
         </div>
      </section>


        
  
        <br />
        <br />
     <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <asp:label Cssclass="alert alert-danger" role="alert" runat="server" Visible="false" ID="lblerror">
 No se encontraron registros,  <a href="Bitacora.aspx" class="alert-link">haga click aqui</a> para quitar los filtros.
</asp:label>
                <div class="table-responsive rounded">
                   <asp:GridView ID="GridView1"  runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                            <asp:BoundField DataField="Usuario" HeaderText="Usuario"  />                            
                            <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                            <asp:BoundField DataField="Accion" HeaderText="Accion" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            
        </div>
        
    </div>


  
</asp:Content>