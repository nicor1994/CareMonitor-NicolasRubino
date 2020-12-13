using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class SolicitiarServicio : System.Web.UI.Page
    {  
        BLL.Servicio GestorServicio = new BLL.Servicio();
            List<BE.TipoServicio> ListaServicios = new List<BE.TipoServicio>();
        protected void Page_Load(object sender, EventArgs e)
        {
          


            if (!IsPostBack)
            {
                ListaServicios = GestorServicio.Listar();
                Session["ListaServicios"] = ListaServicios;
                dropdownServicios.DataSource = null;
                dropdownServicios.DataSource = ListaServicios;
                dropdownServicios.DataBind();              
            }

            ListaServicios = (List<BE.TipoServicio>)Session["ListaServicios"];
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (dropdownServicios.SelectedIndex != -1)
                {
                    BE.Servicio serv = new BE.Servicio();
                    serv.TipoServicio = ListaServicios[dropdownServicios.SelectedIndex];
                    serv.Usuario = (BE.Usuario)Session["UsuarioEnSesion"];
                    DateTime dia = DateTime.Parse(txtFecha.Text);
                    DateTime hora = DateTime.Parse(txtHora.Text);
                    DateTime fecha = new DateTime(dia.Year, dia.Month, dia.Day, hora.Hour, hora.Minute, hora.Second);
                    serv.FechaPedido = DateTime.Now.Date;
                    serv.FechaServicio = fecha;

                    if (GestorServicio.SolicitarServicio(serv) == true)
                    {
                        lblSolicitarServicioOk.Visible = true;




                    }
                }
            }
        }

        protected void dropdownServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            BE.TipoServicio serv = ListaServicios[dropdownServicios.SelectedIndex];

            lblDescripcion.Text = serv.Descripcion + " - Tiempo medio: " + serv.TiempoMedio + " minutos";
        }
    }
}