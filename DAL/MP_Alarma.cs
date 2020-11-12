﻿using System;
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

        public List<BE.Alarma> ListarAlarmas()
        {
            List<BE.Alarma> ListaAlarma = new List<BE.Alarma>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];

            parametros[0] = acc.ArmarParametro("tabla", "Alarma", System.Data.SqlDbType.DateTime);
            DataTable Tabla = acc.Leer("ListarEntidad", null);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                BE.Alarma al = new BE.Alarma();

                al.Fecha = DateTime.Parse(linea["Fecha"].ToString());
                al.ID = int.Parse(linea["ID"].ToString());

                DAL.MP_Usuario Gestor = new MP_Usuario();
                al.Usuario = Gestor.ObtenerUsuarioID(int.Parse(linea["ID_Usuario"].ToString()));
                


            }
            return ListaAlarma;
        }

    }
}
