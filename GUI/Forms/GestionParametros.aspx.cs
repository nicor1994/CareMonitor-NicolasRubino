using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class GestionParametros : System.Web.UI.Page
    {

        BLL.TipoMedicion GestorParametros = new BLL.TipoMedicion();
        List<BE.TipoMedicion> ListaParametros = new List<BE.TipoMedicion>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ListaParametros = GestorParametros.Listar();
                Session["ListaParametros"] = ListaParametros;
                listParametro.DataSource = null;
                listParametro.DataSource = ListaParametros;
                listParametro.DataBind();
            }

            ListaParametros = (List<BE.TipoMedicion>)Session["ListaParametros"];

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BE.TipoMedicion Param = new BE.TipoMedicion();

            Param.Nombre = txtNombre.Text;
            Param.Descripcion = txtDesc.Text;
            Param.DescripcionMaxima = txtDescMax.Text;
            Param.DescripcionMinima = txtDescMin.Text;
            Param.MinimoFemenino = int.Parse(txtValMinFem.Text);
            Param.MinimoMasculino = int.Parse(txtValMinMasc.Text);
            Param.MaximoFemenino = int.Parse(txtValFemMax.Text);
            Param.MaximoMasculino = int.Parse(txtValMaxMasc.Text);
            
           if(GestorParametros.AltaParametro(Param, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {

                lblSuccess.Visible = true;
                lblSuccess.Text = "Parametro agregado!";

            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            BE.TipoMedicion param = ListaParametros[listParametro.SelectedIndex];

            txtNombre.Text = param.Nombre;
            txtDesc.Text = param.Descripcion;
            txtDescMax.Text = param.DescripcionMaxima;
            txtDescMin.Text = param.DescripcionMinima;
            txtValFemMax.Text = param.MaximoFemenino.ToString();
            txtValMaxMasc.Text = param.MaximoMasculino.ToString();
            txtValMinFem.Text = param.MinimoFemenino.ToString();
            txtValMinMasc.Text = param.MinimoMasculino.ToString();

            btnBaja.Visible = false;
            btnGuardarModificacion.Visible = true;
            btnGuardar.Visible = false;
            btnModificar.Visible = false;

        }

        protected void btnGuardarModificacion_Click(object sender, EventArgs e)
        {
            BE.TipoMedicion param = ListaParametros[listParametro.SelectedIndex];

            param.Nombre = txtNombre.Text;
            param.Descripcion = txtDesc.Text;
            param.DescripcionMaxima = txtDescMax.Text;
            param.DescripcionMinima = txtDescMin.Text;
            param.MaximoFemenino = int.Parse(txtValFemMax.Text);
            param.MaximoMasculino = int.Parse(txtValMaxMasc.Text);
            param.MinimoFemenino = int.Parse(txtValMinFem.Text);
            param.MinimoMasculino = int.Parse(txtValMinMasc.Text);

            if (GestorParametros.ModificarParametro(param, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {
                lblSuccess.Visible = true;
                lblSuccess.Text = "Parametro modificado!";

                btnBaja.Visible = true;
                btnGuardarModificacion.Visible = false;
                btnGuardar.Visible = true;
                btnModificar.Visible = true;

                txtNombre.Text = "";
                txtDesc.Text = "";
                txtDescMax.Text = "";
                txtDescMin.Text = "";
                txtValFemMax.Text = "";
                txtValMaxMasc.Text = "";
                txtValMinFem.Text = "";
                txtValMinMasc.Text = "";

            }

            Session["ListaParametros"] = ListaParametros;
            listParametro.DataSource = ListaParametros;
            listParametro.DataBind();

        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            BE.TipoMedicion param = ListaParametros[listParametro.SelectedIndex];
            if (GestorParametros.BajaParametro(param, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {
                ListaParametros = GestorParametros.Listar();
                Session["ListaParametros"] = ListaParametros;
                listParametro.DataSource = ListaParametros;
                listParametro.DataBind();
            }
        }
    }
}