using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Empleados : System.Web.UI.Page
    {
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        List<BE.Usuario> listausu = new List<BE.Usuario>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                listausu = GestorUsuario.ListarTodosBorrados();
                Session["ListaUsu"] = listausu;
                listUsuarios.DataSource = null;
                listUsuarios.DataSource = listausu;
                listUsuarios.DataBind();
            }

            listausu = (List<BE.Usuario>)Session["ListaUsu"];
        }
    }
}