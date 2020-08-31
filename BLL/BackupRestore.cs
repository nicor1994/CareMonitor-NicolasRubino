using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Data.SqlTypes;

namespace BLL
{
    public class BackupRestore
    {

        DAL.MP_BackupRestore GestorBackupRestore = new DAL.MP_BackupRestore();
        BLL.Bitacora GestorBitacora = new Bitacora();

        public int GenerarBackup(BE.Usuario usu)
        {

            int acc = GestorBackupRestore.RealizarBackup();
            if (acc == -1)
            {

                BE.Bitacora bita = new BE.Bitacora();
                bita.Accion = "Intento fallido de Backup";
                bita.Fecha = DateTime.Now;
                bita.Tipo = "Backup";
                bita.Usuario = usu.Nombre + " " + usu.Apellido;
                GestorBitacora.RegistrarEnBitacora(bita);
            }
            else
            {
                BE.Bitacora bita = new BE.Bitacora();
                bita.Accion = "Se realizo backup de la base de datos";
                bita.Fecha = DateTime.Now;
                bita.Tipo = "Backup";
                bita.Usuario = usu.Nombre + " " + usu.Apellido;
                GestorBitacora.RegistrarEnBitacora(bita);
            }
            return acc;
        }

        public int GenerarRestore(string nombre, BE.Usuario usu)
        {

            int fa = GestorBackupRestore.RealizarRestore(nombre);

            if (fa == -1)
            {
                BE.Bitacora bita = new BE.Bitacora();
                bita.Accion = "Intento fallido de Restore";
                bita.Fecha = DateTime.Now;
                bita.Tipo = "Restore";
                bita.Usuario = usu.Nombre + " " + usu.Apellido;
                GestorBitacora.RegistrarEnBitacora(bita);
            }

            return fa;
        }

        public List<string> CargarBackups()
        {
            return Directory.EnumerateFiles(@" C:\").Where(file => file.Contains("Backup")).Select(file => Path.GetFileName(file)).ToList();
        }

    }
}
