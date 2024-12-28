local waitingCallbacks = {}

function GenerateString(length)
    local id = ""
    for _ = 1, length or 7 do
        local char = math.random(1, 2) == 1 and string.char(math.random(97, 122)) or tostring(math.random(0, 9))
        if math.random(1, 2) == 1 then
            char = string.upper(char)
        end
        id = id .. char
    end
    return id
end


function GenerateUniqueKey(t, length)
    local id = GenerateString(length)

    if not t[id] then
        return id
    else
        return GenerateUniqueKey(t, length)
    end
end


function functions.TriggerCallback(callback, cb, ...)
    local requestId = GenerateUniqueKey(waitingCallbacks)
    waitingCallbacks[requestId] = cb
    TriggerServerEvent("HapticLib:trigger_callback", callback, requestId, ...)
end
functions.TriggerCallbackAsync = functions.TriggerCallback

function functions.TriggerCallbackSync(callback, ...)
    local requestId = GenerateUniqueKey(waitingCallbacks)
    local toreturn

    local promise = promise.new()
    waitingCallbacks[requestId] = function(...)
        toreturn = { ... }
        promise:resolve()
    end
    TriggerServerEvent("HapticLib:trigger_callback", callback, requestId, ...)
    Citizen.Await(promise)

    return table.unpack(toreturn)
end

RegisterNetEvent("HapticLib:callback_result", function(requestId, ...)
    if waitingCallbacks[requestId] then
        waitingCallbacks[requestId](...)
        waitingCallbacks[requestId] = nil
    end
end)