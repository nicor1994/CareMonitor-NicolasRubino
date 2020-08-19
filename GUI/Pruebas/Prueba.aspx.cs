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

        protected void Page_Load(object sender, EventArgs e)
        {

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