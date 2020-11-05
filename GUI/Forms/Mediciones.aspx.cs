using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Mediciones : System.Web.UI.Page
    {
        BLL.TipoMedicion GestorParametros = new BLL.TipoMedicion();
        List<BE.TipoMedicion> ListaParametros = new List<BE.TipoMedicion>();
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListaParametros = GestorParametros.Listar();
                Session["ListaParametros"] = ListaParametros;
                dropdownParametros.DataSource = null;
                dropdownParametros.DataSource = ListaParametros;
                dropdownParametros.DataBind();
                lblDesc.Text = ListaParametros[dropdownParametros.SelectedIndex].Descripcion;
            }
            ListaParametros = (List<BE.TipoMedicion>)Session["ListaParametros"];
        
        }

        protected void dropdownParametros_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblDesc.Text = ListaParametros[dropdownParametros.SelectedIndex].Descripcion;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            BE.Medicion MedicionUsuario = new BE.Medicion();
            MedicionUsuario.Tipo = ListaParametros[dropdownParametros.SelectedIndex];
            MedicionUsuario.Valor = int.Parse(txtValor.Text);
            List<BE.Medicion> ListaParametrosUsu = new List<BE.Medicion>();
            if (Session["ListaParametrosUsu"] != null)
            {
                ListaParametrosUsu = (List<BE.Medicion>)Session["ListaParametrosUsu"];
            }

            if (ListaParametrosUsu.Find(x => x.Tipo.ID == ListaParametros[dropdownParametros.SelectedIndex].ID) == null)
            {


                ListaParametrosUsu.Add(MedicionUsuario);
                Session["ListaParametrosUsu"] = ListaParametrosUsu;
                listParametro.DataSource = null;
                listParametro.DataSource = ListaParametrosUsu;
                listParametro.DataBind();
            }
        }
    }
}