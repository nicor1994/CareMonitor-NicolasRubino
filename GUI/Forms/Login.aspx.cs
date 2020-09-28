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
        BLL.Permiso GestorPermiso = new BLL.Permiso();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Intentos"] = "0";
                Session["UsuarioEnSesion"] = null;
            }


            int Registros = GestorUsuario.ComprobarIntegridad();
            if (Registros != 0)
            {
                Button1.Visible = false;
                Label1.Text = "La base de datos esta corrupta!";
                Label1.Visible = true;
                Label1.CssClass = "alert alert-danger";
            }
          

        }

        protected void LoginButtonClick(object sender, EventArgs e)
        {
            int intentos = int.Parse(Session["Intentos"].ToString());
            int result;
            if (int.TryParse(TextBox1.Text, out result) == true)
            {
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

                                Session["UsuarioEnSesion"] = ususesion;

                                Response.Redirect(GestorPermiso.RedireccionarLogin(ususesion));
                            }
                            else
                            {
                                Label1.Text = "El usuario ya tiene una sesion iniciada!";
                                Label1.Visible = true;
                            }
                        }

                        else
                        {
                            Session["UsuarioEnSesion"] = ususesion;
                            Response.Redirect("PrimerInicio.aspx");
                        }
                    }
                }
                else
                {
                    Label1.Text = "Usted agoto los 3 intentos.";
                    Label1.Visible = true;
                }
            }
            else {
                Label1.Text = "El Dni debe ser numerico";
                Label1.Visible = true;
            }
        }
    }
}