using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Seguridad
{
    public class DigitoVerificador
    {

        
        public int GenerarDVH(String texto)
        {
            byte[] asciiBytes = Encoding.ASCII.GetBytes(texto);
            int intDVH = 0;

            foreach (byte b in asciiBytes)
            {
                intDVH += Convert.ToInt32(b);
            }
            return intDVH;
        }

        public bool VerificarIntegridadDVH(string texto, int dvh)
        {

            int dvhtexto = GenerarDVH(texto);

            if (dvh == dvhtexto)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        


    }
}
