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

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 6) != null)
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
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }

            ////////

          

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BE.TipoHabito Hab = new BE.TipoHabito();

                Hab.Nombre = txtNombre.Text;
                Hab.ValorNegativo = int.Parse(txtVecesNeg.Text);
                Hab.ValorPositivo = int.Parse(txtVecesPos.Text);
                Hab.EfectoNegativo = txtEfeNeg.Text;
                Hab.EfectoPositivo = txtEfePos.Text;

                if (GestorHabitos.AltaHabitos(Hab, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
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

        protected void btnGuardarModif_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BE.TipoHabito habito = ListaHabitos[listServicio.SelectedIndex];

                habito.Nombre = txtNombre.Text;
                habito.EfectoNegativo = txtEfeNeg.Text;
                habito.EfectoPositivo = txtEfePos.Text;
                habito.ValorNegativo = int.Parse(txtVecesNeg.Text.ToString());
                habito.ValorPositivo = int.Parse(txtVecesPos.Text.ToString());


                if (GestorHabitos.ModificarHabito(habito, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
                {
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Habito modificado!";

                    btnBaja.Visible = true;
                    btnGuardarModif.Visible = false;
                    btnGuardar.Visible = true;
                    btnModificar.Visible = true;

                    txtNombre.Text = "";
                    txtEfePos.Text = "";
                    txtEfeNeg.Text = "";
                    txtVecesPos.Text = "";
                    txtVecesNeg.Text = "";
                }

                Session["ListaHabitos"] = ListaHabitos;
                listServicio.DataSource = ListaHabitos;
                listServicio.DataBind();

            }

        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            BE.TipoHabito hab = ListaHabitos[listServicio.SelectedIndex];
            if (GestorHabitos.BajaHabito(hab, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {
                ListaHabitos = GestorHabitos.Listar();
                Session["ListaHabitos"] = ListaHabitos;
                listServicio.DataSource = ListaHabitos;
                listServicio.DataBind();
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

            BE.TipoHabito habito = ListaHabitos[listServicio.SelectedIndex];

            txtNombre.Text = habito.Nombre;
            txtEfeNeg.Text = habito.EfectoNegativo;
            txtEfePos.Text = habito.EfectoPositivo;
            txtVecesNeg.Text = habito.ValorNegativo.ToString();
            txtVecesPos.Text = habito.ValorPositivo.ToString();
           

            btnBaja.Visible = false;
            btnGuardarModif.Visible = true;
            btnGuardar.Visible = false;
            btnModificar.Visible = false;

        }
    }
}