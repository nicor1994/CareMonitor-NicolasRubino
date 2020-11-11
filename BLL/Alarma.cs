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
            int fa = MapperAlarma.DispararAlarma(Mediciones, usu);

            return fa;
        }



    }
}
