-- Modify how crude oil wells work. Wells now require drilling to create.
data.raw.resource["crude-oil"].minimum = 7500 		-- Increase the minimum to 10% of the new normal amount	
data.raw.resource["crude-oil"].normal = 75000		-- Increase amount per well
data.raw.resource["crude-oil"].autoplace = nil		-- Disable well generation on the map