using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{

    public partial class Prueba : System.Web.UI.Page
    {

        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        BLL.Tecnologia.Permiso GestorPermiso = new BLL.Tecnologia.Permiso();

        protected void Page_Load(object sender, EventArgs e)
        {
             
            HttpCookie cookieusu = Request.Cookies["Usuario"];


            int idusu = int.Parse(cookieusu["IdUsu"].ToString());
            BE.Usuario UsuEnSesion = GestorUsuario.ObtenerUsuarioID(idusu);
            Label1.Text = UsuEnSesion.Nombre + " " + UsuEnSesion.Apellido;
            UsuEnSesion.ListaPermisos = GestorPermiso.ListarPermisosdeUsuarios(UsuEnSesion);
            ListBox1.DataSource = null;
            ListBox1.DataSource = UsuEnSesion.ListaPermisos;
            ListBox1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            BE.Bitacora bita = new BE.Bitacora();

            BE.Usuario usu = new BE.Usuario();
            usu.ID = 1;

           
            GestorBitacora.RegistrarEnBitacora(bita);

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("BackupRestore.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Permisos.aspx");
        }
    }
}