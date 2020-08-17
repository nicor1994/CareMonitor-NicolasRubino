using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{
    public class MP_Bitacora
    {

        DAL.Acceso Acceso = new DAL.Acceso();
        DAL.MP_Usuario MapperUsuario = new MP_Usuario();

        public int GuardarBitacora(BE.Bitacora bita)
        {
            int fa = 0;
            Acceso.AbrirConexionBitacora();
            SqlParameter[] parametros = new SqlParameter[3];
            
            parametros[0] = Acceso.ArmarParametro("idusu", bita.Usuario.ID, SqlDbType.Int);
            parametros[1] = Acceso.ArmarParametro("fecha", DateTime.Now, SqlDbType.DateTime);
            parametros[2] = Acceso.ArmarParametro("acc", bita.Accion, SqlDbType.VarChar);

            fa = Acceso.Escribir("Bitacora_Insertar", parametros);


            Acceso.CerrarConexion();

            return fa;
        }

        public List<BE.Bitacora> ListarBitacora()
        {
            List<BE.Bitacora> ListaBitacora = new List<BE.Bitacora>();
            Acceso.AbrirConexionBitacora();
            DataTable Tabla = Acceso.Leer("Bitacora_Listar", null);
            Acceso.CerrarConexion();
            GC.Collect();
            foreach (DataRow bitacorarow in Tabla.Rows)
            {
                BE.Bitacora nuevabitacora = new BE.Bitacora();

                nuevabitacora.ID = (int)bitacorarow["ID_Bitacora"];
                nuevabitacora.Fecha = (DateTime)bitacorarow["Fecha"];
                nuevabitacora.Accion = (string)bitacorarow["Accion"];
                nuevabitacora.Usuario = MapperUsuario.ObtenerUsuarioID((int)bitacorarow["ID_Usuario"]);

                ListaBitacora.Add(nuevabitacora);

            }
            return ListaBitacora;
        }
}
}
