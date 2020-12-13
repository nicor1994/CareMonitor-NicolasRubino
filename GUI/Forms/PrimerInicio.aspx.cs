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

        BLL.Usuario GestorUsuario = new BLL.Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            BE.Usuario usuensesion = (BE.Usuario)Session["UsuarioEnSesion"];

           Label2.Text = "Bienvenido " + usuensesion.Nombre + " " + usuensesion.Apellido + "!";
        }

        protected void btnCambiarContraseña_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (TextBox1.Text == TextBox2.Text)
                {

                    BE.Usuario usuensesion = (BE.Usuario)Session["UsuarioEnSesion"];

                    usuensesion.Contraseña = Seguridad.Encriptador.Encrypt(TextBox1.Text);

                    if (GestorUsuario.CambiarContraseña(usuensesion, usuensesion) == true)
                    {
                        GestorUsuario.RecalcularDVV((BE.Usuario)Session["UsuarioEnSesion"]);
                        Session["UsuarioEnSesion"] = null;
                        Response.Redirect("Login.aspx");
                    }




                }
                else { Label1.Visible = true; }
            }
        }
    }
}