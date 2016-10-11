return {
  name = "voronianski/response-time",
  version = "1.0.0",
  description = "Response time header for Luvit.io",
  tags = { "luvit", "response-time", "header", "utopia", "middleware" },
  license = "MIT",
  author = { name = "Dmitri Voronianski", email = "dmitri.voronianski@gmail.com" },
  homepage = "https://github.com/luvitrocks/response-time",
  dependencies = {
    'voronianski/on-headers-event'
  },
  files = {
    "**.lua",
    "!test*"
  }
}
