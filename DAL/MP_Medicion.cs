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
                if ((int)linea["Borrado"] == 0)
                {


                    hab.ID = (int)linea["ID"];
                    hab.Nombre = (string)linea["Nombre"];
                    hab.EfectoNegativo = (string)linea["EfectoNegativo"];
                    hab.EfectoPositivo = (string)linea["EfectoPositivo"];
                    hab.ValorPositivo = (int)linea["ValorPositivo"];
                    hab.ValorNegativo = (int)linea["ValorNegativo"];



                }



            }
            return hab;

        }



    }
}
