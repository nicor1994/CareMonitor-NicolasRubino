using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Pruebas
{
    public partial class LoginPrueba : System.Web.UI.Page
    {
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        int intentos = new int();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (intentos < 3)
            {
                BE.Usuario ususesion = GestorUsuario.Login(TextBox1.Text, Seguridad.Encriptador.Encrypt(TextBox2.Text));
           
                if (ususesion.ID == 0)
                {
                    intentos++;
                    Label1.Text = "Usuario y/o contraseña incorrecto/s.";
                }
                else
                {
                    //Redirecciono donde corresponda
                    HttpCookie Usuario = new HttpCookie("Usuario");
                    Usuario["IdUsu"] = ususesion.ID.ToString();
                    Response.Cookies.Add(Usuario);
                    //Redirecciono a la prueba
                    Response.Redirect("Prueba.aspx");
                }

            }
            else
            {
                Label1.Text = "Usted agoto los 3 intentos.";
            }
        }
    }
}