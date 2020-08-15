using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class Acceso
    {

        

        SqlConnection Conexion = new SqlConnection(@"Data Source=.\MSSQLSERVER ;Initial Catalog=CareMonitor ;Integrated Security=True");

        public void AbrirConexion() {
            Conexion.Open();
        }
        public void CerrarConexion()
        {
            Conexion.Close();
        }

        public static SqlCommand ArmarComando(string sp)
        {
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = sp;
            return cmd;
        }

        public static SqlParameter ArmarParametro(string nombre, object valor, SqlDbType tipo)
        {
            var prm = new SqlParameter();
            prm.Direction = ParameterDirection.Input;
            prm.ParameterName = string.Concat("@", nombre);
            prm.Value = valor;
            prm.SqlDbType = tipo;
            return prm;
        }




    }
}
