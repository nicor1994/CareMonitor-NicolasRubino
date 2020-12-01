using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{
    public class MP_Bitacora
    {

        DAL.Acceso Acceso = new DAL.Acceso();
        DAL.MP_Usuario MapperUsuario = new MP_Usuario();

        public int GuardarBitacora(BE.Bitacora bita)
        {
            int fa = 0;
            Acceso.AbrirConexionBitacora();
            SqlParameter[] parametros = new SqlParameter[4];
            
            parametros[0] = Acceso.ArmarParametro("usu", bita.Usuario, SqlDbType.VarChar);
            parametros[1] = Acceso.ArmarParametro("fecha", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"), SqlDbType.DateTime);
            parametros[2] = Acceso.ArmarParametro("acc", bita.Accion, SqlDbType.VarChar);
            parametros[3] = Acceso.ArmarParametro("tipo", bita.Tipo, SqlDbType.VarChar);
            fa = Acceso.Escribir("Bitacora_Insertar", parametros);


            Acceso.CerrarConexion();

            return fa;
        }

        public List<BE.Bitacora> ListarBitacora()
        {
            List<BE.Bitacora> ListaBitacora = new List<BE.Bitacora>();
            Acceso.AbrirConexionBitacora();
            DataTable Tabla = Acceso.Leer("Bitacora_Listar", null);
            Acceso.CerrarConexion();
            GC.Collect();
            foreach (DataRow bitacorarow in Tabla.Rows)
            {
                BE.Bitacora nuevabitacora = new BE.Bitacora();

                nuevabitacora.ID = (int)bitacorarow["ID_Bitacora"];
                nuevabitacora.Fecha = (DateTime)bitacorarow["Fecha"];
                nuevabitacora.Accion = (string)bitacorarow["Accion"];
                nuevabitacora.Usuario = (string)bitacorarow["Usuario"];
                nuevabitacora.Tipo = (string)bitacorarow["Tipo"];

                ListaBitacora.Add(nuevabitacora);

            }
            return ListaBitacora;
        }

        public DataTable ListarBitacoraReporte()
        {
            
            Acceso.AbrirConexionBitacora();
            DataTable Tabla = Acceso.Leer("Bitacora_Listar", null);
            Acceso.CerrarConexion();
            GC.Collect();
           
            return Tabla;
        }

    }
}
