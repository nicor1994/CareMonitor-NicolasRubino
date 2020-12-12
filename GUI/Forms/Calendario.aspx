<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendario.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.Calendario" %>

 <asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
   <section>
     <div class="container"> 
         
         <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblEventos" runat="server" Text="Servicios"></asp:Label></h1>
         <br />

        
             <div class="col-md-12 border shadow rounded">
                 <br />
            
                 <br />
           
                 <br />
                 <div class="row">
                  
           <div class="col-sm">                  
                 
                <h1 class="font-weight-bold mb-0">
             <asp:Label ID="lblCalendario" runat="server" Text="Servicios"></asp:Label></h1>
               <br />

                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblSeleccioneMes" runat="server" Text="Seleccione el parametro"></asp:Label></span>
                  </div>                   
                <asp:TextBox ID="txtFecha" TextMode="Month" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtFecha_TextChanged"></asp:TextBox>
                </div>
                <br />
                     <div>
                   
        <br />
        <asp:Calendar  runat="server" ID="Calendar1" FirstDayOfWeek="Monday" BorderWidth="0" OnDayRender="Calendar1_DayRender" OnDataBinding="Calendar1_DataBinding" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="true" 
           ShowTitle="false" >
           <SelectedDayStyle Width="100px" CssClass="table table-responsive" Height="100px"/>
            <DayHeaderStyle BorderWidth="0" Font-Size="X-Large" CssClass="text-center" ForeColor="Brown" Width="100px" />
            <DayStyle Width="100px" Height="100px" CssClass="table table-bordered table-responsive" />
             
        </asp:Calendar>
         
    </div>
               </div>

            </div>
              <br />
                 <br />
                    <div class="table-responsive rounded">
                   <asp:GridView ID="gridEventos"  runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                            <asp:BoundField DataField="Titulo" HeaderText="Título"  />                            
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />                          
                        </Columns>
                    </asp:GridView>
                </div>
                   <br />       
                  <asp:Button ID="btnAgregarEvento" runat="server" visible="false" CssClass="btn btn-success shadow mb-5 rounded" Text="Seleccionar Parametro" OnClick="btnAgregarEvento_Click" />
                 <br />
                   <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblTitulo" runat="server" Text="Seleccione el parametro"></asp:Label></span>
                  </div>                   
                <asp:TextBox ID="txtTitulo" CssClass="form-control" Visible="false" runat="server" ></asp:TextBox>
                </div>
                 <br />
                 <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Seleccione el parametro"></asp:Label></span>
                  </div>                   
                <asp:TextBox ID="txtDescripcion" Visible="false" CssClass="form-control" runat="server" ></asp:TextBox>
                </div>
                 <br />
                   <div class="input-group flex-nowrap">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="addon-wrapping">
                        <asp:Label ID="lblHora" runat="server" Text="Seleccione el parametro"></asp:Label></span>
                  </div>                   
                <asp:TextBox ID="txtHora" TextMode="Time" Visible="false" CssClass="form-control" runat="server" ></asp:TextBox>
                </div>
                 <br />
                 <asp:Button ID="btnGuardarEvento" runat="server" Visible="false" CssClass="btn btn-warning shadow mb-5 rounded" Text="Seleccionar Parametro" OnClick="btnGuardarEvento_Click" />
                 
                 <br />
          </div>
        </div>
       <br />
             
        
        </section>
    </asp:Content>

