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

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 9) != null)
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
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }

           

           

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblSuccess.Visible = false;
                BE.Usuario usu = new BE.Usuario();
                usu.Nombre = txtNombre.Text;
                usu.Apellido = txtApellido.Text;
                usu.DNI = int.Parse(txtDni.Text);
                usu.Contraseña = Seguridad.Encriptador.Encrypt(usu.DNI.ToString() + usu.Nombre.ToLower());
                usu.Direccion = txtDireccion.Text;
                usu.FechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                if (GestorUsuario.ComprobarDNI(usu.DNI) == false) {
                    if ((GestorUsuario.RegistrarUsuario(usu, (BE.Usuario)Session["UsuarioEnSesion"])) == true)
                    {

                        GestorUsuario.RecalcularDVV((BE.Usuario)Session["UsuarioEnSesion"]);

                        lblSuccess.Visible = true;

                        listausu = GestorUsuario.ListarTodosBorrados();
                        Session["ListaUsu"] = listausu;
                        listUsuarios.DataSource = null;
                        listUsuarios.DataSource = listausu;
                        listUsuarios.DataBind();
                    }
                  
                } 
                else
                {
                     lblSuccess.Visible = true;
                     lblSuccess.Text = "Ya existe un usuario con el Nº de DNI";
                     lblSuccess.CssClass = "alert alert-warning";
                }
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (listUsuarios.SelectedIndex != -1)
            {
                BE.Usuario usu = listausu[listUsuarios.SelectedIndex];

                if (usu.DNI != 1)
                {

                    txtApellido.Text = usu.Apellido;


                    txtDireccion.Text = usu.Direccion;

                    txtDni.Text = usu.DNI.ToString();


                    txtNombre.Text = usu.Nombre;

                    btnMod.Visible = true;
                    btnAceptar.Visible = false;
                    txtFechaNac.Text = usu.FechaNacimiento.ToString("yyyy-MM-dd");
                }
                else
                {
                    lblmod.Visible = true;
                    lblmod.Text = "No se puede modificar al Administrador";
                    lblmod.CssClass = "alert alert-danger";
                }
            }
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (listUsuarios.SelectedIndex != -1)
                {
                    BE.Usuario usu = new BE.Usuario();
                    usu.ID = listausu[listUsuarios.SelectedIndex].ID;
                    usu.Contraseña = listausu[listUsuarios.SelectedIndex].Contraseña;
                    usu.Nombre = txtNombre.Text;
                    usu.Apellido = txtApellido.Text;
                    usu.DNI = int.Parse(txtDni.Text);
                    usu.FechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                    usu.Direccion = txtDireccion.Text;

                    if (GestorUsuario.ModificarUsuario(usu, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
                    {


                        lblsuccess2.Text = "Se modifico el usuario!";
                        lblsuccess2.Visible = true;
                        lblsuccess2.CssClass = "alert alert-success";
                        listausu = GestorUsuario.ListarTodosBorrados();
                        Session["ListaUsu"] = listausu;
                        listUsuarios.DataSource = null;
                        listUsuarios.DataSource = listausu;
                        listUsuarios.DataBind();

                        txtApellido.Text = "";
                        txtDireccion.Text = "";
                        txtDni.Text = "";
                        txtFechaNac.Text = "";
                        txtNombre.Text = "";

                        btnMod.Visible = false;
                        btnAceptar.Visible = true;

                    }
                    else
                    {
                        lblSuccess.Text = "Ocurrio un error!";
                        lblSuccess.Visible = true;
                        lblSuccess.CssClass = "alert alert-danger";
                    }
                }
            }
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            if (listUsuarios.SelectedIndex != -1)
            {
                BE.Usuario usu = listausu[listUsuarios.SelectedIndex];
                int f = new int();
                if (usu.DNI != 1)
                {
                    if (usu.ListaPermisos.Find(x => x.ID == 104) == null)
                    {



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
                else
                {
                    lblmod.Visible = true;
                    lblmod.Text = "No se puede dar de baja al Administrador!";
                    lblmod.CssClass = "alert alert-danger";
                }
            }

        }

        protected void btnrestore_Click(object sender, EventArgs e)
        {
            if (listUsuarios.SelectedIndex != -1)
            {
                BE.Usuario usu = listausu[listUsuarios.SelectedIndex];
                if (usu.DNI != 1)
                {
                    usu.Contraseña = Seguridad.Encriptador.Encrypt(usu.DNI.ToString() + usu.Nombre.ToLower());
                    if (GestorUsuario.ReestablecerContraseña(usu, (BE.Usuario)Session["UsuarioEnSesion"]) == true)
                    {
                        GestorUsuario.RecalcularDVV((BE.Usuario)Session["UsuarioEnSesion"]);
                        lblmod.Text = "Se reestablecio la contraseña del usuario";
                        lblmod.Visible = true;
                        lblmod.CssClass = "alert alert-success";
                    }
                }
                else
                {
                    lblmod.Visible = true;
                    lblmod.Text = "No se puede reestablecer al Administrador";
                    lblmod.CssClass = "alert alert-danger";
                }
            }
        }
    }
}