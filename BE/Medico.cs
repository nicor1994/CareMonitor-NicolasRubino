using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }

    }
}
