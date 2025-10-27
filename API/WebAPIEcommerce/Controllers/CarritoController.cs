using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.Controllers
{
    [RoutePrefix("api/carrito")]
    public class CarritoController : ApiController
    {
        private CarritoLogica _carritoLogica = new CarritoLogica();

        [HttpPost]
        [Route("agregar")]
        public IHttpActionResult Agregar(AgregarArticuloRequest request)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);
            try
            {
                _carritoLogica.AgregarArticulo(request);
                return Ok(new { message = "Artículo agregado correctamente." });
            }
            catch (Exception ex)
            {
                // Captura el error (ej. "No hay stock")
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("quitar")]
        public IHttpActionResult Quitar(AgregarArticuloRequest request)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);
            try
            {
                _carritoLogica.QuitarArticulo(request);
                return Ok(new { message = "Artículo quitado correctamente." });
            }
            catch (Exception ex)
            {
                // Captura el error (ej. "La cantidad a quitar supera...")
                return BadRequest(ex.Message);
            }
        }
    }
}