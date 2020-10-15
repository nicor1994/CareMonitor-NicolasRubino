﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class MP_TipoHabito
    {
        Acceso acc = new Acceso();

        public int AltaHabito(BE.TipoHabito hab)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[5];
            parametros[0] = acc.ArmarParametro("nom", hab.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("valorneg", hab.ValorNegativo, System.Data.SqlDbType.Int);
            parametros[2] = acc.ArmarParametro("valorpos",hab.ValorPositivo, System.Data.SqlDbType.Int);
            parametros[3] = acc.ArmarParametro("efeneg", hab.EfectoNegativo, System.Data.SqlDbType.VarChar);
            parametros[4] = acc.ArmarParametro("efepos", hab.EfectoPositivo, System.Data.SqlDbType.VarChar);
           
            fa = acc.Escribir("Habito_Guardar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public List<BE.TipoHabito> Listar()
        {

            List<BE.TipoHabito> ListaHabitos = new List<BE.TipoHabito>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "Tipo_Habito", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                if ((int)linea["Borrado"] == 0)
                {
                    BE.TipoHabito hab = new BE.TipoHabito();

                    hab.ID = (int)linea["ID"];
                    hab.Nombre = (string)linea["Nombre"];
                    hab.EfectoNegativo = (string)linea["EfectoNegativo"];
                    hab.EfectoPositivo = (string)linea["EfectoPositivo"];
                    hab.ValorPositivo = (int)linea["ValorPositivo"];
                    hab.ValorNegativo = (int)linea["ValorNegativo"];


                    ListaHabitos.Add(hab);
                }



            }
            return ListaHabitos;

        }



    }
}
