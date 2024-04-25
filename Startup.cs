using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    // Este método se utiliza para configurar los servicios de la aplicación.
    public void ConfigureServices(IServiceCollection services)
    {
        // Aquí puedes configurar los servicios que tu aplicación necesita.
        // Por ejemplo, configuración de base de datos, autenticación, etc.
    }

    // Este método se utiliza para configurar el pipeline de solicitud HTTP.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        // Aquí puedes configurar cómo se manejarán las solicitudes HTTP.
        // Por ejemplo, middleware de enrutamiento, middleware de autenticación, etc.
    }
}
