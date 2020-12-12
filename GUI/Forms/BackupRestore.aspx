<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackupRestore.aspx.cs" MasterPageFile="~/Tecnologia.master" Inherits="GUI.Forms.BackupRestore" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="font-weight-bold mb-0">Backup/Restore</h1>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12 border shadow card">
                    <%--<div class="form-container" style="width:400px; height:400px">--%>
                        <div class="form-container">
                        <h3 class="font-weight-bold mb-0"><asp:Label ID="lblBackup" runat="server" Text="Backup"></asp:Label><i class="icon ion-md-save"></i></h3>
                        <br />
                        <br />
                        <asp:Label ID="lblFallo" runat="server" class="alert alert-danger" role="alert" Text="Ocurrió un error!" Visible="false"></asp:Label>
                        <asp:Label ID="lblExito" runat="server" class="alert alert-success" role="alert" Text="Backup exitoso!" Visible ="false"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnBackup" runat="server" CssClass="btn btn-info align-items-md-center shadow mb-5 rounded"  Text="Generar Backup" OnClick="btnBackup_Click" />
                    </div>
                   
                </div>
                <div class=" col-md-6 col-sm-12 border shadow">
                    <%--<div class="form-container" style="width:400px; height:400px">--%>
                        <div class="form-container" >
                        <h3 class="font-weight-bold mb-0">
                            <asp:Label ID="lblRestore" runat="server" Text="Restore"></asp:Label> </i><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-counterclockwise" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
</svg></h3>
                        <br />
                        <br />
                        <br />
                        <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
                        <br />
                            <br />
                            <div class="alert alert-warning" role="alert">
                             <h4 class="alert-heading">
                                 <asp:Label ID="lblAtencion" runat="server" Text="Atencion"></asp:Label></h4>
                              <p>
                                  <asp:Label ID="lblAtencionCuerpo" runat="server" Text="Al restaurar la base de datos se cerrará su sesión y será enviado al Login"></asp:Label></p>
                                                                   </div>
                        <asp:Button ID="btnRestore" runat="server" CssClass="btn btn-warning align-items-md-center shadow mb-5 rounded"  Text="Generar Restore" OnClick="btnRestore_Click" />
                    </div>
                   
                </div>
            </div>
        </div>
    </section>
</asp:Content>
