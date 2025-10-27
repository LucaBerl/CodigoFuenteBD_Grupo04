using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    public class Envio
    {
        public int IDEnvio { get; set; }
        public int IDPedido { get; set; }
        public int? IDDomicilio { get; set; }    
        public int IDEstadoEnvio { get; set; }
        public DateTime FechaUltMovimiento { get; set; }
        public string Tracking { get; set; }
    }
}