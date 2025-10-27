using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    public class ArticuloPorCategoriaView
    {
        public int IDProducto { get; set; }
        public string NombreProducto { get; set; }
        public string Descripcion { get; set; }
        public int SKU { get; set; }
        public string Color { get; set; }
        public string Talle { get; set; }
        public int CantidadStock { get; set; }
        public decimal Precio { get; set; }
        public string ImagenUrl { get; set; }
    }
}