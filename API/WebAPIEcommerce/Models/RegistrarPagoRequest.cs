using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    public class RegistrarPagoRequest
    {
        public int IDPedido { get; set; }
        public string MetodoPago { get; set; }
        public decimal Monto { get; set; }
        public int? IDDomicilio { get; set; }

        // Debe ser nullable (int?) para poder enviar NULL
        // cuando el cliente selecciona "RetiraLocal".
    }
}