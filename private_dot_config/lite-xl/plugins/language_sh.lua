-- mod-version:2 -- lite-xl 2.0
local syntax = require "core.syntax"

syntax.add {
  name = "Shell script",
  files = { "%.sh$" },
  headers = "^#!.*bin.*sh\n",
  comment = "#",
  patterns = {
    -- $# is a bash special variable and the '#' shouldn't be interpreted
    -- as a comment.
    { pattern = "$[%a_@*#][%w_]*",        type = "keyword2" },
    { pattern = "${.-}",                  type = "keyword2" },
    { pattern = "#.*\n",                  type = "comment"  },
    { pattern = [[\.]],                   type = "normal"   },
    { pattern = { '"', '"', '\\' },       type = "string"   },
    { pattern = { "'", "'", '\\' },       type = "string"   },
    { pattern = { '`', '`', '\\' },       type = "string"   },
    { pattern = "%f[%w_][%d%.]+%f[^%w_]", type = "number"   },
    { pattern = "[!<>|&%[%]=*]",          type = "operator" },
    { pattern = "%f[%S]%-[%w%-_]+",       type = "function" },
    { pattern = "[%a_][%w_]*",            type = "symbol"   },
  },
  symbols = {
    ["case"]     = "keyword",
    ["do"]       = "keyword",
    ["done"]     = "keyword",
    ["elif"]     = "keyword",
    ["else"]     = "keyword",
    ["esac"]     = "keyword",
    ["fi"]       = "keyword",
    ["for"]      = "keyword",
    ["function"] = "keyword",
    ["if"]       = "keyword",
    ["in"]       = "keyword",
    ["select"]   = "keyword",
    ["then"]     = "keyword",
    ["time"]     = "keyword",
    ["until"]    = "keyword",
    ["while"]    = "keyword",
    ["echo"]     = "keyword",
    ["true"]     = "literal",
    ["false"]    = "literal",
  },
}

