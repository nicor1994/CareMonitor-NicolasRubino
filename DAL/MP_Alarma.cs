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
            SqlParameter[] parametros = new SqlParameter[5];
            parametros[0] = acc.ArmarParametro("id", hab.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("fecha", DateTime.Now, System.Data.SqlDbType.Int);
            parametros[2] = acc.ArmarParametro("idusu", usu.ID, System.Data.SqlDbType.Int);
            

            fa = acc.Escribir("Habito_Guardar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }


    }
}
