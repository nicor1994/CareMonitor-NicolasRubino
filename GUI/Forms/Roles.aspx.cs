using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Roles : System.Web.UI.Page
    {
        BLL.Permiso GestorPermiso = new BLL.Permiso();
        BLL.Usuario GestorUsuario = new BLL.Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 17) != null)
            {
                if (!IsPostBack)
                {
                    Enlazar();
                }
            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }

            ////

          
        }

        public void Enlazar()
        {
            listPermisos.DataSource = (List<BE.Permiso>)Application["ListaPermisos"];
         
            listUsu.DataSource = GestorUsuario.ListarTodosBorrados();
            listPermisos.DataTextField = "Nombre";
            listPermisos.DataBind();
           
            listUsu.DataBind();

            listRoles2.DataSource = (List<BE.Permiso>)Application["ListaRoles"];
            listRoles2.DataTextField = "Nombre";
            listRoles2.DataBind();
        }

        protected void btnGuardarRol_Click(object sender, EventArgs e)
        {
            List<BE.Usuario> ListaUsu = GestorUsuario.ListarTodosBorrados();
            BE.Usuario usu = ListaUsu[listUsu.SelectedIndex];
           GestorPermiso.GuardarRolUsuario(usu, (List<BE.Permiso>)Session["ListaTemporal"], (BE.Usuario)Session["UsuarioEnSesion"]);
            List<BE.Usuario> lista = new List<BE.Usuario>();
            Session["ListaTemp2"] = lista;
        }

        protected void btnAgregarRolUsu_Click(object sender, EventArgs e)
        {
            List<BE.Permiso> ListaTemporal = new List<BE.Permiso>();


            if (Session["ListaTemporal"] != null)
            {
                ListaTemporal = (List<BE.Permiso>)Session["ListaTemporal"];
            }

            List<BE.Permiso> ListaRoles = (List<BE.Permiso>)Application["ListaRoles"];
            List<BE.Permiso> ListaPermisosRol = GestorPermiso.ListarPermisosRol(ListaRoles[listRoles2.SelectedIndex]);

            foreach (BE.Permiso per in ListaPermisosRol)
            {

                if (ListaTemporal.Find(x => x.ID == per.ID) == null)
                {


                    ListaTemporal.Add(per);


                }
            }

            Session["ListaTemporal"] = ListaTemporal;
            listRolUsu.DataSource = ListaTemporal;
            listRolUsu.DataTextField = "Nombre";
            listRolUsu.DataBind();
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            List<BE.Usuario> ListaUsu = GestorUsuario.ListarTodosBorrados();
            BE.Usuario usu = ListaUsu[listUsu.SelectedIndex];
            List<BE.Permiso> ListaRolesUsu = GestorPermiso.ListarPermisosdeUsuarios(usu);
            Session["ListaTemporal"] = ListaRolesUsu;
            listRolUsu.DataSource = ListaRolesUsu;
            listRolUsu.DataTextField = "Nombre";
            listRolUsu.DataBind();
            btnGuardarRol.Visible = true;
            btnAgregarRolUsu.Visible = true;
        }

        protected void btnAgregarPermiso_Click(object sender, EventArgs e)
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
                listRolUsu.DataSource = ListaTemporal;
                listRolUsu.DataTextField = "Nombre";
                listRolUsu.DataBind();
            }
        }
    }
}