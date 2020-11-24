using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Bitacora : System.Web.UI.Page
    {
        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        BLL.Usuario GestorUsuarios = new BLL.Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 10) != null)
            {
                List<BE.Bitacora> ListaBitacora = new List<BE.Bitacora>();
                List<string> ListaNombres = new List<string>();
                List<string> ListaTipos = new List<string>();
                if (!IsPostBack)
                {
                    ListaBitacora = GestorBitacora.ListarBitacora();
                    Session["ListaBitacora"] = ListaBitacora;
                    dropdownUsuarios.DataSource = GestorUsuarios.ListarNombresUsuario();
                    Session["ListaNombres"] = ListaNombres;
                    dropdownUsuarios.DataSource = null;
                    dropdownUsuarios.DataSource = ListaNombres;
                    dropdownUsuarios.DataBind();

                    ListaTipos = GestorBitacora.ListarTipos(ListaBitacora);
                    Session["ListaTipos"] = ListaTipos;
                    dropdownTipos.DataSource = null;
                    dropdownTipos.DataSource = ListaTipos;
                    dropdownTipos.DataBind();
                }
                else
                {
                    ListaBitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
                    ListaNombres = (List<string>)Session["ListaNombres"];
                    ListaTipos = (List<string>)Session["ListaTipos"];
                    if (ListaBitacora.Count == 0)
                    {
                        ListaBitacora = GestorBitacora.ListarBitacora();
                        Session["ListaBitacora"] = ListaBitacora;
                    }
                    if (ListaNombres.Count == 0)
                    {
                        ListaNombres = GestorUsuarios.ListarNombresUsuario();
                        Session["ListaNombres"] = ListaNombres;
                        dropdownUsuarios.DataSource = null;
                        dropdownUsuarios.DataSource = ListaNombres;
                        dropdownUsuarios.DataBind();
                    }
                    if (ListaTipos.Count == 0)
                    {
                        ListaTipos = GestorBitacora.ListarTipos(ListaBitacora);
                        Session["ListaTipos"] = ListaTipos;
                        dropdownTipos.DataSource = null;
                        dropdownTipos.DataSource = ListaTipos;
                        dropdownTipos.DataBind();
                    }

                }

                GridView1.DataSource = null;
                GridView1.DataSource = ListaBitacora;
                GridView1.DataBind();

            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }


            ///////////////////////////////


           
        }

        

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            calendario.Visible = true;
            dropdownTipos.Visible = false;
            dropdownUsuarios.Visible = false;
            btnFiltraUsuarios.Visible = false;
            btnFiltrarTipo.Visible = false;
        }

        protected void calendario_SelectionChanged(object sender, EventArgs e)
        {

            List<BE.Bitacora> listabitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
            List<BE.Bitacora> listafiltrada = new List<BE.Bitacora>();
            foreach (BE.Bitacora bit in listabitacora)
            {
                if (bit.Fecha == calendario.SelectedDate){
                    listafiltrada.Add(bit);
                }
            }
            Session["ListaBitacora"] = listafiltrada;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            if((listafiltrada.Count == 0)){
                lblerror.Visible = true;
            }
            GridView1.DataBind();
            btnFecha.Enabled = false;
            calendario.Visible = false;
        }

        protected void btnQuitarfiltro_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bitacora.aspx");
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            calendario.Visible = false;
            dropdownUsuarios.Visible = true;
            dropdownTipos.Visible = false;
            btnFiltraUsuarios.Visible = true;
            btnFiltrarTipo.Visible = false;
           
        }

        protected void btnTipo_Click(object sender, EventArgs e)
        {
            calendario.Visible = false;
            dropdownTipos.Visible = true;
            dropdownUsuarios.Visible = false;
            btnFiltraUsuarios.Visible = false;
            btnFiltrarTipo.Visible = true;
           
        }

        protected void dropdownUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            

        }

        protected void dropdownUsuarios_TextChanged(object sender, EventArgs e)
        {
          
        }

        protected void btnFiltraUsuarios_Click(object sender, EventArgs e)
        {
            List<BE.Bitacora> listabitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
            List<BE.Bitacora> listafiltrada = new List<BE.Bitacora>();
            List<string> ListaFiltros = (List<string>)Session["ListaFiltros"];

            foreach (BE.Bitacora bit in listabitacora)
            {
                if (bit.Usuario == dropdownUsuarios.SelectedValue.ToString())
                {
                    listafiltrada.Add(bit);
                }
            }
            Session["ListaBitacora"] = listafiltrada;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            if ((listafiltrada.Count == 0)){
                lblerror.Visible = true;
            }
            GridView1.DataBind();
            btnUsuario.Enabled = false;
            btnFiltraUsuarios.Visible = false;
            
        }

        protected void btnFiltrarTipo_Click(object sender, EventArgs e)
        {
            List<BE.Bitacora> listabitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
            List<BE.Bitacora> listafiltrada = new List<BE.Bitacora>();
            List<string> ListaFiltros = (List<string>)Session["ListaFiltros"];

            foreach (BE.Bitacora bit in listabitacora)
            {
                if (bit.Tipo == dropdownTipos.SelectedValue.ToString())
                {
                    listafiltrada.Add(bit);
                }
            }
            Session["ListaBitacora"] = listafiltrada;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            if ((listafiltrada.Count == 0))
            {
                lblerror.Visible = true;
            }
            GridView1.DataBind();
            btnTipo.Enabled = false;
            btnFiltrarTipo.Visible = false;
        }
    }
}