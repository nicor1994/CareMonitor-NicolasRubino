using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class MP_Medicion
    {
        DAL.Acceso acc = new Acceso();

        public int AltaMedicion(BE.Medicion med, BE.Usuario Usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[4];
            parametros[0] = acc.ArmarParametro("idusu", Usu.ID, System.Data.SqlDbType.Int);
            parametros[1] = acc.ArmarParametro("idmed", med.Tipo.ID, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("valor", med.Valor, System.Data.SqlDbType.Int);
            parametros[3] = acc.ArmarParametro("fecha", med.Fecha, System.Data.SqlDbType.DateTime);

            fa = acc.Escribir("Medicion_Agregar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public List<BE.Medicion> ListarMedicionAlarma(int id)
        {

            List<BE.Medicion> ListaMedicion = new List<BE.Medicion>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("id", id, System.Data.SqlDbType.Int);

            DataTable Tabla = acc.Leer("Medicion_ListarID", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {

                ListaMedicion.Add(ListarMedicionID(int.Parse(linea["ID_Medicion"].ToString())));      
         
            }
            return ListaMedicion;

        }

        public BE.Medicion ListarMedicionID(int id)
        {
          
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("id", id, System.Data.SqlDbType.Int);
            BE.Medicion med = new BE.Medicion();
            DataTable Tabla = acc.Leer("Medicion_Listar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                med.ID = id;
                med.Valor = int.Parse(linea["Valor"].ToString());
                med.Fecha = DateTime.Parse(linea["Fecha"].ToString());

                DAL.MP_TipoMedicion mapper = new MP_TipoMedicion();
                med.Tipo = mapper.ListarTipoID(int.Parse(linea["ID_TipoMedicion"].ToString()));

            }
            return med;
        }


    }
}
