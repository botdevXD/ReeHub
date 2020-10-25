local LIB = {}
function LIB:FindFunc(v1, v23)
    for i,v in pairs(getgc(true)) do
        if type(v) == "function" and islclosure(v) then
            for i2,v2 in next, debug.getupvalues(v) do
                if type(v2) == "table" and rawget(v2, v1) then
                    return v2[v1];
                else
                    v23[v1] = nil
                end;
            end;
        end;
    end;
end;

--quick fix for Coco Z3
local FIX_FOR_COCO = (coco and "Coco") or (COCO_LOADED and "Coco")

function LIB:SetFunction(OldFunction, NewFunction)
    if (FIX_FOR_COCO) then
        for i,v in pairs(getgc(true)) do
            if type(v) == "function" and islclosure(v) then
                for i2,v2 in next, debug.getupvalues(v) do
                    if type(v2) == "table" and rawget(v2, OldFunction) then
                        v2[OldFunction] = NewFunction
                    end;
                end;
            end;
        end;
    else
        for i,v in pairs(getreg()) do
            if type(v) == "function" and islclosure(v) then
                for i2,v2 in next, debug.getupvalues(v) do
                    if type(v2) == "table" and rawget(v2, OldFunction) then
                        v2[OldFunction] = NewFunction
                    end;
                end;
            end;
        end;
   	end
end

return LIB