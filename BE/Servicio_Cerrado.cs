using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Servicio_Cerrado : Servicio
    {

        private DateTime _fechaCierre;

        public DateTime FechaCierre
        {
            get { return _fechaCierre; }
            set { _fechaCierre = value; }
        }

        private int _TiempoServicio;

        public int TiempoServicio
        {
            get { return _TiempoServicio; }
            set { _TiempoServicio = value; }
        }


    }
}
