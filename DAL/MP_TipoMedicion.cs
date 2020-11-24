using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
   public class MP_TipoMedicion
    {
        DAL.Acceso acc = new Acceso();
        public int AltaParametro(BE.TipoMedicion param)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[8];
            parametros[0] = acc.ArmarParametro("nombre", param.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("desc", param.Descripcion, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("descmax", param.DescripcionMaxima, System.Data.SqlDbType.VarChar);
            parametros[3] = acc.ArmarParametro("descmin", param.DescripcionMinima, System.Data.SqlDbType.VarChar);
            parametros[4] = acc.ArmarParametro("maxmasc", param.MaximoMasculino, System.Data.SqlDbType.Int);
            parametros[5] = acc.ArmarParametro("maxfem", param.MaximoFemenino, System.Data.SqlDbType.Int);
            parametros[6] = acc.ArmarParametro("minmasc", param.MinimoMasculino, System.Data.SqlDbType.Int);
            parametros[7] = acc.ArmarParametro("minfem", param.MinimoFemenino, System.Data.SqlDbType.Int);

            fa = acc.Escribir("Parametro_Agregar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public List<BE.TipoMedicion> Listar()
        {

            List<BE.TipoMedicion> ListaParametros = new List<BE.TipoMedicion>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "TipoMedicion", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                if ((int)linea["Borrado"] == 0)
                {
                    BE.TipoMedicion param = new BE.TipoMedicion();

                    param.ID = (int)linea["ID"];
                    param.Nombre = (string)linea["Nombre"];
                    param.Descripcion = (string)linea["Descripcion"];
                    param.DescripcionMaxima = (string)linea["DescripcionMaxima"];
                    param.DescripcionMinima = (string)linea["DescripcionMinima"];
                    param.MaximoFemenino = int.Parse(linea["MaximoFemenino"].ToString());
                    param.MaximoMasculino = int.Parse(linea["MaximoMasculino"].ToString());
                    param.MinimoFemenino = int.Parse(linea["MinimoFemenino"].ToString());
                    param.MinimoMasculino = int.Parse(linea["MinimoMasculino"].ToString());


                    
                    ListaParametros.Add(param);
                }



            }
            return ListaParametros;

        }
        public int ModificarParametro(BE.TipoMedicion param)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[9];
            parametros[0] = acc.ArmarParametro("nombre", param.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("desc", param.Descripcion, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("descmax", param.DescripcionMaxima, System.Data.SqlDbType.VarChar);
            parametros[3] = acc.ArmarParametro("descmin", param.DescripcionMinima, System.Data.SqlDbType.VarChar);
            parametros[4] = acc.ArmarParametro("maxmasc", param.MaximoMasculino, System.Data.SqlDbType.Int);
            parametros[5] = acc.ArmarParametro("maxfem", param.MaximoFemenino, System.Data.SqlDbType.Int);
            parametros[6] = acc.ArmarParametro("minmasc", param.MinimoMasculino, System.Data.SqlDbType.Int);
            parametros[7] = acc.ArmarParametro("minfem", param.MinimoFemenino, System.Data.SqlDbType.Int);
            parametros[8] = acc.ArmarParametro("id", param.ID, System.Data.SqlDbType.Int);
            fa = acc.Escribir("Parametro_Modificar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int Baja(BE.TipoMedicion param)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("id", param.ID, System.Data.SqlDbType.VarChar);

            fa = acc.Escribir("Parametro_Baja", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public BE.TipoMedicion ListarTipoID(int id)
        {

            BE.TipoMedicion Tipo = new BE.TipoMedicion();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("id", id, System.Data.SqlDbType.Int);

            DataTable Tabla = acc.Leer("Medicion_ListarTipo", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                Tipo.ID = id;
                Tipo.Nombre = (string)linea["Nombre"];
                Tipo.Descripcion = (string)linea["Descripcion"];
                Tipo.DescripcionMaxima = (string)linea["DescripcionMaxima"];
                Tipo.DescripcionMinima = (string)linea["DescripcionMinima"];
                Tipo.MaximoMasculino = int.Parse(linea["MaximoMasculino"].ToString());
                Tipo.MaximoFemenino = int.Parse(linea["MaximoMasculino"].ToString());
                Tipo.MinimoMasculino = int.Parse(linea["MinimoMasculino"].ToString());
                Tipo.MinimoFemenino = int.Parse(linea["MinimoFemenino"].ToString());

            }
            return Tipo;

        }

    }
}
