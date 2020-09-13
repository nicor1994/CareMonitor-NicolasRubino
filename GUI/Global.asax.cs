using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace GUI
{
    public class Global : HttpApplication
    {

        BLL.Permiso GestorPermiso = new BLL.Permiso();
        List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();

        List<BE.Permiso> ListaRoles = new List<BE.Permiso>();
        List<BE.Permiso> ListaTodo = new List<BE.Permiso>();
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            ListaTodo = GestorPermiso.ListarPermisos();
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
            List<int> IdsUsuariosEnSesion = new List<int>();
            Application["UsuariosEnSesion"] = IdsUsuariosEnSesion;

        }
    }
}
