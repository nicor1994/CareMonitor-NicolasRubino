using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Usuarios : System.Web.UI.Page
    {
        BLL.Usuario GestorUsuario = new BLL.Usuario();

        List<BE.Usuario> listausu = new List<BE.Usuario>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                listausu = GestorUsuario.ListarTodosBorrados();
                Session["ListaUsu"] = listausu;
                listUsuarios.DataSource = null;
                listUsuarios.DataSource = listausu;
                listUsuarios.DataBind();
            }

            listausu = (List<BE.Usuario>)Session["ListaUsu"];

           

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            BE.Usuario usu = new BE.Usuario();
            usu.Nombre = txtNombre.Text;
            usu.Apellido = txtApellido.Text;
            usu.DNI = int.Parse(txtDni.Text);          
            usu.Contraseña = Seguridad.Encriptador.Encrypt(usu.DNI.ToString() + usu.Nombre.ToLower());
            usu.Direccion = txtDireccion.Text;
            usu.FechaNacimiento = DateTime.Parse(txtFechaNac.Text);
            if ((GestorUsuario.RegistrarUsuario(usu, (BE.Usuario)Session["UsuarioEnSesion"])) == true){
                lblSuccess.Visible = true;

                listausu = GestorUsuario.ListarTodosBorrados();
                Session["ListaUsu"] = listausu;
                listUsuarios.DataSource = null;
                listUsuarios.DataSource = listausu;
                listUsuarios.DataBind();
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            BE.Usuario usu = listausu[listUsuarios.SelectedIndex];

            txtapemod.Text = usu.Apellido;
            txtapemod.Visible = true;
            txtdireccionmod.Text = usu.Direccion;
            txtdireccionmod.Visible = true;
            txtdnimod.Text = usu.DNI.ToString();
            txtdnimod.Visible = true;
            txtnombremod.Text = usu.Nombre;
            txtnombremod.Visible = true;
            btnMod.Visible = true;
            txtfechamod.Text = usu.FechaNacimiento.ToString("yyyy-MM-dd");
            txtfechamod.Visible = true;
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            BE.Usuario usu = new BE.Usuario();
            usu.ID = listausu[listUsuarios.SelectedIndex].ID;
            usu.Contraseña = listausu[listUsuarios.SelectedIndex].Contraseña;
            usu.Nombre = txtnombremod.Text;
            usu.Apellido = txtapemod.Text;
            usu.DNI = int.Parse(txtdnimod.Text);
            usu.FechaNacimiento = DateTime.Parse(txtfechamod.Text);
            usu.Direccion = txtdireccionmod.Text;

           if(GestorUsuario.ModificarUsuario(usu, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {
                

                lblsuccess2.Text = "Se modifico el usuario!";
                lblsuccess2.Visible = true;
                lblsuccess2.CssClass = "alert alert-success";
                listausu = GestorUsuario.ListarTodosBorrados();
                Session["ListaUsu"] = listausu;
                listUsuarios.DataSource = null;
                listUsuarios.DataSource = listausu;
                listUsuarios.DataBind();

               
                txtapemod.Visible = false;
               
                txtdireccionmod.Visible = false;
              
                txtdnimod.Visible = false;
                txtfechamod.Visible = false;
                txtnombremod.Visible = false;
                btnMod.Visible = false;
               

            }
            else
            {
                lblSuccess.Text = "Ocurrio un error!";
                lblSuccess.Visible = true;
                lblSuccess.CssClass = "alert alert-danger";
            }

        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            BE.Usuario usu = listausu[listUsuarios.SelectedIndex];
            int f = new int();
           
               if (usu.ListaPermisos.Find(x => x.ID == 104) == null){



                int fa = GestorUsuario.BajaUsuario(usu, (BE.Usuario)Session["UsuarioEnSesion"]);
                if (fa != -1)
                {
                    lblmod.Visible = true;
                    lblmod.Text = "Se dio de baja correctamente el usuario";
                    lblmod.CssClass = "alert alert-success";
                    listausu = GestorUsuario.ListarTodosBorrados();
                    Session["ListaUsu"] = listausu;
                    listUsuarios.DataSource = null;
                    listUsuarios.DataSource = listausu;
                    listUsuarios.DataBind();
                }
                else
                {
                    lblmod.Visible = true;
                    lblmod.Text = "Ocurrio un error al dar de baja";
                    lblmod.CssClass = "alert alert-danger";
                }
                }
            else
            {
                lblmod.Visible = true;
                lblmod.Text = "No se puede dar de baja un administrador!";
                lblmod.CssClass = "alert alert-warning";
            }
            

        }

        protected void btnrestore_Click(object sender, EventArgs e)
        {
            BE.Usuario usu = listausu[listUsuarios.SelectedIndex];
            usu.Contraseña = Seguridad.Encriptador.Encrypt(usu.DNI.ToString() + usu.Nombre.ToLower());
            if (GestorUsuario.ReestablecerContraseña(usu, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
            {
                lblmod.Text = "Se reestablecio la contraseña del usuario";
                lblmod.Visible = true;
                lblmod.CssClass = "alert alert-success";
            }
        }
    }
}