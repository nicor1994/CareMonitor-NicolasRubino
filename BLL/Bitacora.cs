using System;

namespace BLL
{
    public class Bitacora
    {
        DAL.Bitacora GestorBitacora = new DAL.Bitacora();

        public void RegistrarEnBitacora(BE.Bitacora bitacora)
        {

            GestorBitacora.GuardarBitacora(bitacora);

        }



    }
}
