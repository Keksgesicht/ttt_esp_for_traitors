local traitors = {}
local detectives = {}

local c_traitor = Color(255, 0, 0)
local c_dete 	= Color(0, 0, 255)

net.Receive("Traitors", function()
	table.Empty(traitors) 
	traitors = net.ReadTable()
end)

hook.Add( "PreDrawHalos", "TraitorHalos", function()
	if LocalPlayer():GetRole() == ROLE_TRAITOR and LocalPlayer():Alive() then
		if table.Count(traitors) > 0 then
			halo.Add(traitors, c_traitor, 1, 1, 10, true, true )
		end
	end
end )

net.Receive("Dete", function()
	table.Empty(detectives)
	detectives = net.ReadTable()
end)

hook.Add( "PreDrawHalos", "DeteHalos", function()
	if LocalPlayer():GetRole() == ROLE_DETECTIVE and LocalPlayer():Alive() then
		if table.Count(detectives) > 0 then
			halo.Add(detectives, c_dete, 1, 1, 10, true, true )
		end
	end
end)