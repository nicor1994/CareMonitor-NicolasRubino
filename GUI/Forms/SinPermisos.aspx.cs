using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class SinPermisos : System.Web.UI.Page
    {
        BLL.Permiso GestorPermiso = new BLL.Permiso();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];

            Response.Redirect(GestorPermiso.RedireccionarLogin(usu));
            
        }
    }
}