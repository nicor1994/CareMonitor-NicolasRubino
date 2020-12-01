using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
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

            BE.Usuario usu = ListaAlarma[listAlarmas.SelectedIndex].Usuario;

            grafico.Visible = true;

            

            grafico.ChartAreas["Area"].AxisX.Minimum = 0;
            grafico.ChartAreas["Area"].AxisX.Maximum = 100;
            grafico.ChartAreas["Area"].AxisY.Name = "Medición";
            grafico.ChartAreas["Area"].AxisY.IsStartedFromZero = false;
            

            grafico.Series.Add("Min");
            grafico.Series.Add("Max");
            grafico.Series.Add(usu.Apellido + ", " + usu.Nombre);           
         

            grafico.Series["Min"].Points.AddXY(0, med.Tipo.MinimoMasculino);           
            grafico.Series["Min"].Points.AddXY(100, med.Tipo.MinimoMasculino);
            grafico.Series["Min"].Label = "Min";
            grafico.Series["Min"].BorderWidth = 5;
            grafico.Series["Max"].Points.AddXY(0, med.Tipo.MaximoMasculino);
            grafico.Series["Max"].Points.AddXY(100, med.Tipo.MaximoMasculino);
            grafico.Series["Max"].Label = "Max";
            grafico.Series["Max"].BorderWidth = 5;

            grafico.Series["Max"].Color = System.Drawing.Color.Red;
            grafico.Series["Min"].Color = System.Drawing.Color.Aqua;
            grafico.Series[usu.Apellido + ", " + usu.Nombre].Color = System.Drawing.Color.Green;

            grafico.Series[usu.Apellido + ", " + usu.Nombre].Points.AddXY(0, med.Valor);
            grafico.Series[usu.Apellido + ", " + usu.Nombre].Points.AddXY(100, med.Valor);
            grafico.Series[usu.Apellido + ", " + usu.Nombre].Label = "Medición";
            grafico.Series[usu.Apellido + ", " + usu.Nombre].BorderWidth = 5;

            grafico.Series["Min"].YValueMembers = "Min";
            grafico.Series["Max"].YValueMembers = "Max";
            grafico.Series[usu.Apellido + ", " + usu.Nombre].YValueMembers = "Medición";

            grafico.Series["Min"].LegendText = "Min";
            grafico.Series["Max"].LegendText = "Max";
            grafico.Series[usu.Apellido + ", " + usu.Nombre].LegendText = "Medición";

            grafico.Series["Min"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            grafico.Series["Max"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            grafico.Series[usu.Apellido + ", " + usu.Nombre].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;

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