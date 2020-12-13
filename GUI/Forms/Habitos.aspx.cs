using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Habitos : System.Web.UI.Page
    {
        BLL.TipoHabito GestorHabitos = new BLL.TipoHabito();
        List<BE.TipoHabito> ListaHabitos = new List<BE.TipoHabito>();
        BLL.Habito GestorHabitosUsuario = new BLL.Habito();
        List<BE.Habito> ListaHabitosUsuario = new List<BE.Habito>();
        protected void Page_Load(object sender, EventArgs e)
        {

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 2) != null)
            {
                if (!IsPostBack)
                {

                    ListaHabitos = GestorHabitos.Listar();
                    Session["ListaHabitos"] = ListaHabitos;
                  

                    ListaHabitosUsuario = GestorHabitos.ListarHabitoUsuario((BE.Usuario)Session["UsuarioEnSesion"]);
                    Session["ListaHabitosUsuario"] = ListaHabitosUsuario;
                     listHabitos.DataSource = null;
                listHabitos.DataSource = ListaHabitosUsuario;
                listHabitos.DataBind();               
                dropdownHabitos.DataSource = null;
                dropdownHabitos.DataSource = ListaHabitos;
                dropdownHabitos.DataBind();
                }


                ListaHabitos = (List<BE.TipoHabito>)Session["ListaHabitos"];
                ListaHabitosUsuario = (List<BE.Habito>)Session["ListaHabitosUsuario"];
               
            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }

            /////

           
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (ListaHabitosUsuario.Find(x => x.TipoHabito.ID == ListaHabitos[dropdownHabitos.SelectedIndex].ID) == null)
            {


                BE.Habito Hab = new BE.Habito();
                Hab.TipoHabito = ListaHabitos[dropdownHabitos.SelectedIndex];
                Hab.ValorxSemana = int.Parse(txtValor.Text);
                GestorHabitosUsuario.AltaHabitos(Hab, (BE.Usuario)Session["UsuarioEnSesion"]);
                ListaHabitosUsuario = GestorHabitos.ListarHabitoUsuario((BE.Usuario)Session["UsuarioEnSesion"]);
                Session["ListaHabitosUsuario"] = ListaHabitosUsuario;
                listHabitos.DataSource = null;
                listHabitos.DataSource = ListaHabitosUsuario;
                listHabitos.DataBind();
            }
            else
            {
                lblExisteHabito.Visible = true;
            }
        }

        protected void dropdownHabitos_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (listHabitos.SelectedIndex != -1)
            {
                BE.Habito HabSelec = ListaHabitosUsuario[listHabitos.SelectedIndex];
                txtValor.Text = HabSelec.ValorxSemana.ToString();
                btnAgregar.Visible = false;
                dropdownHabitos.Visible = false;
                btnGuardar.Visible = true;
                listHabitos.Enabled = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (listHabitos.SelectedIndex != -1)
            {
                if (Page.IsValid)
                {
                    BE.Habito habmod = new BE.Habito();

                    BE.Habito hab = ListaHabitosUsuario[listHabitos.SelectedIndex];
                    habmod = hab;
                    habmod.ValorxSemana = int.Parse(txtValor.Text);

                    GestorHabitosUsuario.ModificarHabitos(habmod, (BE.Usuario)Session["UsuarioEnSesion"]);
                    Session["ListaHabitosUsuario"] = ListaHabitosUsuario;
                    listHabitos.DataSource = null;
                    listHabitos.DataSource = ListaHabitosUsuario;
                    listHabitos.DataBind();
                    btnGuardar.Visible = false;
                    btnAgregar.Visible = true;
                    dropdownHabitos.Visible = true;
                    listHabitos.Enabled = true;
                }
            }
        }
    }
}