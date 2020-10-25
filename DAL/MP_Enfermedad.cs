using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace DAL
{
    public class MP_Enfermedad
    {

     
            Acceso acc = new Acceso();

            public int AltaEnfermedad(BE.Enfermedad enf)
            {
                int fa = 0;
                acc.AbrirConexion();
                SqlParameter[] parametros = new SqlParameter[1];
                parametros[0] = acc.ArmarParametro("nombre", enf.Nombre, System.Data.SqlDbType.VarChar);             
                fa = acc.Escribir("Enfermedad_Agregar", parametros);
                acc.CerrarConexion();
                GC.Collect();
                return fa;
            }

            public int AltaSintoma(BE.Sintoma sint)
            {
                int fa = 0;
                acc.AbrirConexion();
                SqlParameter[] parametros = new SqlParameter[2];
                parametros[0] = acc.ArmarParametro("idsintoma", sint.pSintoma.ID, System.Data.SqlDbType.Int);
                if (sint.Maximo == true)
                {
                    parametros[1] = acc.ArmarParametro("maximo", 1, System.Data.SqlDbType.Int);
                }
                else
                {
                    parametros[1] = acc.ArmarParametro("maximo", 0, System.Data.SqlDbType.Int);
                }

                fa = acc.Escribir("Sintoma_Agregar", parametros);
                acc.CerrarConexion();
                GC.Collect();
                return fa;
            }

        public int AltaEnfermedadHabito(BE.TipoHabito habenf)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("idhabito", habenf.ID, System.Data.SqlDbType.Int);
          

            fa = acc.Escribir("Enfermedad_AgregarHabito", parametros);
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
