using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class ColaServicios : System.Web.UI.Page
    {
        List<BE.Servicio> ListaServicios = new List<BE.Servicio>();
        BLL.Servicio GestorServicio = new BLL.Servicio();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ListaServicios = GestorServicio.ListarServicios();
                Session["ListaServicios"] = ListaServicios;

                listServicios.DataSource = null;
                listServicios.DataSource = ListaServicios;
                listServicios.DataBind();
            }

            ListaServicios = (List<BE.Servicio>)Session["ListaServicios"];
        }

        protected void listServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            BE.Servicio serv = ListaServicios[listServicios.SelectedIndex];

            lblDescripcion.Text = serv.TipoServicio.Descripcion;
            lblNombre.Text = serv.TipoServicio.Nombre;
            lblTiempoMedio.Text = serv.TipoServicio.TiempoMedio.ToString();

        }

        protected void btnEvolucionar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCerrarServicio_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                GestorServicio.CerrarServicio(ListaServicios[listServicios.SelectedIndex], int.Parse(txtTiempo.Text));

            }

        }
        }
}