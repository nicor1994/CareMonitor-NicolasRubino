using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class MP_Permiso
    {
        Acceso Acc = new Acceso();
        public List<BE.Permiso> ListarPermisos(int id)
        {
            List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = Acc.ArmarParametro("id", id, SqlDbType.Int);
            Acc.AbrirConexion();
            DataTable tabla = Acc.Leer("Usuario_ObtenerPermisos", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {
                BE.Permiso per = new BE.Permiso();

                per = ListarRolUsu((int)linea["ID_Rol"]);

                ListaPermisos.Add(per);

            }

            return ListaPermisos;
        }

        public List<BE.Permiso> ListarRol(int id)
        {
            List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = Acc.ArmarParametro("id", id, SqlDbType.Int);
            Acc.AbrirConexion();
            DataTable tabla = Acc.Leer("Rol_ObtenerPermisos", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {
                BE.Permiso per = new BE.Permiso();
                per.ID = (int)linea["ID_Permiso"];
                ListaPermisos.Add(per);
            }
            return ListaPermisos;
        }

        public BE.Permiso ListarRolUsu(int id)
        {
            BE.Permiso per = new BE.Permiso();
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = Acc.ArmarParametro("id", id, SqlDbType.Int);
            parametros[1] = Acc.ArmarParametro("tabla", "Permiso", SqlDbType.VarChar);
            Acc.AbrirConexion();
            DataTable tabla = Acc.Leer("ObtenerEntidadID", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {
              
                per.ID = (int)linea["ID"];
                per.Nombre = (string)linea["Nombre"];
                
            }
            return per;
        }

        public List<BE.Permiso> ListarTodosLosPermisos()
        {
            List<BE.Permiso> listapermisos = new List<BE.Permiso>();
            Acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = Acc.ArmarParametro("Tabla", "Permiso", SqlDbType.VarChar);
            DataTable tabla = Acc.Leer("ListarEntidad", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {

                BE.Permiso per = new BE.Permiso();

                per.ID = (int)linea["ID"];
                per.Nombre = (string)linea["Nombre"];

                listapermisos.Add(per);
            }
            return listapermisos;
        }

        public int CrearPermiso(BE.Permiso per)
        {

            int fa = 0;

            SqlParameter[] parametros = new SqlParameter[1];

            parametros[0] = Acc.ArmarParametro("nombre", per.Nombre, SqlDbType.VarChar);
            Acc.AbrirConexion();
            fa = Acc.Escribir("Permiso_Insertar", parametros);
            Acc.CerrarConexion();


            GC.Collect();
            return fa;

        }

        public int GuardarRol(string nombre)
        {

            int fa = 0;

            SqlParameter[] parametros = new SqlParameter[1];

            parametros[0] = Acc.ArmarParametro("nombre", nombre, SqlDbType.VarChar);
            Acc.AbrirConexion();
            fa = Acc.Escribir("Rol_Insertar", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            return fa;

        }

        public int GuardarRolUsuario(BE.Usuario usu, BE.Permiso rol)
        {

            int fa = 0;

            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = Acc.ArmarParametro("idusu", usu.ID, SqlDbType.Int);
            parametros[1] = Acc.ArmarParametro("idrol", rol.ID, SqlDbType.Int);
            Acc.AbrirConexion();
            fa = Acc.Escribir("Usuario_GuardarRol", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            return fa;

        }

        public int GuardarPermisoRol(BE.Permiso per)
        {

            int fa = 0;

            SqlParameter[] parametros = new SqlParameter[1];

            parametros[0] = Acc.ArmarParametro("idper", per.ID, SqlDbType.Int);
            Acc.AbrirConexion();
            fa = Acc.Escribir("Rol_GuardarPermiso", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            return fa;

        }
        public List<BE.Permiso> ListarPermisos()
        {
            List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();
           
            Acc.AbrirConexion();
            DataTable tabla = Acc.Leer("Permiso_Listar");
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {
                BE.Permiso per = new BE.Permiso();

                per.ID = (int)linea["ID"];
                per.Nombre = (string)linea["Nombre"];
                ListaPermisos.Add(per);
            }

            return ListaPermisos;
        }
        public List<BE.Permiso> ListarRoles()
        {
            List<BE.Permiso> ListaRoles = new List<BE.Permiso>();

            Acc.AbrirConexion();
            DataTable tabla = Acc.Leer("Rol_Listar");
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {
                BE.Permiso per = new BE.Permiso();

                per.ID = (int)linea["ID"];
                per.Nombre = (string)linea["Nombre"];
                ListaRoles.Add(per);
            }

            return ListaRoles;
        }

        public BE.Permiso BuscarPermiso(int ID)
        {
           
            BE.Permiso per = new BE.Permiso();
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = Acc.ArmarParametro("tabla","Permiso", SqlDbType.VarChar);
            parametros[1] = Acc.ArmarParametro("id", ID, SqlDbType.Int);
            Acc.AbrirConexion();
            DataTable tabla = Acc.Leer("ObtenerEntidadID", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {                
                per.ID = (int)linea["ID"];
                per.Nombre = (string)linea["Nombre"];
            }

            return per;
        }

        public List<BE.Permiso> ListarPermisosRoles(BE.Permiso Rol)
        {
            List<BE.Permiso> ListaPermisos = new List<BE.Permiso>();

            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = Acc.ArmarParametro("id", Rol.ID, SqlDbType.Int);

            Acc.AbrirConexion();
            DataTable tabla = Acc.Leer("Rol_ObtenerPermisos", parametros);
            Acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in tabla.Rows)
            {
                BE.Permiso per = new BE.Permiso();
                
                per =  BuscarPermiso((int)linea["ID_Permiso"]);
                ListaPermisos.Add(per);
            }

            return ListaPermisos;
        }

    }
}
