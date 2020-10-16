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
        List<BE.Sintoma> ListaSintomas = new List<BE.Sintoma>();
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

            ListaParametros = (List<BE.TipoMedicion>)Session["ListaParametros"];


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnSelecc_Click(object sender, EventArgs e)
        {

            List<BE.Sintoma> ListaTemporalSintomas = new List<BE.Sintoma>();

            if (Session["ListaTemporalSintomas"]!=null)
            {
                ListaTemporalSintomas = (List<BE.Sintoma>)Session["ListaTemporalSintomas"];
            }

            if (ListaTemporalSintomas.Find(x => x.pSintoma.ID == ListaParametros[listParametros.SelectedIndex].ID) == null)
            {
                BE.Sintoma sint = new BE.Sintoma();
                sint.pSintoma = ListaParametros[listParametros.SelectedIndex];
                if (radiomax.Checked == true)
                {
                    sint.Maximo = true;
                }
                else
                {
                    sint.Maximo = false;
                }
                ListaTemporalSintomas.Add(sint);
                Session["ListaTemporalSintomas"] = ListaTemporalSintomas;
            }

          
            listaParamSelect.DataSource = null;
            listaParamSelect.DataSource = ListaTemporalSintomas;
            listaParamSelect.DataBind();
            

        }
    }
}