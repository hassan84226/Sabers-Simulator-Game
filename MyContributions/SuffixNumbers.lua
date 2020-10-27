-- Suffix Service
-- Hassan El-Sheikha
-- May 17, 2019

local SuffixService = {}

local SUFFICES =
{
    'K', 'M', 'B', 'T', 'Qa', 'Qi', 'Sx', 'Sp', 'Oc', 'No', 'Dc', 'Ud',
    'Dd', 'Td', 'Qad', 'Qid', 'Sxd', 'Spd', 'Od', 'Nd', 'V', 'Uv', 'Dv',
    'Tv', 'Qav', 'Qiv', 'Sxv', 'Spv', 'Ov', 'Nv', 'Tt',
}

function SuffixService.Suffix(Number)
	if Number < 100000 then return Number end
	
	local Dec = math.floor(math.log10(Number))
	Dec = math.floor(Dec / 3)
	local Str = "%.2f" .. SUFFICES[Dec]
	
	return string.format(Str, Number / 1000 ^ Dec)
end

return SuffixService