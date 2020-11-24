using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Alarmas : System.Web.UI.Page
    {
        BLL.Alarma GestorAlarma = new BLL.Alarma();
        List<BE.Alarma> ListaAlarma = new List<BE.Alarma>();
        List<BE.Medicion> ListaMediciones = new List<BE.Medicion>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 8) != null)
            {
                if (!IsPostBack)
                {



                    ListaAlarma = GestorAlarma.ListarAlarmas();
                    Session["ListaAlarmas"] = ListaAlarma;
                    listAlarmas.DataSource = null;
                    listAlarmas.DataSource = ListaAlarma;
                    listAlarmas.DataBind();




                }
                ListaAlarma = (List<BE.Alarma>)Session["ListaAlarmas"];
            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }
        }

        protected void listAlarmas_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListaMediciones = ListaAlarma[listAlarmas.SelectedIndex].Mediciones;

            listMediciones.DataSource = null;
            listMediciones.DataSource = ListaMediciones;
            listMediciones.DataBind();
        }

        protected void listMediciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            BE.Medicion med = ListaAlarma[listAlarmas.SelectedIndex].Mediciones[listMediciones.SelectedIndex];

            lblNombre.Text = med.Tipo.Nombre;
            lblDescripcion.Text = med.Tipo.Descripcion;
            lblDescripcionMax.Text = med.Tipo.DescripcionMaxima;
            lblDescMin.Text = med.Tipo.DescripcionMinima;
            lblValMaxMasc.Text = med.Tipo.MaximoMasculino.ToString();
            lblValMinMasc.Text = med.Tipo.MinimoMasculino.ToString();

        }

        protected void btnEvolucionar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BE.Alarma alarma = ListaAlarma[listAlarmas.SelectedIndex];

                alarma.Evolucion = txtEvolucion.Text;
                if (GestorAlarma.Evolucionar(alarma) != -1)
                {
                    lblSuccess.Text = "Alarma Evolucionada!";
                    lblSuccess.Visible = true;
                    lblSuccess.CssClass = "alert alert-success";
                }
                else
                {
                    lblSuccess.Text = "Ocurrio un error al evolucionar!";
                    lblSuccess.Visible = true;
                    lblSuccess.CssClass = "alert alert-danger";
                }

            }
        }
    }
}