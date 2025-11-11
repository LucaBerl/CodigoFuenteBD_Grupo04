using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;

namespace WebAPIEcommerce.Controllers
{
    
    public class DeleteDomicilioRequest
    {
        public int IDCliente { get; set; }
    }

    [RoutePrefix("api/domicilios")]
    public class DomicilioController : ApiController
    {
        private DomicilioLogica _domicilioLogica = new DomicilioLogica();

        [HttpDelete]
        [Route("{idDomicilio:int}")]
        public IHttpActionResult Eliminar(int idDomicilio, DeleteDomicilioRequest request)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            try
            {
                
                _domicilioLogica.EliminarDomicilio(idDomicilio, request.IDCliente);
                return Ok(new { message = "Domicilio eliminado. Si era predeterminado, se asignó uno nuevo." });
            }
            catch (Exception ex)
            {
                
                return BadRequest(ex.Message);
            }
        }
    }
}