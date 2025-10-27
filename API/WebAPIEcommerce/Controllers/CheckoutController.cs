using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.Controllers
{
    [RoutePrefix("api/checkout")]
    public class CheckoutController : ApiController
    {
        private CheckoutLogica _checkoutLogica = new CheckoutLogica();

        [HttpPost]
        [Route("pagar")]
        public IHttpActionResult Pagar(RegistrarPagoRequest request)
        {
            
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                _checkoutLogica.ProcesarPago(request);
                return Ok(new { message = "Pago registrado, stock actualizado y envío creado." });
            }
            catch (Exception ex)
            {
               
                return BadRequest(ex.Message);
            }
        }
    }
}