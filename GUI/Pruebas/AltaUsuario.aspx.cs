using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Pruebas
{
    public partial class AltaUsuario : System.Web.UI.Page
    {
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BE.Usuario usu = new BE.Usuario();

            usu.Nombre = TextBox1.Text;
            usu.Apellido = TextBox2.Text;
            usu.DNI = int.Parse(TextBox3.Text);
            usu.Contraseña = usu.Nombre.ToLower() + usu.Apellido.ToLower();

           

        }
    }
}