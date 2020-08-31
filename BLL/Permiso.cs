using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Permiso
    {

        DAL.MP_Permiso GestorPermisos = new DAL.MP_Permiso();
        public List<BE.Permiso> ListarPermisos()
        {

            List<BE.Permiso> listapermisos = GestorPermisos.ListarTodosLosPermisos();

            return listapermisos;
        }

        public string CrearPermiso(BE.Permiso per)
        {

            int fa = GestorPermisos.CrearPermiso(per);

            if (fa == -1)
            {
                return "Ocurrio un error al intentar guardar";
            }
            else
            {
                return "Salio todo bien";
            }
        }

        public string GuardarRol(List<BE.Permiso> ListaPermisos, string Nombre)
        {

            GestorPermisos.GuardarRol(Nombre);
            foreach(BE.Permiso per in ListaPermisos)
            {
                GestorPermisos.GuardarPermisoRol(per);
            }

            return "algo";
        }

        public List<BE.Permiso> ObtenerListaPermisos()
        {
                 
            

        List<BE.Permiso> listapermisos = GestorPermisos.ListarPermisos();

            return listapermisos;
        }
        public List<BE.Permiso> ObtenerListaRoles()
        {
            List<BE.Permiso> ListaRol = GestorPermisos.ListarRoles();

           
            return ListaRol;
        }

    }
}
