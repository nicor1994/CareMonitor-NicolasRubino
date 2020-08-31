using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL.Tecnologia
{
   public class Permiso
    {

        DAL.MP_Permiso GestorPermisos = new DAL.MP_Permiso();

        public List<BE.Permiso> ListarPermisosdeUsuarios(BE.Usuario usu)
        {
            List<BE.Permiso> listapermisos = new List<BE.Permiso>();
            listapermisos = GestorPermisos.ListarPermisos(usu.ID);
           
            return listapermisos;
        }

    }
}
