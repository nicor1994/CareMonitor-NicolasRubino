using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class PrimerInicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BE.Usuario usuensesion = (BE.Usuario)Session["UsuarioEnSesion"];

           Label2.Text = "Bienvenido " + usuensesion.Nombre + " " + usuensesion.Apellido + "!";
        }

        protected void btnCambiarContraseña_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == TextBox2.Text)
            {


            } else { Label1.Visible = true; }
        }
    }
}