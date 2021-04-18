

    --anusernamecool/fuckthisshit v1.0
        -- These settings below are the configuration for the script.
        local debug = false -- Set to true to see extra details. 	Default = false
        local recoil = false -- This is what the recoil defaults to at script start. true = on, false = off.	 Default = off
        local Y_LEVEL = 1-- <---- Default vertical pull. Do not set to 0. 	Default = 1
        local Delay = 21 -- <---- Default delay on startup. Set between 1-100. 	Default = 1
         
        -- Do not touch these below if you do not know what you are doing!
        local time;local timeend = 0;local timeendlast = 0;local rsleep = 50;local smoothinglimit = 1;local smoothinglimit2 = 2;local recoil_string = "OFF.";local VERTMIN = 0;local VERTMAX = 10;local DELAYMIN = 1;local DELAYMAX = 100;local power = 1;local firstinterval = 0;
        function OnEvent(event, arg)
        if (event == "PROFILE_ACTIVATED") then
        	EnablePrimaryMouseButtonEvents(true)
        OutputLogMessage("_________________________________________________\n")
        OutputLogMessage("|                                                                                                                |\n")
        OutputLogMessage("|     Fuckthisshit - Universal Humanizing Anti-Recoil Script     |\n")
        OutputLogMessage("|     Made by anusernamecool                                                                          |\n")
        OutputLogMessage("|                                                                                                                |")
        OutputLogMessage("\n_________________________________________________\n")
        OutputLogMessage("\n\n")
        	OutputLogMessage("Loading Values.........................................\n")
        	Sleep(500)
        	ClearLog()
        end
     
        	if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
        		if(IsMouseButtonPressed(3)) then
        			repeat
        				if (recoil == true) then
        					time = GetRunningTime()
        							MoveMouseRelative(0,Y_LEVEL)
        							Sleep(Delay)
        					timeend = GetRunningTime()-time
        					ClearLog()
        					OutputLogMessage("This recoil macro runs in ")
        					OutputLogMessage(timeend)
        					OutputLogMessage("ms\n This number changing rapidly indicates that the recoil value is randomized!")
        				end
        			until (not IsMouseButtonPressed(1) or not IsMouseButtonPressed(3))
        			timeendlast = timeend
        		end
        	end
     
        OutputLogMessage("\n")
        OutputLogMessage("c[_] 	Version 1.2 beta\n")
        	if (event == "MOUSE_BUTTON_PRESSED") then
        		OutputLogMessage("You pressed Mouse-G")
        		OutputLogMessage(arg)
        	elseif(event == "MOUSE_BUTTON_RELEASED") then
        		OutputLogMessage("You released Mouse-G")
        		OutputLogMessage(arg)
        	end
     
        --[[if (event == "MOUSE_BUTTON_PRESSED" and arg == 10 and IsModifierPressed("shift") and IsKeyLockOn("numlock") == false) then
        	if (Y_LEVEL >= VERTMIN and Y_LEVEL <= (VERTMAX - 1)) then
        		Y_LEVEL = Y_LEVEL + 1
            end
          elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 11 and IsModifierPressed("shift") and IsKeyLockOn("numlock") == false) then
        	if (Y_LEVEL >= (VERTMIN + 1)) then
        		Y_LEVEL = Y_LEVEL - 1
            end]]--
        if (event == "MOUSE_BUTTON_PRESSED" and arg == 11 and not(IsModifierPressed("shift")) and not(IsModifierPressed("ctrl"))  and IsKeyLockOn("numlock") == false) then
        	   if (Delay >= DELAYMIN and Delay <= (DELAYMAX - 1)) then
        		Delay = Delay + 1
            end
        elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 10 and not(IsModifierPressed("shift")) and not(IsModifierPressed("ctrl")) and IsKeyLockOn("numlock") == false) then
        	   if (Delay >= (DELAYMIN + 1)) then
        		Delay = Delay - 1
            end
        elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 11 and IsModifierPressed("ctrl")  and IsKeyLockOn("numlock") == false) then
        	   if (Delay + 5 >= DELAYMIN and Delay <= (DELAYMAX - 5)) then
        		Delay = Delay + 5 
            end
        elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 10 and IsModifierPressed("ctrl")  and IsKeyLockOn("numlock") == false) then
        	   if (Delay >= (DELAYMIN + 5)) then
        		Delay = Delay - 5
            end
        end
     
        if (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
        	recoil = not recoil
        	if (recoil == true) then
        		recoil_string = ("ON")
        	else
        		recoil_string = ("OFF")
        	end
        end
        	ClearLog()
        	OutputLogMessage("#____________________________________________________________________________________________________________________________________#\n");
        	OutputLogMessage("     Anti-Recoil = ");
         OutputLogMessage(recoil_string);
        	OutputLogMessage(",                           Y_Level = ");
        	OutputLogMessage(Y_LEVEL);
        	OutputLogMessage(",                           Delay = ");
        	OutputLogMessage(Delay);
        	OutputLogMessage("/");
        	OutputLogMessage(DELAYMAX);
        	OutputLogMessage(",                           Power = ");
        	OutputLogMessage(power)
        	OutputLogMessage("\n#____________________________________________________________________________________________________________________________________#\n");
        	OutputLogMessage("\n   ");
        	OutputLogMessage("Controls: \n");
        	OutputLogMessage("-NUMLOCK on locks mouse wheel changes. \n");
        	OutputLogMessage("-G7 Toggles the Anti-Recoil on and off. \n");
        	OutputLogMessage("-Mouse Wheel Left [G11] + Right [G10] change the delay between mouse events. See 'Delay' - This decreases and increases strength on a very small level in (Millisecs). Right increases and Left decreases.\n");
        	OutputLogMessage("-CTRL + Mouse Wheel Left [G11] + Right [G10] changes the delay in increments of 5.")
        	OutputLogMessage("This script is fixed with a humanizer and smoother. It is not Moss proof but will prevent bans from discovery. This script does not compensate for horizontal recoil either.")
    end
