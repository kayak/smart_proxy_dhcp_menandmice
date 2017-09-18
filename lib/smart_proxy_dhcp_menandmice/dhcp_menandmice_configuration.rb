module ::Proxy::DHCP::Menandmice
  class PluginConfiguration
    def load_classes
      require 'dhcp_common/dhcp_common'
      require 'smart_proxy_dhcp_menandmice/dhcp_menandmice_main'
    end

    def load_dependency_injection_wirings(container_instance, settings)
      container_instance.dependency :dhcp_provider, (lambda do
        ::Proxy::DHCP::Menandmice::Provider.new(
            settings[:server],
            settings[:subnets],
            settings[:username],
            settings[:password],
            settings[:use_ddns],
            settings[:ssl],
            settings[:verify_ssl],
            settings[:mock_login])
      end)
    end
  end
end
