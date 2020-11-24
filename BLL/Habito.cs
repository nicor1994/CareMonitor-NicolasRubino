using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class Habito
    {
        DAL.MP_Habito MapperHabitos = new DAL.MP_Habito();

        public bool AltaHabitos(BE.Habito hab, BE.Usuario usuEnSesion)
        {


            int fa = MapperHabitos.AltaHabito(hab, usuEnSesion);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Ingreso de Habitos";
                bita.Accion = "Se añadió el habito " + hab.TipoHabito.Nombre + " - " + hab.ValorxSemana;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public bool ModificarHabitos(BE.Habito hab, BE.Usuario usuEnSesion)
        {


            int fa = MapperHabitos.ModificarHabito(hab, usuEnSesion);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Ingreso de Habitos";
                bita.Accion = "Se modificó el habito " + hab.TipoHabito.Nombre + " - " + hab.ValorxSemana;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

    }
}
