﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Enfermedad
    {

        DAL.MP_Enfermedad MapperEnfermedad = new DAL.MP_Enfermedad();
        public bool AltaEnfermedad(BE.Enfermedad enf, BE.Usuario usuEnSesion)
        {


            int fa = MapperEnfermedad.AltaEnfermedad(enf);
            if (fa == -1)
            {
                return false;
            }
            else
            {

                foreach (BE.Sintoma sin in enf.Sintomas)
                {
                    MapperEnfermedad.AltaSintoma(sin);
                }
                foreach (BE.TipoHabito habenf in enf.MalosHabitos)
                {
                    MapperEnfermedad.AltaEnfermedadHabito(habenf);
                }

                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Enfermedad";
                bita.Accion = "Se dio de alta la enfermedad " + enf.Nombre;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

    //    public bool ModificacionEnfermedad(BE.Enfermedad enf, BE.Usuario usuEnSesion)
    //    {


    //        int fa = MapperEnfermedad.ModificarEnfermedad(enf);
    //        if (fa == -1)
    //        {
    //            return false;
    //        }
    //        else
    //        {
    //            BLL.Bitacora GestorBitacora = new BLL.Bitacora();

    //            BE.Bitacora bita = new BE.Bitacora();
    //            bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
    //            bita.Tipo = "Gestion Enfermedad";
    //            bita.Accion = "Se modificó la enfermedad " + enf.Nombre;
    //            bita.Fecha = DateTime.Now;
    //            GestorBitacora.RegistrarEnBitacora(bita);
    //            return true;
    //        }
    //}

    //    public bool BajaEnfermedad(BE.Enfermedad enf, BE.Usuario usuEnSesion)
    //    {


    //        int fa = MapperEnfermedad.BajaEnfermedad(enf);
    //        if (fa == -1)
    //        {
    //            return false;
    //        }
    //        else
    //        {
    //            BLL.Bitacora GestorBitacora = new BLL.Bitacora();

    //            BE.Bitacora bita = new BE.Bitacora();
    //            bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
    //            bita.Tipo = "Gestion Enfermedad";
    //            bita.Accion = "Se dio de baja la enfermedad " + enf.Nombre;
    //            bita.Fecha = DateTime.Now;
    //            GestorBitacora.RegistrarEnBitacora(bita);
    //            return true;
    //        }
    //    }

    //    public List<BE.Enfermedad> Listar()
    //    {
    //        List<BE.Enfermedad> ListaEnfermedad = MapperEnfermedad.Listar();
    //        return ListaEnfermedad;
    //    }

    }


}

