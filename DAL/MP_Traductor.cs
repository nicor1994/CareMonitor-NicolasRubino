using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class MP_Traductor
    {
        Acceso acc = new Acceso();
        public BE.Lenguaje Listar(BE.Lenguaje leng)
        {

            List<BE.Etiqueta> ListaEti = new List<BE.Etiqueta>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("ididioma", leng.ID, System.Data.SqlDbType.Int);

            DataTable Tabla = acc.Leer("Listar_Traduccion", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {

                BE.Etiqueta eti = new BE.Etiqueta();

                eti.NombreControl = linea["NombreControl"].ToString();
                eti.Traduccion = linea["Traduccion"].ToString();
                ListaEti.Add(eti);
                
            }

            leng.ListaEtiquetas = ListaEti;
            return leng;
        }

        public List<BE.Lenguaje> Listar()
        {

            List<BE.Lenguaje> ListaLeng = new List<BE.Lenguaje>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "Idioma", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {

                BE.Lenguaje leng = new BE.Lenguaje();

                leng.ID = int.Parse(linea["ID"].ToString());
                leng.Nombre = (string)linea["NombreIdioma"];

                ListaLeng.Add(leng);

            }

            
            return ListaLeng;
        }

        public int CrearIdioma(string Nombre)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("nombre", Nombre, System.Data.SqlDbType.VarChar);
            

            fa = acc.Escribir("Idioma_Agregar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int GuardarEtiqueta(BE.Etiqueta eti)
         {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = acc.ArmarParametro("nombrecontrol", eti.NombreControl, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("traduccion", eti.Traduccion, SqlDbType.VarChar);


            fa = acc.Escribir("Idioma_AgregarEtiqueta", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

    }
}
