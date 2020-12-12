using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class Alarma
    {
        DAL.MP_Alarma MapperAlarma = new DAL.MP_Alarma();
        public int DispararAlarma(List<BE.Medicion> Mediciones, BE.Usuario usu)
        {
            int fa = MapperAlarma.AltaAlarma(Mediciones, usu);
            if (fa == -1)
            {
                return fa;
            }
            else
            {
                foreach (BE.Medicion med in Mediciones)
                {
                    fa = MapperAlarma.GuardarMedicion(med, usu);
                }
               
                return fa;
            }


            
        }

        public List<BE.Alarma> ListarAlarmas()
        {
            List<BE.Alarma> ListaAlarmas = MapperAlarma.ListarAlarmas();
            return ListaAlarmas;
        }

        public List<BE.Alarma> ListarAlarmasID(BE.Usuario usu)
        {
            List<BE.Alarma> ListaAlarmas = MapperAlarma.ListarAlarmasID(usu.ID);
            return ListaAlarmas;
        }

        public int Evolucionar(BE.Alarma alarma) { 
            
            int fa = MapperAlarma.Evolucionar(alarma);
            return fa;
        }


    }
}
