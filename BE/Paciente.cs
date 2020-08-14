using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class Paciente : Usuario
    {

        private List<Medicion> _Mediciones;

        public List<Medicion> Mediciones
        {
            get { return _Mediciones; }
            set { _Mediciones = value; }
        }

        private List<Habito> _Habitos;

        public List<Habito> Habitos
        {
            get { return _Habitos; }
            set { _Habitos = value; }
        }
        

    }
}
