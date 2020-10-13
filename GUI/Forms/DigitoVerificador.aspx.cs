using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class DigitoVerificador : System.Web.UI.Page
    {
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        Seguridad.DigitoVerificador GestorDigito = new Seguridad.DigitoVerificador();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            int Registros = GestorUsuario.ComprobarIntegridad();
            if (Registros != 0)
            {              
                fail.Visible = true;
                btnRecalcular.Visible = true;
            }
            else
            {
                success.Visible = true;
                btnRecalcular.Visible = false;
            }

        }

        protected void btnRecalcular_Click(object sender, EventArgs e)
        {
            GestorUsuario.RecalcularDVH((BE.Usuario)Session["UsuarioEnSesion"]);
            GestorUsuario.RecalcularDVV((BE.Usuario)Session["UsuarioEnSesion"]);
            Response.Redirect("DigitoVerificador.aspx");
        }
    }
}