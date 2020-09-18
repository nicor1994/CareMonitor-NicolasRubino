using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Usuario
    {
        DAL.MP_Usuario MapperUsu = new DAL.MP_Usuario();
        Seguridad.DigitoVerificador GestorDigito = new Seguridad.DigitoVerificador();
        
        public BE.Usuario ObtenerUsuarioID(int id){


            BE.Usuario usu = MapperUsu.ObtenerUsuarioID(id);

            return usu;

        }

        public BE.Usuario Login(string usu, string pass)
        {

            BE.Usuario user = MapperUsu.Login(usu, pass);
            
            //Aca debo buscar los permisos del usuario antes de retornar

            return user;
        }

        public bool RegistrarUsuario(BE.Usuario usu, BE.Usuario usuEnSesion)
        {
           
            usu.DVH = GestorDigito.GenerarDVH( usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion);
           int fa = MapperUsu.AgregarUsuario(usu);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Usuarios";
                bita.Accion = "Se dio de alta el usuario " + usu.Nombre + " " + usu.Apellido;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public List<BE.Usuario> ListarTodos()
        {
            List<BE.Usuario> ListaUsuarios = MapperUsu.ListarUsuarios();
            return ListaUsuarios;
        }

        public int ComprobarIntegridad()
        {
            int RegistrosCorruptos = new int();
            List<BE.Usuario> ListUsu = ListarTodos();
            foreach(BE.Usuario usu in ListUsu)
            {
                if(GestorDigito.VerificarIntegridadDVH((usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado), usu.DVH) != true){

                    RegistrosCorruptos++;

                }



            }
            return RegistrosCorruptos;
        }

        public bool ComprobarUsuarioEnSesion(List<int> ListaIds, BE.Usuario usu)
        {
            
            if (ListaIds.Contains(usu.ID)){
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<string> ListarNombresUsuario()
        {
            List<string> ListaNombre = new List<string>();

            foreach(BE.Usuario usu in this.ListarTodos())
            {
                ListaNombre.Add(usu.Nombre + " " + usu.Apellido);
            }
            ListaNombre.Add("Usuario no logeado");

            return ListaNombre;
        }


    }
}
