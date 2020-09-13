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
        BLL.Usuario GestorUsuario = new Usuario();
        
        public void RegistrarEnBitacora(BE.Bitacora bitacora)
        {
            GestorBitacora.GuardarBitacora(bitacora);
        }

        public List<BE.Bitacora> ListarBitacora()
        {

            return GestorBitacora.ListarBitacora();


        }


    }
}