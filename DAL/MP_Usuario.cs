using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class MP_Usuario
    {
        Acceso acc = new Acceso();
        public BE.Usuario ObtenerUsuarioID(int id)
        {

            acc.AbrirConexion();

            SqlParameter[] parametro = new SqlParameter[2];
            parametro[0] = acc.ArmarParametro("id", id, System.Data.SqlDbType.VarChar);
            parametro[1] = acc.ArmarParametro("Tabla", "Usuario", System.Data.SqlDbType.VarChar);


            DataTable tabla = acc.Leer("ObtenerEntidadID", parametro);
            acc.CerrarConexion();
            GC.Collect();
            BE.Usuario usu = new BE.Usuario();
            foreach (DataRow linea in tabla.Rows)
            {

                usu.ID = (int)linea["ID"];
                usu.Nombre = (string)linea["Nombre"];
                usu.Apellido = (string)linea["Apellido"];
                usu.Contraseña = (string)linea["Contraseña"];
                usu.DVH = (int)linea["DVH"];
            }
            return usu;
        }

        public BE.Usuario Login(string user, string pass)
        {

            acc.AbrirConexion();

            SqlParameter[] parametro = new SqlParameter[2];
            parametro[0] = acc.ArmarParametro("dni", user, System.Data.SqlDbType.Int);
            parametro[1] = acc.ArmarParametro("pass", pass, System.Data.SqlDbType.VarChar);


            DataTable tabla = acc.Leer("Usuario_Obtener", parametro);
            acc.CerrarConexion();
            GC.Collect();
            BE.Usuario usu = new BE.Usuario();
            foreach (DataRow linea in tabla.Rows)
            {

                usu.ID = (int)linea["ID"];
                usu.Nombre = (string)linea["Nombre"];
                usu.Apellido = (string)linea["Apellido"];
                usu.Contraseña = (string)linea["Contraseña"];
                usu.DVH = (int)linea["DVH"];
            }
            return usu;
        }

        public int AgregarUsuario(BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[6];
            parametros[0] = acc.ArmarParametro("nombre", usu.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("apellido", usu.Apellido, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("dni", usu.DNI, System.Data.SqlDbType.Int);
            parametros[3] = acc.ArmarParametro("pass", usu.Contraseña, System.Data.SqlDbType.VarChar);
            parametros[4] = acc.ArmarParametro("borrado", usu.Borrado, System.Data.SqlDbType.Int);
            parametros[5] = acc.ArmarParametro("dvh", usu.DVH, System.Data.SqlDbType.VarChar);

            fa = acc.Escribir("Usuario_Agregar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }
        
        public List<BE.Usuario> ListarUsuarios()
        {
         
                List<BE.Usuario> ListaUsuario = new List<BE.Usuario>();
                acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "Usuario", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
                acc.CerrarConexion();
                GC.Collect();
                foreach (DataRow linea in Tabla.Rows)
                {
                    BE.Usuario usu = new BE.Usuario();

                usu.ID = (int)linea["ID"];
                usu.Nombre = (string)linea["Nombre"];
                usu.Apellido = (string)linea["Apellido"];
                usu.DNI = (int)linea["DNI"];
                usu.Contraseña = (string)linea["Contraseña"];
                usu.Borrado = (int)linea["Borrado"];
                usu.DVH = (int)linea["DVH"];

                ListaUsuario.Add(usu);

                }
                return ListaUsuario;
            
        }

    }
}
