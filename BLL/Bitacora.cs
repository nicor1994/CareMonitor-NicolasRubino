using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Bitacora
    {
        DAL.MP_Bitacora GestorBitacora = new DAL.MP_Bitacora();
        
        public void RegistrarEnBitacora(BE.Bitacora bitacora)
        {

            GestorBitacora.GuardarBitacora(bitacora);

        }



    }
}