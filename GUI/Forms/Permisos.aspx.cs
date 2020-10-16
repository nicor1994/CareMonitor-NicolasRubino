using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Permisos : System.Web.UI.Page
    {
        BLL.Permiso GestorPermiso = new BLL.Permiso();
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Enlazar();
            }
        }

        public void Enlazar()
        {

            listPermisos.DataSource = (List<BE.Permiso>)Application["ListaPermisos"];
            listRoles.DataSource = (List<BE.Permiso>)Application["ListaRoles"];
            listUsu.DataSource = GestorUsuario.ListarTodosBorrados();
            listPermisos.DataTextField = "Nombre";
            listPermisos.DataBind();
            listRoles.DataTextField = "Nombre";
            listRoles.DataBind();
            listUsu.DataBind();

            listRoles2.DataSource = (List<BE.Permiso>)Application["ListaRoles"];
            listRoles2.DataTextField = "Nombre";
            listRoles2.DataBind();
        }

        protected void btnAgregarPermiso_Click(object sender, EventArgs e)
        {

        //    if (string.IsNullOrWhiteSpace(txtNombre.Text) == false)
        //    {
        //        BE.Permiso per = new BE.Permiso();
        //        per.Nombre = txtNombre.Text;
        //        if (GestorPermiso.CrearPermiso(per, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
        //        {
        //            lblSuccess.Text = "Permiso creado!";
        //            lblSuccess.Visible = true;
        //            lblSuccess.CssClass = "alert alert-success";
        //        }
        //        else
        //        {
        //            lblSuccess.Text = "No se pudo crear el permiso!";
        //            lblSuccess.Visible = true;
        //            lblSuccess.CssClass = "alert alert-danger";
        //        }
        //        List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();
        //        ListaPermisos = GestorPermiso.ObtenerListaPermisos();
        //        Application["ListaPermisos"] = ListaPermisos;
        //        Enlazar();
        //    }
        //    else
        //    {
        //        lblSuccess.Text = "Complete los campos!";
        //        lblSuccess.Visible = true;
        //        lblSuccess.CssClass = "alert alert-warning";
        //    }
        }

        protected void btnSelecc_Click(object sender, EventArgs e)
        {


            List<BE.Permiso> ListaTemporal = new List<BE.Permiso>();


            if (Session["ListaTemporal"] != null)
            {
                ListaTemporal = (List<BE.Permiso>)Session["ListaTemporal"];
            }
            List<BE.Permiso> ListaPermisos = (List<BE.Permiso>)Application["ListaPermisos"];

            if (ListaTemporal.Find(x => x.ID == ListaPermisos[listPermisos.SelectedIndex].ID) == null)
            {



                ListaTemporal.Add(ListaPermisos[listPermisos.SelectedIndex]);
                Session["ListaTemporal"] = ListaTemporal;
                listaTemp.DataSource = ListaTemporal;
                listaTemp.DataTextField = "Nombre";
                listaTemp.DataBind();
            }
        }

        protected void btnSelectRol_Click(object sender, EventArgs e)
        {
            List<BE.Permiso> ListaTemporal = new List<BE.Permiso>();


            if (Session["ListaTemporal"] != null)
            {
                ListaTemporal = (List<BE.Permiso>)Session["ListaTemporal"];
            }

            List<BE.Permiso> ListaRoles = (List<BE.Permiso>)Application["ListaRoles"];
            List<BE.Permiso> ListaPermisosRol = GestorPermiso.ListarPermisosRol(ListaRoles[listRoles.SelectedIndex]);

            foreach (BE.Permiso per in ListaPermisosRol)
            {

                if (ListaTemporal.Find(x => x.ID == per.ID) == null)
                {


                    ListaTemporal.Add(per);


                }
            }

            Session["ListaTemporal"] = ListaTemporal;
            listaTemp.DataSource = ListaTemporal;
            listaTemp.DataTextField = "Nombre";
            listaTemp.DataBind();
        }

        protected void btnAgregarRol_Click(object sender, EventArgs e)
        {
            if ((List<BE.Permiso>)Session["ListaTemporal"] != null)
            {
                if (string.IsNullOrWhiteSpace(txtRol.Text) == false)
                {
                    GestorPermiso.GuardarRol((List<BE.Permiso>)Session["ListaTemporal"], txtRol.Text, (BE.Usuario)Session["UsuarioEnSesion"]);

                    CargarTodo();
                    listPermisos.DataSource = (List<BE.Permiso>)Application["ListaPermisos"];
                    listRoles.DataSource = (List<BE.Permiso>)Application["ListaRoles"];
                    listPermisos.DataTextField = "Nombre";
                    listPermisos.DataBind();
                    listRoles.DataTextField = "Nombre";
                    listRoles.DataBind();
                    List<BE.Usuario> lista = new List<BE.Usuario>();
                    Session["ListaTemporal"] = lista;
                    listaTemp.DataSource = null;
                    listaTemp.DataSource = lista;
                    listaTemp.DataBind();
                    listRoles2.DataSource = (List<BE.Permiso>)Application["ListaRoles"];
                    listRoles2.DataTextField = "Nombre";
                    listRoles2.DataBind();
                    Label2.Text = "Se guardo el Rol!";
                    Label2.Visible = true;
                    Label2.CssClass = "alert alert-success";

                }
                else
                {
                    Label2.Text = "Complete el nombre!";
                    Label2.Visible = true;
                    Label2.CssClass = "alert alert-warning";
                }
            }
            else
            {
                Label2.Text = "Debe seleccionar al menos un permiso!";
                Label2.Visible = true;
                Label2.CssClass = "alert alert-warning";
            }
        }

        public void CargarTodo()
        {
            List<BE.Permiso> ListaTodo = GestorPermiso.ListarPermisos();
            List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();
            List<BE.Permiso> ListaRoles = new List<BE.Permiso>();
            foreach (BE.Permiso per in ListaTodo)
            {

                if (per.ID < 100)
                {
                    ListaPermisos.Add(per);
                }
                else if (per.ID >= 100)
                {
                    ListaRoles.Add(per);
                }
                Application["ListaPermisos"] = ListaPermisos;
                Application["ListaRoles"] = ListaRoles;
            }
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            List<BE.Usuario> ListaUsu = GestorUsuario.ListarTodosBorrados();
            BE.Usuario usu = ListaUsu[listUsu.SelectedIndex];
            List<BE.Permiso> ListaRolesUsu = GestorPermiso.ListarPermisosdeUsuarios(usu);
            Session["ListaTemp2"] = ListaRolesUsu;
            listRolUsu.DataSource = ListaRolesUsu;
            listRolUsu.DataTextField = "Nombre";
            listRolUsu.DataBind();
            btnGuardarRol.Visible = true;
            btnAgregarRolUsu.Visible = true;
        }

        protected void btnGuardarRol_Click(object sender, EventArgs e)
        {
            List<BE.Usuario> ListaUsu = GestorUsuario.ListarTodosBorrados();
            BE.Usuario usu = ListaUsu[listUsu.SelectedIndex];
            GestorPermiso.GuardarRolUsuario(usu, (List<BE.Permiso>)Session["ListaTemp2"]);
            List<BE.Usuario> lista = new List<BE.Usuario>();
            Session["ListaTemp2"] = lista;
            listRolUsu.DataSource = lista;
            listRolUsu.DataBind();
            btnGuardarRol.Visible = false;
            btnAgregarRolUsu.Visible = false;
        }

        protected void btnAgregarRolUsu_Click(object sender, EventArgs e)
        {

            List<BE.Permiso> ListaRoles = (List<BE.Permiso>)Application["ListaRoles"];
            List<BE.Permiso> ListaTemp = (List<BE.Permiso>)Session["ListaTemp2"];
            BE.Permiso per = ListaRoles[listRoles2.SelectedIndex];
            if (ListaTemp.Find(x => x.ID == per.ID) == null)
            {

                ListaTemp.Add(per);
                Session["ListaTemp"] = ListaTemp;

            }
            listRolUsu.DataSource = (List<BE.Permiso>)Session["ListaTemp2"];
            listRolUsu.DataTextField = "Nombre";
            listRolUsu.DataBind();

        }
    }
}