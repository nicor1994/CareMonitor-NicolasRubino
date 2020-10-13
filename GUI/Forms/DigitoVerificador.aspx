<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DigitoVerificador.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.DigitoVerificador" %>

<asp:Content ID="Content2" CssClass="border" ContentPlaceHolderID="MainContent" runat="server">
  <section>
     <div class="container">
         <h1 class="font-weight-bold mb-0">Digito Verificador</h1>
         <br />
         <br />
           <div class="alert alert-success" role="alert" id="success" runat="server" visible="false">
                             <h4 class="alert-heading">Todo bien!!</h4>
               <hr />
                              <p>La base de datos está íntegra!</p>
                                                                   </div>
         <div class="alert alert-danger" role="alert" id="fail" runat="server" visible="false">
                             <h4 class="alert-heading">Algo salió mal!</h4>
               <hr />
                              <p>La base de datos NO está íntegra!</p>
                                                                   </div>
         <br />
         <asp:Button ID="btnRecalcular" CssClass="btn btn-info" runat="server" Text="Recalcular DVH" OnClick="btnRecalcular_Click" />
       

         </div>
      </section>
    </asp:Content>
