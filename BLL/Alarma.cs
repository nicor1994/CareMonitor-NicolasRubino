using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class Alarma
    {
        DAL.MP_Alarma MapperAlarma = new DAL.MP_Alarma();
        public int DispararAlarma(List<BE.Medicion> Mediciones, BE.Usuario usu)
        {
            int fa = MapperAlarma.AltaAlarma(Mediciones, usu);
            if (fa == -1)
            {
                return fa;
            }
            else
            {
                foreach (BE.Medicion med in Mediciones)
                {
                    fa = MapperAlarma.GuardarMedicion(med, usu);
                }

                if (fa == -1)
                {
                    
                }
                else
                {
                    BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                    BE.Bitacora bita = new BE.Bitacora();
                    bita.Usuario = usu.Nombre + " " + usu.Apellido;
                    bita.Tipo = "Alarma";
                    bita.Accion = "Se disparo una alarma del usuario " + usu.Nombre + " " + usu.Apellido;
                    bita.Fecha = DateTime.Now;
                    GestorBitacora.RegistrarEnBitacora(bita);
                    
                }

                return fa;
            }


            
        }

        public List<BE.Alarma> ListarAlarmas()
        {
            List<BE.Alarma> ListaAlarmas = MapperAlarma.ListarAlarmas();
            return ListaAlarmas;
        }

        public List<BE.Alarma> ListarAlarmasID(BE.Usuario usu)
        {
            List<BE.Alarma> ListaAlarmas = MapperAlarma.ListarAlarmasID(usu.ID);
            return ListaAlarmas;
        }

        public int Evolucionar(BE.Alarma alarma, BE.Usuario usuEnSesion) { 
            
            int fa = MapperAlarma.Evolucionar(alarma);

            if (fa == -1)
            {
                
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Cierre de Alarmas";
                bita.Accion = "Se cerró una alarma del usuario " + alarma.Usuario.Nombre + " " + alarma.Usuario.Apellido;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
               
            }

            return fa;
        }


    }
}
