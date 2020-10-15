using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class GestionHabitos : System.Web.UI.Page
    {
        BLL.TipoHabito GestorHabitos = new BLL.TipoHabito();
        List<BE.TipoHabito> ListaHabitos = new List<BE.TipoHabito>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ListaHabitos = GestorHabitos.Listar();
                Session["ListaHabitos"] = ListaHabitos;
                listServicio.DataSource = null;
                listServicio.DataSource = ListaHabitos;
                listServicio.DataBind();
            }

            ListaHabitos = (List<BE.TipoHabito>)Session["ListaHabitos"];

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BE.TipoHabito Hab = new BE.TipoHabito();

            Hab.Nombre = txtNombre.Text;
            Hab.ValorNegativo = int.Parse(txtVecesNeg.Text);
            Hab.ValorPositivo = int.Parse(txtVecesPos.Text);
            Hab.EfectoNegativo = txtEfeNeg.Text;
            Hab.EfectoPositivo = txtEfePos.Text;

            if (GestorHabitos.AltaParametro(Hab, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {

                lblSuccess.Visible = true;
                lblSuccess.Text = "Habito agregado!";
                ListaHabitos = GestorHabitos.Listar();
                Session["ListaHabitos"] = ListaHabitos;
                listServicio.DataSource = null;
                listServicio.DataSource = ListaHabitos;
                listServicio.DataBind();
                ListaHabitos = (List<BE.TipoHabito>)Session["ListaHabitos"];
            }
        }
    }
}