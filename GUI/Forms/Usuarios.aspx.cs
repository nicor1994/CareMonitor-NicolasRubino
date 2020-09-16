using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Usuarios : System.Web.UI.Page
    {
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            BE.Usuario usu = new BE.Usuario();
            usu.Nombre = txtNombre.Text;
            usu.Apellido = txtApellido.Text;
            usu.DNI = int.Parse(txtDni.Text);          
            usu.Contraseña = Seguridad.Encriptador.Encrypt(usu.DNI.ToString() + usu.Nombre.ToLower());
            usu.Direccion = txtDireccion.Text;
            if ((GestorUsuario.RegistrarUsuario(usu, (BE.Usuario)Session["UsuarioEnSesion"])) == true){
                lblSuccess.Visible = true;
            }
        }
    }
}