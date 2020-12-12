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

        public List<BE.Evento> Listar(BE.Usuario usu)
        {
            List<BE.Evento> ListaEventos = new List<BE.Evento>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("idusu", usu.ID, System.Data.SqlDbType.Int);
            DataTable Tabla = acc.Leer("Evento_Listar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                BE.Evento eve = new BE.Evento();

                eve.Descripcion = (string)linea["Descripcion"];
                eve.Fecha = DateTime.Parse(linea["Fecha"].ToString());
                eve.ID = int.Parse(linea["ID"].ToString());
                eve.Titulo = (string)linea["Titulo"];
                ListaEventos.Add(eve);
            }
            return ListaEventos;
        }



    }
}
