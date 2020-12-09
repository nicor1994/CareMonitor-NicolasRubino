using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{
    public partial class SiteMaster : MasterPage
    {
        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        BLL.Permiso GestorPermiso = new BLL.Permiso();
        Traductor Traductor = new Traductor();
        protected void Page_Load(object sender, EventArgs e)
        {
            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
          
            if (usu == null)
            {
                Response.Redirect("SinPermisos.aspx");
            }
            else
            {
                //if (GestorPermiso.VerificarPermiso(usu, 104))
                //{
                CambiarIdioma(this.Controls, (BE.Lenguaje)Session["Idioma"]);
                lblBienvenido.Text = lblBienvenido.Text +" "+ usu.Nombre + " " + usu.Apellido;
               
                //}
                //else { Response.Redirect("SinPermisos.aspx"); }

                HabilitarPermisos(usu);


            }
        }

        public void CambiarIdioma(ControlCollection ListaControles, BE.Lenguaje leng )
        {
            foreach(Control ctr in ListaControles)
            {
                if (ctr.HasControls())
                {
                    CambiarIdioma(ctr.Controls, leng);
                }
                else
                {
                    Traductor.Traducir(ctr, leng);
                }
              
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
          
            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];

            List<int> ListaId = (List<int>)Application["UsuariosEnSesion"];

            ListaId.Remove(usu.ID);
            Application["UsuariosEnSesion"] = ListaId;

            BE.Bitacora bita = new BE.Bitacora();
            bita.Usuario = usu.Nombre + " " + usu.Apellido;
            bita.Tipo = "Cierre de Sesion";
            bita.Accion = "El usuario cerro la sesion";
            bita.Fecha = DateTime.Now;
            GestorBitacora.RegistrarEnBitacora(bita);         
            Session["UsuarioEnSesion"] = null;
            Response.Redirect("Login.aspx");
        }

        public void HabilitarPermisos(BE.Usuario usuario)
        {
            

            foreach (BE.Permiso per in usuario.ListaPermisos)
            {
                if (per.ID == 1)
                {
                    Mediciones.Visible = true;
                }
                if (per.ID == 2)
                {
                    Habitos.Visible = true;
                }
                if (per.ID == 3)
                {
                    Eventos.Visible = true;
                }
                if (per.ID == 4)
                {
                    Servicios.Visible = true;
                }
                if (per.ID == 5)
                {
                    GestionParametros.Visible = true;
                }
                if (per.ID == 6)
                {
                    GestionHabitos.Visible = true;
                }
                if (per.ID == 7)
                {
                    GestionServicios.Visible = true;
                }
                if (per.ID == 8)
                {
                    Alarmas.Visible = true;
                }
                if (per.ID == 9)
                {
                    Usuarios.Visible = true;
                }
                if (per.ID == 10)
                {
                    Bitacora.Visible = true;
                }
                if (per.ID == 11)
                {
                    Permisos.Visible = true;
                }
                if (per.ID == 12)
                {
                    Digito.Visible = true;
                }
                if (per.ID == 13)
                {
                    Backup.Visible = true;
                }
                if (per.ID == 14)
                {
                    
                }
                if (per.ID == 15)
                {

                }
                if (per.ID == 16)
                {

                }
                if (per.ID == 17)
                {
                    Roles.Visible = true;
                }
                if (per.ID == 1)
                {
                    GestionEnfermedades.Visible = true;
                }
                if (per.ID == 20)
                {
                    ColaServicios.Visible = true;
                }
                if (per.ID == 21)
                {
                    MedicionesUsu.Visible = true;
                }
            }


        }
      


    }
}