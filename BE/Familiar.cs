using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    class Familiar : Usuario
    {

        private Usuario _familiar;

        public Usuario UsuarioFamiliar
        {
            get { return _familiar; }
            set { _familiar = value; }
        }


    }
}
