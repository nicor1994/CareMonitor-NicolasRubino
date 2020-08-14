using System;
using System.Collections.Generic;
using System.Text;

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
