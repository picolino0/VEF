using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Proof_of_Concept.Startup))]
namespace Proof_of_Concept
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
