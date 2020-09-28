using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Pruebas
{
    public partial class Permisos : System.Web.UI.Page
    {
        
        BLL.Permiso GestorPermiso = new BLL.Permiso();

      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                Enlazar();
            }
          

        }


        public void Enlazar()
        {
           
           
            ListBox1.DataSource = (List<BE.Permiso>)Application["ListaPermisos"];
            ListBox3.DataSource = (List<BE.Permiso>)Application["ListaRoles"];
            ListBox3.DataTextField = "Nombre";
            ListBox3.DataBind();
            ListBox1.DataTextField = "Nombre";
            ListBox1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BE.Permiso per = new BE.Permiso();
            per.Nombre = TextBox1.Text;
          
            List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();
            ListaPermisos = GestorPermiso.ObtenerListaPermisos();
            Application["ListaPermisos"] = ListaPermisos;
            Response.Redirect("Permisos.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            //GestorPermiso.GuardarRol((List<BE.Permiso>)Session["ListaTemporal"], TextBox2.Text);
            List<BE.Permiso> ListaTodos = new List<BE.Permiso>();
            List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();
            List<BE.Permiso> ListaRoles = new List<BE.Permiso>();
            
            ListaPermisos = GestorPermiso.ObtenerListaPermisos();
            ListaRoles = GestorPermiso.ObtenerListaRoles();
            Application["ListaPermisos"] = ListaPermisos;
            Application["ListaRoles"] =ListaRoles;
            Response.Redirect("Permisos.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            List<BE.Permiso> ListaTemporal = new List<BE.Permiso>();

            if (Session["ListaTemporal"] != null){
                ListaTemporal = (List<BE.Permiso>)Session["ListaTemporal"];
            }
            
            
            
            List<BE.Permiso> ListaPermisos = (List<BE.Permiso>)Application["ListaPermisos"];
            ListaTemporal.Add(ListaPermisos[ListBox1.SelectedIndex]);
            Session["ListaTemporal"] = ListaTemporal;
            ListBox2.DataSource = ListaTemporal;
            ListBox2.DataTextField = "Nombre";
            ListBox2.DataBind();
        }

    }
}