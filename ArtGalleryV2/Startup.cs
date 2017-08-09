using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ArtGalleryV2.Startup))]
namespace ArtGalleryV2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
