util.AddNetworkString("Traitors")
util.AddNetworkString("Dete")

hook.Add("Tick","GetAndSendTraitors",function()

	local traitos = {}
	local detes = {}

	for k, v in pairs(player.GetAll()) do
		if v:IsValid() and v:Alive() then
			if v:GetRole() == ROLE_TRAITOR then
				table.insert(traitos,v)
			end

			if v:GetRole() == ROLE_DETECTIVE then
				table.insert(detes,v)
			end
		end
	end

	for _, ent in pairs( ents.FindByClass( "prop_ragdoll" )) do
		if IsValid(ent) then
			if ent.was_role == ROLE_TRAITOR then
				table.insert(traitos,ent)
			end
		
			if ent.was_role == ROLE_DETECTIVE then
				table.insert(detes,ent)
			end
		end
	end

	for k, v in pairs(traitos) do
		if v:IsPlayer() then
			net.Start("Traitors")
			net.WriteTable(traitos)
			net.Send(v)
		end
	end

	for k, v in pairs(detes) do
		if v:IsPlayer() then
			net.Start("Dete")
			net.WriteTable(detes)
			net.Send(v)
		end
	end

end)