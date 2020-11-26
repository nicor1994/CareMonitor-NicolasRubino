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
        MP_Usuario MapperUsuario = new MP_Usuario();
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

        public BE.TipoServicio ListarTipo(int id)
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
                if ((int)linea["ID"] == id)
                {
                    BE.TipoServicio serv = new BE.TipoServicio();

                    serv.ID = (int)linea["ID"];
                    serv.Nombre = (string)linea["NombreServicio"];
                    serv.Descripcion = (string)linea["Descripcion"];
                    serv.TiempoMedio = (int)linea["TiempoMedio"];

                    return serv;

                }


            }
            return null;

        }

        public int SolicitarServicio(BE.Servicio serv)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[4];
            parametros[0] = acc.ArmarParametro("idusu", serv.Usuario.ID, System.Data.SqlDbType.Int);
            parametros[1] = acc.ArmarParametro("fechapedido", serv.FechaPedido, System.Data.SqlDbType.DateTime);
            parametros[2] = acc.ArmarParametro("fechaserv", serv.FechaServicio, System.Data.SqlDbType.DateTime);
            parametros[3] = acc.ArmarParametro("idserv", serv.TipoServicio.ID, System.Data.SqlDbType.Int);

            fa = acc.Escribir("Servicio_Solicitar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public List<BE.Servicio> ListarServicio()
        {

            List<BE.Servicio> ListaServicios = new List<BE.Servicio>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "Servicio", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
            acc.CerrarConexion();
            
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {

                BE.Servicio serv = new BE.Servicio();

                serv.ID = (int)linea["ID"];
                serv.FechaPedido = (DateTime)linea["FechaPedido"];
                serv.FechaServicio = (DateTime)linea["FechaServicio"];
                serv.TipoServicio = new BE.TipoServicio();
                serv.TipoServicio = ListarTipo((int)linea["ID_TipoServicio"]);
                serv.Usuario = MapperUsuario.ObtenerUsuarioID((int)linea["ID_Usuario"]);
                ListaServicios.Add(serv);
               



            }
            return ListaServicios;

        }

        public int CerrarServicio(BE.Servicio serv, int tiempo)
        {
            
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = acc.ArmarParametro("idserv", serv.ID, System.Data.SqlDbType.Int);
            parametros[1] = acc.ArmarParametro("fechacierre", DateTime.Now.ToString(), System.Data.SqlDbType.DateTime); ;
            parametros[2] = acc.ArmarParametro("Tiempo", tiempo, System.Data.SqlDbType.Int);
           

            fa = acc.Escribir("Servicio_Cerrar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

    }
}
