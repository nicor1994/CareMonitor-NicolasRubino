using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    public class MP_Alarma
    {
        Acceso acc = new Acceso();
        public int AltaAlarma(List<BE.Medicion> Mediciones, BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[2];
            
            parametros[0] = acc.ArmarParametro("fecha", DateTime.Now, System.Data.SqlDbType.DateTime);
            parametros[1] = acc.ArmarParametro("idusu", usu.ID, System.Data.SqlDbType.Int);
            

            fa = acc.Escribir("Alarma_Alta", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int GuardarMedicion(BE.Medicion med, BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[2];

            parametros[0] = acc.ArmarParametro("fecha", med.Fecha, System.Data.SqlDbType.DateTime);
            parametros[1] = acc.ArmarParametro("idusu", usu.ID, System.Data.SqlDbType.Int);


            fa = acc.Escribir("Alarma_GuardarMedicion", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public List<BE.Bitacora> ListarBitacora()
        {
            List<BE.Bitacora> ListaBitacora = new List<BE.Bitacora>();
            acc.AbrirConexionBitacora();
            DataTable Tabla = acc.Leer("Alarmas_Listar", null);
            acc.CerrarConexion();
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

    }
}
