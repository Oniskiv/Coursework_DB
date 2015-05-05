using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(lab_rab_5.Startup))]
namespace lab_rab_5
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
