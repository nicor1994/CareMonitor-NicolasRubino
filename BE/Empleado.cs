using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    class Empleado : Usuario
    {

        private int _Legajo;

        public int Legajo
        {
            get { return _Legajo; }
            set { _Legajo = value; }
        }



    }
}
