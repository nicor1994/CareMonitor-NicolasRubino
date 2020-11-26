using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Servicio
    {

        DAL.MP_Servicio MapperServicio = new DAL.MP_Servicio();
        public bool AltaServicio(BE.TipoServicio serv, BE.Usuario usuEnSesion)
        {

          
            int fa = MapperServicio.AltaServicio(serv);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Servicios";
                bita.Accion = "Se dio de alta el servicio " + serv.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public bool ModificacionServicio(BE.TipoServicio serv, BE.Usuario usuEnSesion)
        {


            int fa = MapperServicio.ModificarServicio(serv);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Servicios";
                bita.Accion = "Se modificó el servicio " + serv.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public bool BajaServicio(BE.TipoServicio serv, BE.Usuario usuEnSesion)
        {


            int fa = MapperServicio.BajaServicio(serv);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Servicios";
                bita.Accion = "Se dio de baja el servicio " + serv.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public List<BE.TipoServicio> Listar()
        {
            List<BE.TipoServicio> ListaServicios = MapperServicio.Listar();
            return ListaServicios;
        }

        public bool SolicitarServicio(BE.Servicio serv)
        {


            int fa = MapperServicio.SolicitarServicio(serv);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = serv.Usuario.Nombre + " " + serv.Usuario.Apellido;
                bita.Tipo = "Solicitud de Servicios";
                bita.Accion = "Se solicitó el servicio " + serv.TipoServicio.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);

                BE.Evento eve = new BE.Evento();
                BLL.Evento GestionEvento = new Evento();
                eve.Titulo = "Servicio Solicitado: " + serv.TipoServicio.Nombre;
                eve.Descripcion = serv.TipoServicio.Descripcion;
                eve.Fecha = serv.FechaServicio;
                GestionEvento.AltaEventos(eve, serv.Usuario);

                return true;
            }
        }

        public List<BE.Servicio> ListarServicios()
        {
            List<BE.Servicio> ListaServicios = MapperServicio.ListarServicio();
            return ListaServicios;
        }


        public bool CerrarServicio(BE.Servicio serv, int tiempo)
        {


            int fa = MapperServicio.CerrarServicio(serv, tiempo);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = serv.Usuario.Nombre + " " + serv.Usuario.Apellido;
                bita.Tipo = "Solicitud de Servicios";
                bita.Accion = "Se solicitó el servicio " + serv.TipoServicio.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);

                BE.Evento eve = new BE.Evento();
                BLL.Evento GestionEvento = new Evento();
                eve.Titulo = "Servicio Solicitado: " + serv.TipoServicio.Nombre;
                eve.Descripcion = serv.TipoServicio.Descripcion;
                eve.Fecha = serv.FechaServicio;
                GestionEvento.AltaEventos(eve, serv.Usuario);

                return true;
            }
        }




    }
}
