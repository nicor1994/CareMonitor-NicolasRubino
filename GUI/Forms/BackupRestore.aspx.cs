using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class BackupRestore : System.Web.UI.Page
    {
        BLL.BackupRestore GestorBackupRestore = new BLL.BackupRestore();
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        BE.Usuario UsuEnSesion = new BE.Usuario();
        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        protected void Page_Load(object sender, EventArgs e)
        {


            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 13) != null)
            {
                if (!IsPostBack)
                {
                    Enlazar();
                }
            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }



            

            


            


          
            
            //Label1.Text = UsuEnSesion.Nombre + " " + UsuEnSesion.Apellido;

        }
        public void Enlazar()
        {
            List<string> ListaBkp = new List<string>();
            ListaBkp = GestorBackupRestore.CargarBackups();
            Session["ListaBkp"] = ListaBkp;
            ListBox1.DataSource = ListaBkp;
            ListBox1.DataBind();
            
        }

        protected void btnBackup_Click(object sender, EventArgs e)
        {
            UsuEnSesion = (BE.Usuario)Session["UsuarioEnSesion"];
            int fa = GestorBackupRestore.GenerarBackup(UsuEnSesion);
            
            if (fa == -1)
            {
                lblFallo.Visible = true;
                lblExito.Visible = false;
            }
            else
            {            
                lblFallo.Visible = false;
                lblExito.Visible = true;
            }

            Enlazar();

        }

        protected void btnRestore_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedIndex != -1)
            {
                UsuEnSesion = (BE.Usuario)Session["UsuarioEnSesion"];
                List<string> ListaBkp = (List<string>)Session["ListaBkp"];
                int fa = GestorBackupRestore.GenerarRestore(ListaBkp[ListBox1.SelectedIndex], UsuEnSesion);

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = UsuEnSesion.Nombre + " " + UsuEnSesion.Apellido;
                bita.Tipo = "Cierre de Sesion";
                bita.Accion = "Se cerro la sesion por el Restore";
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);





                Response.Redirect("Login.aspx");
            }
        }
    }
}