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
        Seguridad.DigitoVerificador GestorDigito = new Seguridad.DigitoVerificador();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Intentos"] = "0";
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int intentos = int.Parse(Session["Intentos"].ToString());

            if (intentos < 3)
            {
                BE.Usuario ususesion = GestorUsuario.Login(TextBox1.Text, Seguridad.Encriptador.Encrypt(TextBox2.Text));
           
                if (ususesion.ID == 0)
                {
                    intentos++;
                    Session["Intentos"] = intentos;
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

        protected void Button2_Click(object sender, EventArgs e)
        {

            Label2.Text = GestorDigito.GenerarDVH(TextBox3.Text.ToString()).ToString();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //DateTime fecha = DateTime.Parse(txtfecha.Text);

           int Registros = GestorUsuario.ComprobarIntegridad();
            if (Registros != 0)
            {
                Label3.Text="Hay un problema de integridad";
            }
            else
            {
                Label3.Text = "La base de datos esta integra";
            }
        }
    }
}