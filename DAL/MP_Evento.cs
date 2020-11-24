using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
   
    public class MP_Evento
    {
 Acceso acc = new Acceso();
        public int AltaEvento(BE.Evento Eve, BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[4];
            parametros[0] = acc.ArmarParametro("idusu", usu.ID, System.Data.SqlDbType.Int);
            parametros[1] = acc.ArmarParametro("titulo", Eve.Titulo, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("desc", Eve.Descripcion, System.Data.SqlDbType.VarChar);
            parametros[3] = acc.ArmarParametro("fecha", Eve.Fecha, System.Data.SqlDbType.DateTime);

            fa = acc.Escribir("Evento_Alta", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

    }
}
