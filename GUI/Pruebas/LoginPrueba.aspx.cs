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
        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
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
                    BE.Bitacora bita = new BE.Bitacora();
                    bita.Usuario = "Usuario no logeado";
                    bita.Fecha = DateTime.Now;
                    bita.Tipo = "Intento inicio de Sesion";
                    bita.Accion = "Intento de sesion erroneo";
                    GestorBitacora.RegistrarEnBitacora(bita);
                    Label1.Text = "Usuario y/o contraseña incorrecto/s.";
                }
                else
                {
                    //Guardo en Bitacora
                    BE.Bitacora bita = new BE.Bitacora();
                    bita.Usuario = ususesion.Nombre + " " + ususesion.Apellido;
                    bita.Fecha = DateTime.Now;
                    bita.Tipo = "Inicio de Sesion";
                    bita.Accion = "El usuario inicio la Sesion";
                    GestorBitacora.RegistrarEnBitacora(bita);
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