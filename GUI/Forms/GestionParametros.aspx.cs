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
                listServicio.DataSource = null;
                listServicio.DataSource = ListaParametros;
                listServicio.DataBind();
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
    }
}