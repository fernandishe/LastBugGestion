using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using LastBugGestion.Data;
using LastBugGestion.Models.Ubicacion;
using LastBugGestion.Models.Login;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.Annotations;
using System.Net;

namespace LastBugGestion.Controllers.Ubicacion
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComunasController : ControllerBase
    {
        private readonly LastBugGestionContext _context;
        private readonly IServiceProvider _usuariosService;
        private string mensajeRol = "Usuario No tiene permisos para esta acción";

        public ComunasController(LastBugGestionContext context )
        {
            _context = context;
        }

        // GET: api/Comunas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Comuna>>> GetComuna()
        {
            return await _context.Comuna.ToListAsync();
        }

        // GET: api/Comunas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Comuna>> GetComuna(int id)
        {
            var comuna = await _context.Comuna.FindAsync(id);

            if (comuna == null)
            {
                return NotFound();
            }

            return comuna;
        }

        // PUT: api/Comunas/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutComuna(int id, Comuna comuna, [FromHeader] string rol)
        {
            if (rol != "ADM")
            {
                return BadRequest(mensajeRol);
            }

            if (id != comuna.Codigo)
            {
                return BadRequest();
            }

            _context.Entry(comuna).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ComunaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Comunas
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
       
        [HttpPost]
        public async Task<ActionResult<Comuna>> PostComuna(Comuna comuna, [FromHeader] string rol)
        {

            if (rol!="ADM")
            {
                return BadRequest(mensajeRol);
            }
           
            _context.Comuna.Add(comuna);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetComuna", new { id = comuna.Codigo }, comuna);
        }

        // DELETE: api/Comunas/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteComuna(int id, [FromHeader] string rol)
        {
            if (rol != "ADM")
            {
                return BadRequest(mensajeRol);
            }
            var comuna = await _context.Comuna.FindAsync(id);
            if (comuna == null)
            {
                return NotFound();
            }

            _context.Comuna.Remove(comuna);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ComunaExists(int id)
        {
            return _context.Comuna.Any(e => e.Codigo == id);
        }
    }
}
