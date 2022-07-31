using CKSource.CKFinder.Connector.Config;
using CKSource.CKFinder.Connector.Core.Builders;
using CKSource.CKFinder.Connector.Core.Logs;
using CKSource.CKFinder.Connector.Host.Owin;
using CKSource.CKFinder.Connector.Logs.NLog;
using CKSource.CKFinder.Connector.KeyValue.FileSystem;
using CKSource.FileSystem.Local;
using Microsoft.Owin;
using Owin;
using IWeShop.Models;

[assembly: OwinStartupAttribute(typeof(IWeShop.Startup))]
namespace IWeShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);

            FileSystemFactory.RegisterFileSystem<LocalStorage>();

            app.Map("/ckfinder/connector", SetupConnector);

        }

        private static void SetupConnector(IAppBuilder app)
        {

            var connectorFactory = new OwinConnectorFactory();
            var connectorBuilder = new ConnectorBuilder();
            var customAuthenticator = new CustomCKFinderAuthenticator();
            var connector = connectorBuilder
                .LoadConfig()
                .SetRequestConfiguration(
                    (request, config) =>
                    {
                        config.LoadConfig();

                        var privateBackend = config.GetBackend("CKFinderPrivate");

                        var keyValueStoreProvider = new FileSystemKeyValueStoreProvider(privateBackend);

                        config.SetKeyValueStoreProvider(keyValueStoreProvider);
                    })
                .SetAuthenticator(customAuthenticator)
                .Build(connectorFactory);

            app.UseConnector(connector);
        }
    }
}
