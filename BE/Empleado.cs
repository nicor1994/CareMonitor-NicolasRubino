using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    public class Empleado : Usuario
    {

        private int _Legajo;

        public int Legajo
        {
            get { return _Legajo; }
            set { _Legajo = value; }
        }

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }


    }
}
