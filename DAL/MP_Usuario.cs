using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

            }
            return usu;
        }

        public BE.Usuario Login(string user, string pass)
        {

            acc.AbrirConexion();

            SqlParameter[] parametro = new SqlParameter[2];
            parametro[0] = acc.ArmarParametro("usu", user, System.Data.SqlDbType.VarChar);
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

            }
            return usu;
        }

    }
}
