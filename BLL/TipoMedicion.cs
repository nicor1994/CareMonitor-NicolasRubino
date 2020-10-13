using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{    
    public class TipoMedicion
    {
        DAL.MP_TipoMedicion MapperMedicion = new DAL.MP_TipoMedicion();

        public bool AltaParametro(BE.TipoMedicion parametro, BE.Usuario usuEnSesion)
        {


            int fa = MapperMedicion.AltaParametro(parametro);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Parametros";
                bita.Accion = "Se dio de alta el parametro " + parametro.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public List<BE.TipoMedicion> Listar()
        {
            List<BE.TipoMedicion> ListaMedicion = MapperMedicion.Listar();
            return ListaMedicion;
        }

    }
}
