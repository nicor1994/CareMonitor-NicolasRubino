using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Calendario : System.Web.UI.Page
    {
        BLL.Evento GestorEventos = new BLL.Evento();
        List<BE.Evento> ListaEventos = new List<BE.Evento>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ListaEventos = GestorEventos.Listar((BE.Usuario)Session["UsuarioEnSesion"]);
                Session["ListaEventos"] = ListaEventos;
                Calendar1.Visible = false;
            }
            ListaEventos = (List<BE.Evento>)Session["ListaEventos"];

        }

        protected void txtFecha_TextChanged(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
            DateTime selecc = DateTime.Parse(txtFecha.Text);
           
            Calendar1.TodaysDate = selecc;
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Cell.Text = String.Empty;
                e.Cell.Height = 0;
                e.Cell.CssClass = "isOtherMonth";
            }

            foreach(BE.Evento eve in ListaEventos)
            {

                if (e.Day.Date == eve.Fecha.Date)
                {
                    
                        e.Cell.Controls.Add(new LiteralControl("<table style='height:10px;width:100%;'><tr><td style='vertical-align:bottom;padding:5px;border:none'><span class='badge badge-secondary'>" + eve.Titulo +"</span></td></tr></table>"));
                        e.Cell.BackColor = System.Drawing.Color.FromArgb(21,166,126);
                        e.Cell.ForeColor = System.Drawing.Color.White;
                    
                }


            }


        }
        
        protected void Calendar1_DataBinding(object sender, EventArgs e)
        {
            List<BE.Evento> ListaSelecc = new List<BE.Evento>();

            foreach(BE.Evento eve in ListaEventos)
            {
                if (Calendar1.SelectedDate == eve.Fecha)
                {
                    ListaSelecc.Add(eve);
                }
            }

            gridEventos.DataSource = null;
            gridEventos.DataSource = ListaSelecc;
            gridEventos.DataBind();


        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            List<BE.Evento> ListaSelecc = new List<BE.Evento>();

            foreach (BE.Evento eve in ListaEventos)
            {
                if (Calendar1.SelectedDate.Date == eve.Fecha.Date)
                {
                    ListaSelecc.Add(eve);
                }
            }

            gridEventos.DataSource = null;
            gridEventos.DataSource = ListaSelecc;
            gridEventos.DataBind();
            btnAgregarEvento.Visible = true;
        }

        protected void btnAgregarEvento_Click(object sender, EventArgs e)
        {
            btnAgregarEvento.Visible = false;
            btnGuardarEvento.Visible = true;
            txtDescripcion.Visible = true;
            txtTitulo.Visible = true;
            txtHora.Visible = true;
        }

        protected void btnGuardarEvento_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BE.Evento eve = new BE.Evento();
                eve.Titulo = txtTitulo.Text;
                eve.Descripcion = txtDescripcion.Text;
                DateTime hora = DateTime.Parse(txtHora.Text);
                DateTime fecha = new DateTime(Calendar1.SelectedDate.Year, Calendar1.SelectedDate.Month, Calendar1.SelectedDate.Day, hora.Hour, hora.Minute, hora.Second);
                eve.Fecha = fecha;
                GestorEventos.AltaEventos(eve, (BE.Usuario)Session["UsuarioEnSesion"]);

                ListaEventos = GestorEventos.Listar((BE.Usuario)Session["UsuarioEnSesion"]);
                Session["ListaEventos"] = ListaEventos;
                DateTime selecc = DateTime.Parse(txtFecha.Text);
                Calendar1.TodaysDate = selecc;
                btnGuardarEvento.Visible = false;
            }
        }
    }
}