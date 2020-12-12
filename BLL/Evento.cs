using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class Evento
    {
        DAL.MP_Evento MapperEventos = new DAL.MP_Evento();
        public bool AltaEventos(BE.Evento Eve, BE.Usuario usuEnSesion)
        {


            int fa = MapperEventos.AltaEvento(Eve, usuEnSesion);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Calendario de Eventos";
                bita.Accion = "Se añadió el evento " + Eve.Titulo;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }


        }

        public List<BE.Evento> Listar(BE.Usuario usu)
        {
            return MapperEventos.Listar(usu);
        }


    }
}
