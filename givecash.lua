ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand('givecash', function(source, args)
    soruce = src
    local xPlayer = ESX.GetPlayerFromId(source)
    target = args[1]
	transferamount = args[2]
    playercash = xPlayer.getMoney()
    numberammount = tonumber(transferamount)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if(GetPlayerName(tonumber(args[1])))then
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Incorrect Player ID', length = 2500, style = { ['background-color'] = '#0321FF', ['color'] = '#ffffff' } })  
        return
    end
    if tonumber(transferamount) not == 0 then
        if playercash >= tonumber(transferamount) then
            xPlayer.removeMoney(transferamount)
            targetXPlayer.addMoney(transferamount)
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Your Sent Cash:₹ '..transferamount, length = 2500, style = { ['background-color'] = '#0321FF', ['color'] = '#ffffff' } })  
            TriggerClientEvent('mythic_notify:client:SendAlert', target, { type = 'inform', text = 'You Recived Cash:₹ '..transferamount, length = 2500, style = { ['background-color'] = '#0321FF', ['color'] = '#ffffff' } })  
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You Dont Have Enough Money', length = 2500, style = { ['background-color'] = '#0321FF', ['color'] = '#ffffff' } })  
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You Cant Send 0 ₹', length = 2500, style = { ['background-color'] = '#0321FF', ['color'] = '#ffffff' } })  
    end
end)
