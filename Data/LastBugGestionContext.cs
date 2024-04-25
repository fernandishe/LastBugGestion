using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using LastBugGestion.Models.Ubicacion;
using LastBugGestion.Models.Login;

namespace LastBugGestion.Data
{
    public class LastBugGestionContext : DbContext
    {
        public LastBugGestionContext (DbContextOptions<LastBugGestionContext> options)
            : base(options)
        {
        }
        public DbSet<Pais> Pais { get; set; } = default!;
        public DbSet<Region> Region { get; set; } = default!;
        public DbSet<Comuna> Comuna { get; set; } = default!;
        public DbSet<Usuarios> Usuarios { get; set; } = default!;

    }
}
