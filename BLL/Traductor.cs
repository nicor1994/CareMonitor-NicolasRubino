using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;



namespace BLL
{
    public class Traductor
    {
        DAL.MP_Traductor MapperTraductor = new DAL.MP_Traductor();
        public string Traducir(string nombre, BE.Lenguaje Leng)
        {
           
                string str = Leng.ListaEtiquetas.Find(x => x.NombreControl == nombre).Traduccion;
                return str;
                           
        }

        public BE.Lenguaje ListarIdioma(BE.Lenguaje leng)
        {
            BE.Lenguaje lengua = MapperTraductor.Listar(leng);
            return lengua;
        }

        public BE.Lenguaje ListarDefault()
        {
            BE.Lenguaje lengua = new BE.Lenguaje();
            lengua.Nombre = "Español";
            lengua.ID = 1;
            lengua = ListarIdioma(lengua);
            return lengua;
        }

        public List<BE.Lenguaje> ListarIdiomas()
        {
            List<BE.Lenguaje> lengua = MapperTraductor.Listar();
            return lengua;
        }

        public bool CrearIdioma(List<BE.Etiqueta> ListaEti, string Nombre)
        {
            int fa = MapperTraductor.CrearIdioma(Nombre);
            
            foreach(BE.Etiqueta eti in ListaEti)
            {
                MapperTraductor.GuardarEtiqueta(eti);
            }
            return true;
        }

    }
}
