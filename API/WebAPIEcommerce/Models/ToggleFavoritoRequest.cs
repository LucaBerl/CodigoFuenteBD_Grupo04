using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    public class ToggleFavoritoRequest
    {
        public int IDCliente { get; set; }
        public int SKU { get; set; }
    }
}