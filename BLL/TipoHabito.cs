using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class TipoHabito
    {

        DAL.MP_TipoHabito MapperHabitos = new DAL.MP_TipoHabito();

        public bool AltaHabitos(BE.TipoHabito hab, BE.Usuario usuEnSesion)
        {


            int fa = MapperHabitos.AltaHabito(hab);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Habitos";
                bita.Accion = "Se dio de alta el habito " + hab.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public bool ModificarHabito(BE.TipoHabito hab, BE.Usuario usuEnSesion)
        {


            int fa = MapperHabitos.ModificarHabito(hab);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Habitos";
                bita.Accion = "Se modifico el habito " + hab.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public bool BajaHabito(BE.TipoHabito hab, BE.Usuario usuEnSesion)
        {


            int fa = MapperHabitos.EliminarHabito(hab);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Habitos";
                bita.Accion = "Se dio de baja el habito " + hab.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public List<BE.TipoHabito> Listar()
        {
            List<BE.TipoHabito> ListaMedicion = MapperHabitos.Listar();
            return ListaMedicion;
        }

    }
}
