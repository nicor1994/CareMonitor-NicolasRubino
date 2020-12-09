using BE;
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
        BLL.Enfermedad GestorEnfermedades = new BLL.Enfermedad();
        List<BE.Enfermedad> ListaEnfermedades = new List<Enfermedad>();
        protected void Page_Load(object sender, EventArgs e)
        {

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 18) != null)
            {
                if (!IsPostBack)
                {

                    ListaParametros = GestorParametros.Listar();
                    Session["ListaParametros"] = ListaParametros;
                    listParametros.DataSource = null;
                    listParametros.DataSource = ListaParametros;
                    listParametros.DataBind();

                    ListaEnfermedades = GestorEnfermedades.Listar();
                    Session["ListaEnfermedades"] = ListaEnfermedades;
                    listEnfermedades.DataSource = null;
                    listEnfermedades.DataSource = ListaEnfermedades;
                    listEnfermedades.DataBind();

                    ListaHabitos = GestorHabitos.Listar();
                    Session["ListaHabitos"] = ListaHabitos;
                    //listHabitos.DataSource = null;
                    //listHabitos.DataSource = ListaHabitos;
                    //listHabitos.DataBind();

                }

                ListaParametros = (List<BE.TipoMedicion>)Session["ListaParametros"];
                ListaHabitos = (List<BE.TipoHabito>)Session["ListaHabitos"];
                ListaEnfermedades = (List<BE.Enfermedad>)Session["ListaEnfermedades"];
            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }

            ///////


            

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<BE.Sintoma> lista = (List<BE.Sintoma>)Session["ListaTemporalSintomas"];
                if (lista != null)
                {
                    BE.Enfermedad enf = new BE.Enfermedad();

                    enf.Nombre = txtNom.Text;
                    enf.Sintomas = (List<BE.Sintoma>)Session["ListaTemporalSintomas"];
                    enf.MalosHabitos = (List<BE.TipoHabito>)Session["ListaTemporalHabitos"];

                    if (GestorEnfermedades.AltaEnfermedad(enf, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
                    {
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "Enfermedad Agregada!";
                        lblSuccess.CssClass = "alert alert-success";
                        Session["ListaTemporalSintomas"] = null;
                        Session["ListaTemporalHabitos"] = null;
                    }
                }
                else
                {
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Debe seleccionar al menos un parametro!";
                    lblSuccess.CssClass = "alert alert-warning";
                }
            }
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

        protected void btnSeleccHabito_Click(object sender, EventArgs e)
        {

            //List<BE.TipoHabito> ListaTemporalHabitos = new List<BE.TipoHabito>();

            //if (Session["ListaTemporalHabitos"] != null)
            //{
            //    ListaTemporalHabitos = (List<BE.TipoHabito>)Session["ListaTemporalHabitos"];
            //}

            //if (ListaTemporalHabitos.Find(x => x.ID == ListaHabitos[listHabitos.SelectedIndex].ID) == null)
            //{
               
            //    ListaTemporalHabitos.Add(ListaHabitos[listHabitos.SelectedIndex]);
            //    Session["ListaTemporalHabitos"] = ListaTemporalHabitos;
            //}


            //listHabitosSelec.DataSource = null;
            //listHabitosSelec.DataSource = ListaTemporalHabitos;
            //listHabitosSelec.DataBind();


        }

        protected void btnQuitarParametro_Click(object sender, EventArgs e)
        {
            List<BE.Sintoma> ListaTemporalSintomas = new List<BE.Sintoma>();

            ListaTemporalSintomas = (List<BE.Sintoma>)Session["ListaTemporalSintomas"];

            if (listaParamSelect.SelectedIndex != -1)
            {

                ListaTemporalSintomas.RemoveAt(listaParamSelect.SelectedIndex);

                Session["ListaTemporalSintomas"] = ListaTemporalSintomas;
                listaParamSelect.DataSource = null;
                listaParamSelect.DataSource = ListaTemporalSintomas;
                listaParamSelect.DataBind();
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (listEnfermedades.SelectedIndex != -1)
            {
                BE.Enfermedad enf = ListaEnfermedades[listEnfermedades.SelectedIndex];
                enf.Sintomas = GestorEnfermedades.ListarSintomas(enf);
                Session["ListaTemporalSintomas"] = enf.Sintomas;
                listaParamSelect.DataSource = null;
                listaParamSelect.DataSource = enf.Sintomas;
                listaParamSelect.DataBind();
                btnGuardarEnfermedad.Visible = false;
                btnGuardarModificacion.Visible = true;
            }
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            if (listEnfermedades.SelectedIndex != -1)
            {
                GestorEnfermedades.BajaEnfermedad(ListaEnfermedades[listEnfermedades.SelectedIndex], (BE.Usuario)Session["UsuarioEnSesion"]);

                ListaEnfermedades = GestorEnfermedades.Listar();
                Session["ListaEnfermedades"] = ListaEnfermedades;
                listEnfermedades.DataSource = null;
                listEnfermedades.DataSource = ListaEnfermedades;
                listEnfermedades.DataBind();

            }
        }

        protected void btnGuardarModificacion_Click(object sender, EventArgs e)
        {

            BE.Enfermedad enf = ListaEnfermedades[listEnfermedades.SelectedIndex];

            enf.Sintomas = (List<BE.Sintoma>)Session["ListaTemporalSintomas"];

            GestorEnfermedades.ModificacionEnfermedad(enf, (BE.Usuario)Session["UsuarioEnSesion"]);


            btnGuardarEnfermedad.Visible = true;
            btnGuardarModificacion.Visible = false; 
        }
    }
}