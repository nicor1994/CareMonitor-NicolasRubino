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
        BLL.Traductor GestorTraductor = new BLL.Traductor();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Session["Intentos"] = "0";
                Session["UsuarioEnSesion"] = null;
            }       
         
        }

        protected void LoginButtonClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
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
                           
                            if (ususesion.PrimerInicio != true)
                            {
                               
                                    //Guardo en Bitacora

                                  

                                    BE.Bitacora bita = new BE.Bitacora();
                                    bita.Usuario = ususesion.Nombre + " " + ususesion.Apellido;
                                    bita.Fecha = DateTime.Now;
                                    bita.Tipo = "Inicio de Sesion";
                                    bita.Accion = "El usuario inicio la Sesion";
                                    GestorBitacora.RegistrarEnBitacora(bita);
                                    //Redirecciono donde corresponda                                                       

                                    Session["UsuarioEnSesion"] = ususesion;
                                    Session["Idioma"] = GestorTraductor.ListarDefault();
                                    //Response.Redirect(GestorPermiso.RedireccionarLogin(ususesion));
                                    Response.Redirect("Forms/VistaTecnologia.aspx");
                                
                               
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
                else
                {
                    Label1.Text = "El Dni debe ser numerico";
                    Label1.Visible = true;
                }
            }
        }
    }
}