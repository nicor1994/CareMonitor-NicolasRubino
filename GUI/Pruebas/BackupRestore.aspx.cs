using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Pruebas
{
    public partial class BackupRestore : System.Web.UI.Page
    {

        BLL.BackupRestore GestorBackupRestore = new BLL.BackupRestore();
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        BE.Usuario UsuEnSesion = new BE.Usuario();
        List<string> ListaBkp = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                Enlazar();
            }
           
           
            HttpCookie cookieusu = Request.Cookies["Usuario"];


            int idusu = int.Parse(cookieusu["IdUsu"].ToString());
            UsuEnSesion = GestorUsuario.ObtenerUsuarioID(idusu);
            Label1.Text = UsuEnSesion.Nombre + " " + UsuEnSesion.Apellido;

        }

        protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
        {

        }

        public void Enlazar()
        {
            ListaBkp = GestorBackupRestore.CargarBackups();

            ListBox1.DataSource = ListaBkp;
            ListBox1.DataBind();
            DropDownList1.DataSource = ListaBkp;
            DropDownList1.DataBind();
           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int fa = GestorBackupRestore.GenerarBackup(UsuEnSesion);
            if(fa == -1)
            {
                Label2.Text = "Ocurrio un error";
            }
            else
            {
                Label2.Text = "Salio bien";
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListaBkp = GestorBackupRestore.CargarBackups();
            GestorBackupRestore.GenerarRestore(ListaBkp[ListBox1.SelectedIndex] , UsuEnSesion);
            
            Response.Redirect("LoginPrueba.aspx");
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
         
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           
        }
    }
}