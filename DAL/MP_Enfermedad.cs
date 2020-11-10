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


            public List<BE.Enfermedad> ListarEnfermedad(BE.Medicion Med)
            {

                List<BE.Enfermedad> ListaEnfermedad = new List<BE.Enfermedad>();
                acc.AbrirConexion();
                SqlParameter[] parametros = new SqlParameter[1];
                parametros[0] = acc.ArmarParametro("id", Med.Tipo.ID, System.Data.SqlDbType.VarChar);

                DataTable Tabla = acc.Leer("Enfermedad_ListarPorMed", parametros);
                acc.CerrarConexion();
                GC.Collect();
                foreach (DataRow linea in Tabla.Rows)
                {

                BE.Enfermedad enf = new BE.Enfermedad();

                enf.ID = (int)linea["ID"];
                enf.Nombre = (string)linea["Nombre"];
                if((int)linea["Maximo"]== 0)
                {
                    if (Med.Valor < Med.Tipo.MinimoMasculino)
                    {
                        ListaEnfermedad.Add(enf);
                    }
                }
                if ((int)linea["Maximo"] == 1)
                {
                    if (Med.Valor > Med.Tipo.MaximoMasculino)
                    {
                        ListaEnfermedad.Add(enf);
                    }
                }

            }
                return ListaEnfermedad;

            }

        public int EnumerarSintomas(BE.Enfermedad enf)
        {

            int cant = new int();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("idenf", enf.ID, System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("Enfermedad_EnumerarSintomas", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {

                cant = int.Parse(linea[0].ToString());

            }
            return cant;

        }


    }
}
