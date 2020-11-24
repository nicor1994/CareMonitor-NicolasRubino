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

        public bool CrearPermiso(BE.Permiso per, BE.Usuario usu)
        {

            int fa = GestorPermisos.CrearPermiso(per);

            if (fa == -1)
            {
                return false;
            }
            else
            {

                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usu.Nombre + " " + usu.Apellido;
                bita.Tipo = "Gestion Permisos";
                bita.Accion = "Se dio de alta el permiso " + per.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);

                return true;
            }
        }

        public string GuardarRol(List<BE.Permiso> ListaPermisos, string Nombre, BE.Usuario usu)
        {

            GestorPermisos.GuardarRol(Nombre);
            foreach(BE.Permiso per in ListaPermisos)
            {
                GestorPermisos.GuardarPermisoRol(per);
            }

            BLL.Bitacora GestorBitacora = new BLL.Bitacora();

            BE.Bitacora bita = new BE.Bitacora();
            bita.Usuario = usu.Nombre + " " + usu.Apellido;
            bita.Tipo = "Gestion Permisos";
            bita.Accion = "Se dio de alta el rol " + Nombre;
            bita.Fecha = DateTime.Now;
            GestorBitacora.RegistrarEnBitacora(bita);

            

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

        public List<BE.Permiso> ListarPermisosdeUsuarios(BE.Usuario usu)
        {
            List<BE.Permiso> listapermisos = new List<BE.Permiso>();
            listapermisos = GestorPermisos.ListarPermisos(usu.ID);

            return listapermisos;
        }

        public List<BE.Permiso> ListarPermisosRol(BE.Permiso rol)
        {

            List<BE.Permiso> ListaPermisos = GestorPermisos.ListarPermisosRoles(rol);
            

            return ListaPermisos;
        }

        public int GuardarRolUsuario(BE.Usuario usu, List<BE.Permiso> roles, BE.Usuario usubit)
        {
            int fa = new int();
            GestorPermisos.BorrarPermisosUsuarios(usu.ID);
            foreach (BE.Permiso per in roles)
            {
              fa  = GestorPermisos.GuardarRolUsuario(usu, per);
                if (fa != -1)
                {
                    BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                    BE.Bitacora bita = new BE.Bitacora();
                    bita.Usuario = usubit.Nombre + " " + usubit.Apellido;
                    bita.Tipo = "Gestion Permisos";
                    bita.Accion = "Se le asignó el permiso " + per.Nombre + " al usuario " + usu.Nombre + " " + usu.Apellido;
                    bita.Fecha = DateTime.Now;
                    GestorBitacora.RegistrarEnBitacora(bita);
                }
            }
           
            return fa;
        }

        public bool VerificarPermiso(BE.Usuario usu, int id)
        {
            List<BE.Permiso> roles = this.ListarPermisosdeUsuarios(usu);
            foreach (BE.Permiso per in roles)
            {
                if(per.ID == id)
                {
                    return true;
                }
            }
            return false;
        }
        public string RedireccionarLogin(BE.Usuario usu)
        {
            if (usu != null){

                return "VistaTecnologia.aspx";

             
            }
            return "Login.aspx";
        }

    }
}
