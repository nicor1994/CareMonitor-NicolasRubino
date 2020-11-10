using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{

    public class Medicion
    {
        DAL.MP_Medicion MapperMedicion = new DAL.MP_Medicion();
        BLL.Enfermedad GestorEnfermedades = new Enfermedad();
        public bool AltaMedicion(BE.Medicion med, BE.Usuario usuEnSesion)
        {


            int fa = MapperMedicion.AltaMedicion(med, usuEnSesion);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Ingreso de Medicion";
                bita.Accion = "Se cargo la medicion " + med.Tipo.Nombre + " - " + med.Valor ;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public List<BE.Enfermedad> VerificarEnfermedades(List<BE.Medicion> Mediciones, BE.Usuario usuEnSesion)
        {
            List<BE.Enfermedad> ListaEnf = new List<BE.Enfermedad>();
            List<BE.Enfermedad> ListaAux = new List<BE.Enfermedad>();
            List<BE.Enfermedad> ListaDef = new List<BE.Enfermedad>();
            List<int> CantSintomas = new List<int>();
            //Listo las enfermedades que tenga alguna de las mediciones (o sintomas) que ingrese
            ListaEnf = GestorEnfermedades.ListarEnfermedades(Mediciones);
            //Descarto por sintomas?
            foreach (BE.Enfermedad enf in ListaEnf)
            {
                if (ListaAux.Find(x => x.ID == enf.ID) == null)
                {
                    ListaAux.Add(enf);
                }
            }

            foreach(BE.Enfermedad enf in ListaAux)
            {
                int cant = GestorEnfermedades.EnumerarSintomas(enf);

                int asd = ListaEnf.Count(x => x.ID == enf.ID);

                if (ListaEnf.Count(x => x.ID==enf.ID) >= cant *0.7)
                {
                    ListaDef.Add(enf);
                }
                
                CantSintomas.Add(cant);
            }
            //Verifico si la cantidad de matcheo es mayor al 70%
                        

            return ListaDef;
        }

    }
}
