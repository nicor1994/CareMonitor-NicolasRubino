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
            parametros[3] = acc.ArmarParametro("fecha", DateTime.Now, System.Data.SqlDbType.DateTime);

            fa = acc.Escribir("Medicion_Agregar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }


    }
}
