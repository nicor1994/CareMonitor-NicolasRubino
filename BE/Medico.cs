using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class Medico : Usuario
    {

        private int _Matricula;

        public int Matricula
        {
            get { return _Matricula; }
            set { _Matricula = value; }
        }


    }
}
