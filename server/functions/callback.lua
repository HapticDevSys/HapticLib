local callbacks = {}

function functions.RegisterCallback(callback, cb)
    callbacks[callback] = cb
end

RegisterNetEvent("HapticLib:trigger_callback", function(callback, requestId, ...)
    local src = source
    if callbacks[callback] then
        callbacks[callback](src, function(...)
            TriggerClientEvent("HapticLib:callback_result", src, requestId, ...)
        end, ...)
    end
end)