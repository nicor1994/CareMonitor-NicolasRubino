using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class GestionIdioma : System.Web.UI.Page
    {
        BLL.Traductor GestorIdioma = new BLL.Traductor();
        List<BE.Lenguaje> ListaLenguajes = new List<BE.Lenguaje>();
        int indice = new int();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ListaLenguajes = GestorIdioma.ListarIdiomas();
                Session["ListaIdiomas"] = ListaLenguajes;
                listIdioma.DataSource = null;
                listIdioma.DataSource = ListaLenguajes;
                listIdioma.DataBind();
            }
            ListaLenguajes = (List<BE.Lenguaje>)Session["ListaIdiomas"];
        }

        protected void btnSeleccionarIdioma_Click(object sender, EventArgs e)
        {
            BE.Lenguaje leng = ListaLenguajes[listIdioma.SelectedIndex];
            
            leng = GestorIdioma.ListarIdioma(leng);
            Session["Idioma"] = leng;
            Response.Redirect("VistaTecnologia.aspx");


        }

        protected void btnCrearIdioma_Click(object sender, EventArgs e)
        {
            BE.Lenguaje leng = ListaLenguajes[listIdioma.SelectedIndex];
            Session["indice"] = 0;
            leng = GestorIdioma.ListarIdioma(leng);
            Session["LenguajeBase"] = leng.ListaEtiquetas;
            GrillaIdiomas.DataSource = leng.ListaEtiquetas;
            GrillaIdiomas.DataBind();

           
            btnGuardarModificacion.Visible = true;
            txtTraduccion.Visible = true;
            btnCrearNuevoidioma.Visible = true;
        }

        protected void GrillaIdiomas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GrillaIdiomas_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GrillaIdiomas.PageIndex = e.NewPageIndex;
            Session["indice"] = e.NewPageIndex;
            GrillaIdiomas.DataSource = null;
            GrillaIdiomas.DataSource = (List<BE.Etiqueta>)Session["LenguajeBase"];
            GrillaIdiomas.DataBind();
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            
            if (GrillaIdiomas.SelectedRow != null)
            {
                List<BE.Etiqueta> ListaEt = (List<BE.Etiqueta>)Session["LenguajeBase"];
               
                txtTraduccion.Visible = true;
                txtTraduccion.Text = ListaEt[GrillaIdiomas.SelectedRow.RowIndex].Traduccion.ToString();
            }
        }

        protected void btnGuardarModificacion_Click(object sender, EventArgs e)
        {

            List<BE.Etiqueta> ListaEt = (List<BE.Etiqueta>)Session["LenguajeBase"];
           
            ListaEt[GrillaIdiomas.SelectedRow.RowIndex].Traduccion = txtTraduccion.Text;
            Session["LenguajeBase"] = ListaEt;
            GrillaIdiomas.DataSource = ListaEt;
            GrillaIdiomas.DataBind();
        }

        protected void btnCrearNuevoidioma_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                List<BE.Etiqueta> ListaEt = (List<BE.Etiqueta>)Session["LenguajeBase"];
                GestorIdioma.CrearIdioma(ListaEt, txtNombre.Text);
            }
        }

        protected void GrillaIdiomas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GrillaIdiomas.SelectedRow != null)
            {
                List<BE.Etiqueta> ListaEt = (List<BE.Etiqueta>)Session["LenguajeBase"];

                txtTraduccion.Visible = true;
                txtTraduccion.Text = ListaEt[GrillaIdiomas.SelectedRow.RowIndex].Traduccion.ToString();
            }
        }
    }
}