using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class GestionEnfermedades : System.Web.UI.Page
    {
        BLL.TipoMedicion GestorParametros = new BLL.TipoMedicion();
        List<BE.TipoMedicion> ListaParametros = new List<BE.TipoMedicion>();
        BLL.TipoHabito GestorHabitos = new BLL.TipoHabito();
        List<BE.TipoHabito> ListaHabitos = new List<BE.TipoHabito>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ListaParametros = GestorParametros.Listar();
                Session["ListaParametros"] = ListaParametros;
                listParametros.DataSource = null;
                listParametros.DataSource = ListaParametros;
                listParametros.DataBind();


                ListaHabitos = GestorHabitos.Listar();
                Session["ListaHabitos"] = ListaHabitos;
                listHabitos.DataSource = null;
                listHabitos.DataSource = ListaHabitos;
                listHabitos.DataBind();

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}