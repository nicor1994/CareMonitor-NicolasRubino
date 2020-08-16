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

        

        SqlConnection Conexion = new SqlConnection();
        private SqlTransaction tx;

        public void AbrirConexion() {
            Conexion.ConnectionString = @"Data Source=.\MSSQLSERVER ; Initial Catalog= CareMonitor ; Integrated Security= True";
            Conexion.Open();
        }

        public void AbrirConexionBitacora()
        {
            Conexion.ConnectionString = @"Data Source=DESKTOP-UGU0FER;Initial Catalog=CareMonitorBitacora;Integrated Security= True";
            Conexion.Open();
        }
        public void CerrarConexion()
        {
            Conexion.Close();
        }

        public void IniciarTx()
        {
            tx = Conexion.BeginTransaction();
        }

        public void Confirmar()
        {
            tx.Commit();
            tx = null;
        }

        private SqlCommand CrearComando(string sp, SqlParameter[] parametros)
        {
            SqlCommand cmd = new SqlCommand(sp, Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            if (tx != null)
            {
                cmd.Transaction = tx;
            }
            if (parametros != null)
            {
                cmd.Parameters.AddRange(parametros);
            }
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

        public DataTable Leer(string sp, SqlParameter[] parametros)
        {
            DataTable Tabla = new DataTable();
            SqlDataAdapter adaptador = new SqlDataAdapter();
            adaptador.SelectCommand = CrearComando(sp, parametros);
            adaptador.Fill(Tabla);
            adaptador.Dispose();
            return Tabla;
        }

        public int Escribir(string sp, SqlParameter[] parametros)
        {
            SqlCommand cmd = CrearComando(sp, parametros);
            int fa = 0;
            try
            {
                fa = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            { fa = -1; }

            return fa;
        }


    }
}
