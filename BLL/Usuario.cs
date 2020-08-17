using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class Usuario
    {
        DAL.MP_Usuario MapperUsu = new DAL.MP_Usuario();
        public BE.Usuario ObtenerUsuarioID(int id){


            BE.Usuario usu = MapperUsu.ObtenerUsuarioID(id);

            return usu;

        }



    }
}
