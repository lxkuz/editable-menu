Geocoder.configure(
  # geocoding options
  :timeout      => 5,           # geocoding service timeout (secs)
  :lookup       => :yandex,     # name of geocoding service (symbol)
  :language     => :ru,         # ISO-639 language code
  # :use_https    => false,       # use HTTPS for lookup requests? (if supported)
  # :http_proxy   => nil,         # HTTP proxy server (user:pass@host:port)
  # :https_proxy  => nil,         # HTTPS proxy server (user:pass@host:port)
  :api_key      => 'ANXWI1QBAAAAmwCnUAMABgfgbT5syNfwq4Q_4euY2CA6vnAAAAAAAAAAAACTlgL4N4sq9080QclFZkiEWhC2VQ==',         # API key for geocoding service
  # :cache        => nil,         # cache object (must respond to #[], #[]=, and #keys)
  # :cache_prefix => "geocoder:", # prefix (string) to use for all cache keys

  # exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and TimeoutError
  # :always_raise => [],

  # calculation options
  :units     => :km,       # :km for kilometers or :mi for miles
  # :distances => :linear    # :spherical or :linear
)
