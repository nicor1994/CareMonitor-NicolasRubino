using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class MP_Habito
    {
        Acceso acc = new Acceso();
        public int AltaHabito(BE.Habito hab, BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = acc.ArmarParametro("idhab", hab.TipoHabito.ID, System.Data.SqlDbType.Int);
            parametros[1] = acc.ArmarParametro("valor", hab.ValorxSemana, System.Data.SqlDbType.Int);
            parametros[2] = acc.ArmarParametro("idusu", usu.ID, System.Data.SqlDbType.Int);

            fa = acc.Escribir("HabitoUsuario_Guardar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int ModificarHabito(BE.Habito hab, BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = acc.ArmarParametro("id", hab.ID, System.Data.SqlDbType.Int);
            parametros[1] = acc.ArmarParametro("valor", hab.ValorxSemana, System.Data.SqlDbType.Int);
            

            fa = acc.Escribir("HabitoUsuario_Modificar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }


    }
}
