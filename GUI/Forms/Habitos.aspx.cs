using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Habitos : System.Web.UI.Page
    {
        BLL.TipoHabito GestorHabitos = new BLL.TipoHabito();
        List<BE.TipoHabito> ListaHabitos = new List<BE.TipoHabito>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ListaHabitos = GestorHabitos.Listar();
                Session["ListaHabitos"] = ListaHabitos;
                dropdownHabitos.DataSource = null;
                dropdownHabitos.DataSource = ListaHabitos;
                dropdownHabitos.DataBind();

                

            }

            ListaHabitos = (List<BE.TipoHabito>)Session["ListaHabitos"];
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}