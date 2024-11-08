
function CheckVictory(ScenarioInfo)

    local categoryCheck = false
	local victoryTime = false
	
    if ScenarioInfo.Options.Victory == 'demoralization' then
        -- Assassination - A player is defeated when the Commander is destroyed.
        categoryCheck = categories.COMMAND
		
	elseif ScenarioInfo.Options.Victory == 'decapitation' then
		-- Advanced Assassination - A player is defeated when the Commander and all Support Commanders are destroyed.
		categoryCheck = categories.COMMAND + categories.SUBCOMMANDER
		
    elseif ScenarioInfo.Options.Victory == 'domination' then
        -- Supremacy - A player is defeated when all engineers, factories and any unit that can build an engineer are destroyed.
        categoryCheck = categories.ENGINEER + categories.FACTORY + categories.MOBILEBUILDERONLY + categories.SUPREMACY - categories.CARRIER - categories.HEAVYWALLGATE - categories.RESEARCHCENTRE - categories.NONSUPREMACY
	
    elseif ScenarioInfo.Options.Victory == 'eradication' then
        -- Annihilation - A player is defeated when all structures (except walls) and all units are destroyed.
        categoryCheck = categories.ALLUNITS - categories.WALL
	
    else
        -- Sandbox -- No player can ever be defeated.
        categoryCheck = false
    end
	
	-- if not sandbox check for time limit --
	if categoryCheck and ScenarioInfo.Options.TimeLimitSetting != "0" then
		
		victoryTime = tonumber(ScenarioInfo.Options.TimeLimitSetting) * 60
		
		ScenarioInfo.VictoryTime = victoryTime
		
		LOG("*AI DEBUG Launching CheckVictory for "..repr(ScenarioInfo.Options.Victory).." and "..repr(victoryTime).." Seconds Time Limit")
		
	else
	
		ScenarioInfo.VictoryTime = false
		
		LOG("*AI DEBUG Launching CheckVictory for "..repr(ScenarioInfo.Options.Victory))

	end
	

    local potentialWinners = {}
	
    local WaitTicks = coroutine.yield
	local IsAlly = IsAlly
	
	--local GetCurrentUnits = moho.aibrain_methods.GetCurrentUnits
	local GetListOfUnits = moho.aibrain_methods.GetListOfUnits
    
    local BRAINS = ArmyBrains
	
    while categoryCheck do
	
        WaitTicks(200)	-- loop every 20 seconds (was 6.5)
	
        -- Look for newly defeated brains and tell them they're dead
        local stillAlive = {}
		local counter = 0
		
        for index,brain in BRAINS do
		
            if not ArmyIsOutOfGame( brain.ArmyIndex ) and not ArmyIsCivilian( brain.ArmyIndex ) then
			
				local validunits = GetListOfUnits( brain, categoryCheck, false )
				
                if not validunits[1] then

					-- kill all units
					local killacu = brain:GetListOfUnits(categories.ALLUNITS, false)
			
					for index,unit in killacu do
						unit:Kill()
					end
					
                    brain:OnDefeat()
					
                    CallEndGame(false, true)
					
					ArmyBrains[index] = nil
					
                else
					counter = counter + 1
                    stillAlive[counter] = brain

                end
            end
        end

        -- uh-oh, there is nobody alive... It's a draw.
        if table.empty(stillAlive) then
            CallEndGame(true, false)
            return
        end

        -- check to see if everyone still alive is allied and is requesting an allied victory.
        local win = true
        local draw = true

		-- win will only be true if everyone alive is allied
        for index,brain in stillAlive do
		
            for index2,other in stillAlive do
			
                if index != index2 then
				
                    if not brain.RequestingAlliedVictory or not IsAlly( brain.ArmyIndex, other.ArmyIndex ) then
                        win = false
						break
                    end
                end
            end
            if not brain.OfferingDraw then
                draw = false
            end
			if not win then
				break
			end
        end

        if win then
			-- this can never execute the first time thru as
			-- potentialWinners will be blank
            if table.equal(stillAlive, potentialWinners) then
			
                if GetGameTimeSeconds() > victoryTime then
                    #-- It's a win!
                    for index,brain in stillAlive do
                        brain:OnVictory()
                    end
					
                    CallEndGame(true, true)
					
                    return
					
                end
			
			-- so the first time thru here we set up a victoryTime and
			-- we set the potentialWinners list to be the same as those
			-- who are left alive
            else
			
                victoryTime = GetGameTimeSeconds() + 15
				
                potentialWinners = stillAlive
				
            end
			
        elseif draw or (victoryTime and GetGameTimeSeconds() > victoryTime) then
		
            for index,brain in stillAlive do
                brain:OnDraw()
            end
			
            CallEndGame(true, true)
            return
			
        else
            potentialWinners = {}
			
			if victoryTime and (GetGameTimeSeconds()+300) >victoryTime then
				PrintText( 'The game will end in '..repr(math.floor(victoryTime - GetGameTimeSeconds()))..' seconds', 18, 'ffffffff', 4, 'center')
			end
        end
    end
	
end

function CallEndGame(callEndGame, submitXMLStats)
    if submitXMLStats then
        SubmitXMLArmyStats()
    end
    if callEndGame then
        gameOver = true
        ForkThread(function()
            WaitSeconds(3)
            EndGame()
        end)
    end
end

gameOver = false