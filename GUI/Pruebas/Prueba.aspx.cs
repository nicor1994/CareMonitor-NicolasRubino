using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{

    public partial class Prueba : System.Web.UI.Page
    {

        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        BLL.Usuario GestorUsuario = new BLL.Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
             
            HttpCookie cookieusu = Request.Cookies["Usuario"];


            int idusu = int.Parse(cookieusu["IdUsu"].ToString());
            BE.Usuario UsuEnSesion = GestorUsuario.ObtenerUsuarioID(idusu);
            Label1.Text = UsuEnSesion.Nombre + " " + UsuEnSesion.Apellido;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            BE.Bitacora bita = new BE.Bitacora();

            BE.Usuario usu = new BE.Usuario();
            usu.ID = 1;

            bita.Usuario = usu;

            bita.Usuario.ID = 1;
            bita.Fecha = DateTime.Now;
            bita.Accion = "Prueba";

            GestorBitacora.RegistrarEnBitacora(bita);

        }
    }
}