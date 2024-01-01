local dap = require("dap")
local dap_python = require("dap-python")

dap_python.setup("python")

dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Docker: Django",
    connect = {
      host = "localhost",
      port = 5678,
    },
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(),
        remoteRoot = "/app",  -- container app directory
      },
    },
  },
}
