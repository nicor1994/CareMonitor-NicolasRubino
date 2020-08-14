using System;
using System.Collections.Generic;
using System.Text;

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
