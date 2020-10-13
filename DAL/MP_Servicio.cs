using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class MP_Servicio
    {
        Acceso acc = new Acceso();

        public int AltaServicio(BE.TipoServicio serv)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = acc.ArmarParametro("nombre", serv.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("desc", serv.Descripcion, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("tiempo", serv.TiempoMedio, System.Data.SqlDbType.Int);
                  
            fa = acc.Escribir("Servicio_Agregar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int ModificarServicio(BE.TipoServicio serv)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[4];
            parametros[0] = acc.ArmarParametro("nombre", serv.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("desc", serv.Descripcion, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("tiempo", serv.TiempoMedio, System.Data.SqlDbType.Int);
            parametros[3] = acc.ArmarParametro("id", serv.ID, System.Data.SqlDbType.Int);

            fa = acc.Escribir("Servicio_Modificacion", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int BajaServicio(BE.TipoServicio serv)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("id", serv.ID, System.Data.SqlDbType.VarChar);
           
            fa = acc.Escribir("Servicio_Baja", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }


        public List<BE.TipoServicio> Listar()
        {

            List<BE.TipoServicio> ListaServicios = new List<BE.TipoServicio>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "TipoServicio", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                if ((int)linea["Borrado"] == 0)
                {
                    BE.TipoServicio serv = new BE.TipoServicio();

                    serv.ID = (int)linea["ID"];
                    serv.Nombre = (string)linea["NombreServicio"];
                    serv.Descripcion = (string)linea["Descripcion"];
                    serv.TiempoMedio = (int)linea["TiempoMedio"];

                    ListaServicios.Add(serv);
                }



            }
            return ListaServicios;

        }


    }
}
