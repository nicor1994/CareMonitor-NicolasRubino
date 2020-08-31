using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{
    public class MP_BackupRestore
    {

        Acceso acc = new Acceso();
        public int RealizarBackup()
        {
            string query = @"Backup database CareMonitor to disk='C:\Backup" +"-"+ DateTime.Now.Day.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString() + "--" + DateTime.Now.TimeOfDay.Hours.ToString() + "-" + DateTime.Now.TimeOfDay.Minutes.ToString()+ ".bak'";
            //string query = @"Backup database CareMonitor to disk='C:\Backup'";

            acc.AbrirConexionMaster();

            int accion = acc.Escribir(query);
            acc.CerrarConexion();
            GC.Collect();
            return accion;
        }

        public int RealizarRestore(string archivo)
        {
            String query0 = "ALTER DATABASE CareMonitor set single_user with rollback immediate";
            String query1 = "DROP DATABASE CareMonitor";
            String query2 = @"restore database CareMonitor from disk='C:\"+archivo+"'";
            int fa = new int();        
            try
            {
                acc.AbrirConexionMaster();
                acc.Escribir(query0);
                acc.Escribir(query1);
                acc.Escribir(query2);
              

            }
            catch (Exception ex)
            {
                throw (ex);
                fa = -1;
            }
            finally
            {
                acc.CerrarConexion();
                GC.Collect();
            }

            return fa;
        }
    }

    
}
