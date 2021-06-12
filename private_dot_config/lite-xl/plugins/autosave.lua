-- mod-version:1 -- lite-xl 1.16
local core = require "core"
local config = require "core.config"
local Doc = require "core.doc"
local DocView = require "core.docview"
local command = require "core.command"
-- this is used to detect the wait time
local last_keypress = os.time()
-- this exists so that we don't end up with multiple copies of the loop running at once
local looping = false
local on_text_change = Doc.on_text_change
-- the approximate amount of time, in seconds, that it takes to trigger an autosave
config.autosave_timeout = 1


local function loop_for_save()
    while looping do
      if os.difftime(os.time(), last_keypress) >= config.autosave_timeout then
        command.perform "doc:save"
        -- stop loop
        looping = false
      end
      -- wait the timeout. may cause timeout to be slightly imprescise
      coroutine.yield(config.autosave_timeout) 
    end
end


local function updatepress()
  -- set last keypress time to now
  last_keypress = os.time()
  -- put loop in coroutine so it doesn't lag out this script
  if not looping then
    looping = true
    core.add_thread(loop_for_save)
  end
end


function Doc:on_text_change(type)
  -- check if file is saved
  if self.filename then
    updatepress()
  end
  return on_text_change(type)
end
