using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI.Forms
{
    public partial class Mediciones : System.Web.UI.Page
    {
        BLL.TipoMedicion GestorParametros = new BLL.TipoMedicion();
        List<BE.TipoMedicion> ListaParametros = new List<BE.TipoMedicion>();
        BLL.Medicion GestorMediciones = new BLL.Medicion();
        BLL.Alarma GestorAlarma = new BLL.Alarma();
     
        protected void Page_Load(object sender, EventArgs e)
        {

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 1) != null)
            {
               
                if (!IsPostBack)
                {
                    Session["ListaParametrosUsu"] = null;
                    ListaParametros = GestorParametros.Listar();
                    Session["ListaParametros"] = ListaParametros;
                    dropdownParametros.DataSource = null;
                    dropdownParametros.DataSource = ListaParametros;
                    dropdownParametros.DataBind();
                    if (ListaParametros == null)
                    {
                        lblDesc.Text = ListaParametros[dropdownParametros.SelectedIndex].Descripcion;
                    }
                    }
                ListaParametros = (List<BE.TipoMedicion>)Session["ListaParametros"];
            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }

            /////

          
        
        }

        protected void dropdownParametros_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListaParametros == null)
            {
                lblDesc.Text = ListaParametros[dropdownParametros.SelectedIndex].Descripcion;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BE.Medicion MedicionUsuario = new BE.Medicion();
                MedicionUsuario.Tipo = ListaParametros[dropdownParametros.SelectedIndex];
                MedicionUsuario.Valor = int.Parse(txtValor.Text);
                MedicionUsuario.Fecha = DateTime.Now;
                List<BE.Medicion> ListaParametrosUsu = new List<BE.Medicion>();
                if (Session["ListaParametrosUsu"] != null)
                {
                    ListaParametrosUsu = (List<BE.Medicion>)Session["ListaParametrosUsu"];
                }

                if (ListaParametrosUsu.Find(x => x.Tipo.ID == ListaParametros[dropdownParametros.SelectedIndex].ID) == null)
                {


                    ListaParametrosUsu.Add(MedicionUsuario);
                    Session["ListaParametrosUsu"] = ListaParametrosUsu;
                    listParametro.DataSource = null;
                    listParametro.DataSource = ListaParametrosUsu;
                    listParametro.DataBind();
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            List<BE.Medicion> ListaParametrosUsu = new List<BE.Medicion>();
            ListaParametrosUsu = (List<BE.Medicion>)Session["ListaParametrosUsu"];
            if (ListaParametrosUsu != null)
            {
                bool fa = new bool();
                foreach (BE.Medicion med in ListaParametrosUsu)
                {
                    fa = GestorMediciones.AltaMedicion(med, (BE.Usuario)Session["UsuarioEnSesion"]);
                }
                if (fa == true)
                {
                    //Aca deberia desencadenar el metodo
                    List<BE.Enfermedad> ListaEnf = GestorMediciones.VerificarEnfermedades(ListaParametrosUsu, (BE.Usuario)Session["UsuarioEnSesion"]);

                    if (ListaEnf.Count() != 0)
                    {

                        //Aca deberia generar la alarma

                        GestorAlarma.DispararAlarma(ListaParametrosUsu, (BE.Usuario)Session["UsuarioEnSesion"]);

                        alerta.Visible = true;
                        listParametro.Visible = false;
                        btnGuardar.Visible = false;
                        btnAlarma.Visible = true;
                        cosogris.Visible = false;
                        foreach (BE.Enfermedad enf in ListaEnf)
                        {
                            string str = lblEnf.Text;
                            lblEnf.Text = str + "-" + enf.Nombre + "<br />";
                        }
                        lblEnf.Text = lblEnf.Text + "<br />";
                    }


                    lblmod.Text = "Medicion Agregada!";
                    lblmod.Visible = true;
                    lblmod.CssClass = "alert alert-success";
                }
                else
                {
                    lblmod.Text = "Ocurrio un error!";
                    lblmod.Visible = true;
                    lblmod.CssClass = "alert alert-danger";
                }
            }
        }

        protected void btnAlarma_Click(object sender, EventArgs e)
        {
            alerta.Visible = false;
            listParametro.Visible = true;
            btnGuardar.Visible = true;
            btnAlarma.Visible = false;
            cosogris.Visible = true;
        }
    }
}