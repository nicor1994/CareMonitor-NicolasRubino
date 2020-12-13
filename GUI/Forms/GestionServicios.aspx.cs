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

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 7) != null)
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
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }

            //////

            


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BE.TipoServicio tipserv = new BE.TipoServicio();

                tipserv.Nombre = txtNombre.Text;
                tipserv.Descripcion = txtDesc.Text;
                tipserv.TiempoMedio = int.Parse(txtTiempo.Text);

                if (GestorServicio.AltaServicio(tipserv, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
                {
                    lblSuccess.Visible = true;
                }
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (listServicio.SelectedIndex != -1)
            {
                BE.TipoServicio serv = ListaServicios[listServicio.SelectedIndex];
                lblSuccess.Visible = false;

                txtDesc.Text = serv.Descripcion;


                txtNombre.Text = serv.Nombre;


                txtTiempo.Text = serv.TiempoMedio.ToString();
                listServicio.Enabled = false;
                btnBaja.Visible = false;
                btnGuardar.Visible = false;
                btnMod.Visible = true;
                listServicio.Enabled = false;
                btnModificar.Visible = false;
            }
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            if (listServicio.SelectedIndex != -1)
            {
                BE.TipoServicio tipserv = ListaServicios[listServicio.SelectedIndex];
                if (GestorServicio.BajaServicio(tipserv, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
                {
                    
                    ListaServicios = GestorServicio.Listar();
                    Session["ListaServicios"] = ListaServicios;
                    listServicio.DataSource = ListaServicios;
                    listServicio.DataBind();
                    listServicio.Enabled = true;
                }
            }
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (listServicio.SelectedIndex != -1)
                {
                    BE.TipoServicio tipserv = ListaServicios[listServicio.SelectedIndex];

                    tipserv.Nombre = txtNombre.Text;
                    tipserv.Descripcion = txtDesc.Text;
                    tipserv.TiempoMedio = int.Parse(txtTiempo.Text);

                    if (GestorServicio.ModificacionServicio(tipserv, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
                    {
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "Servicio modificado con exito!";


                        txtNombre.Text = "";
                        txtDesc.Text = "";
                        txtTiempo.Text = "";


                        btnBaja.Visible = true;
                        btnGuardar.Visible = true;
                        btnMod.Visible = false;
                        listServicio.Enabled = true;
                        btnModificar.Visible = true;
                    }
                    Session["ListaServicios"] = ListaServicios;
                    listServicio.DataSource = ListaServicios;
                    listServicio.DataBind();
                }
            }
            }
    }
}