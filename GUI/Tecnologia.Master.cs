using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{
    public partial class SiteMaster : MasterPage
    {
        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        BLL.Permiso GestorPermiso = new BLL.Permiso();
        protected void Page_Load(object sender, EventArgs e)
        {
            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];

            if (usu == null)
            {
                Response.Redirect("SinPermisos.aspx");
            }
            else
            {
                if (GestorPermiso.VerificarPermiso(usu, 104))
                {
                    Label1.Text = "Bienvenido " + usu.Nombre + " " + usu.Apellido;
                }
                else { Response.Redirect("SinPermisos.aspx"); }
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
          
            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];

            List<int> ListaId = (List<int>)Application["UsuariosEnSesion"];

            ListaId.Remove(usu.ID);
            Application["UsuariosEnSesion"] = ListaId;

            BE.Bitacora bita = new BE.Bitacora();
            bita.Usuario = usu.Nombre + " " + usu.Apellido;
            bita.Tipo = "Cierre de Sesion";
            bita.Accion = "El usuario cerro la sesion";
            bita.Fecha = DateTime.Now;
            GestorBitacora.RegistrarEnBitacora(bita);         
            Session["UsuarioEnSesion"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}