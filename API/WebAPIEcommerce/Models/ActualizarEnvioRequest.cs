using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    public class ActualizarEnvioRequest
    {
        //  ID de estado NULLABLE.
        // si el JSON no lo incluye, no se actualiza.
        public int? IDEstadoEnvio { get; set; }

        // El tracking ya es un string, que es nullable por defecto.
        
        public string Tracking { get; set; }
    }
}