using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Login : System.Web.UI.Page
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

        protected void LoginButtonClick(object sender, EventArgs e)
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
                    Label1.Visible = true;
                }
                else
                {
                    List<int> UsuariosEnSesion = new List<int>();
                    UsuariosEnSesion = (List<int>)Application["UsuariosEnSesion"];
                    if (ususesion.PrimerInicio != true)
                    {
                        if (GestorUsuario.ComprobarUsuarioEnSesion(UsuariosEnSesion, ususesion) == false)
                        {
                            //Guardo en Bitacora

                            UsuariosEnSesion.Add(ususesion.ID);
                            Application["UsuariosEnSesion"] = UsuariosEnSesion;

                            BE.Bitacora bita = new BE.Bitacora();
                            bita.Usuario = ususesion.Nombre + " " + ususesion.Apellido;
                            bita.Fecha = DateTime.Now;
                            bita.Tipo = "Inicio de Sesion";
                            bita.Accion = "El usuario inicio la Sesion";
                            GestorBitacora.RegistrarEnBitacora(bita);
                            //Redirecciono donde corresponda
                            //HttpCookie Usuario = new HttpCookie("Usuario");
                            //Usuario["IdUsu"] = ususesion.ID.ToString();
                            Session["UsuarioEnSesion"] = ususesion;
                            //Response.Cookies.Add(Usuario);
                            //Redirecciono a la prueba
                            Response.Redirect("VistaTecnologia.aspx");
                        }
                        else
                        {
                            Label1.Text = "El usuario ya tiene una sesion iniciada!";
                            Label1.Visible = true;
                        }
                    }
                    
                    else {
                        Session["UsuarioEnSesion"] = ususesion;
                        Response.Redirect("PrimerInicio.aspx"); }
                    }
            }
            else
            {
                Label1.Text = "Usted agoto los 3 intentos.";
                Label1.Visible = true;
            }
        }
    }
}