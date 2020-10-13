using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class GestionServicios : System.Web.UI.Page
    {
        BLL.Servicio GestorServicio = new BLL.Servicio();
        List<BE.TipoServicio> ListaServicios = new List<BE.TipoServicio>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ListaServicios = GestorServicio.Listar();
                Session["ListaServicios"] = ListaServicios;
                listServicio.DataSource = null;
                listServicio.DataSource = ListaServicios;
                listServicio.DataBind();
            }

            ListaServicios = (List<BE.TipoServicio>)Session["ListaServicios"];


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BE.TipoServicio tipserv = new BE.TipoServicio();

            tipserv.Nombre = txtNombre.Text;
            tipserv.Descripcion = txtDesc.Text;
            tipserv.TiempoMedio = int.Parse(txtTiempo.Text);

           if( GestorServicio.AltaServicio(tipserv, (BE.Usuario)Session["UsuarioEnSesion"])== true)
            {
                lblSuccess.Visible = true;
            }
             

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            BE.TipoServicio serv = ListaServicios[listServicio.SelectedIndex];
            lblSuccess.Visible = false;
            txtdescmod.Text = serv.Descripcion;
            txtdescmod.Visible = true;
            txtnombremod.Text = serv.Nombre;
            txtnombremod.Visible = true;
            txttiempomod.Text = serv.TiempoMedio.ToString();
            txttiempomod.Visible = true;
            btnBaja.Visible = false;
            btnGuardar.Visible = false;
            btnMod.Visible = true;
            listServicio.Enabled = false;
            
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            BE.TipoServicio tipserv = ListaServicios[listServicio.SelectedIndex];
            if (GestorServicio.BajaServicio(tipserv, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {
                ListaServicios = GestorServicio.Listar();
                Session["ListaServicios"] = ListaServicios;
                listServicio.DataSource = ListaServicios;
                listServicio.DataBind();
            }
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            BE.TipoServicio tipserv = ListaServicios[listServicio.SelectedIndex];

            tipserv.Nombre = txtnombremod.Text;
            tipserv.Descripcion = txtdescmod.Text;
            tipserv.TiempoMedio = int.Parse(txttiempomod.Text);

            if (GestorServicio.ModificacionServicio(tipserv, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {
                lblsuccess2.Visible = true;
                lblsuccess2.Text = "Servicio modificado con exito!";

               
             
                
                txtdescmod.Visible = false;
               
                txtnombremod.Visible = false;
                
                txttiempomod.Visible = false;
                btnBaja.Visible = true;
                btnGuardar.Visible = true;
                btnMod.Visible = false;
                listServicio.Enabled = true;

            }
            Session["ListaServicios"] = ListaServicios;
            listServicio.DataSource = ListaServicios;
            listServicio.DataBind();
        }
    }
}